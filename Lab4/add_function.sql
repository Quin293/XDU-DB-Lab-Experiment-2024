USE banking;

CREATE TABLE payment (
    loan_number INT,
    payment_number INT,
    payment_datetime DATETIME,
    payment_amount DECIMAL(10, 2),
    PRIMARY KEY (loan_number, payment_number),
    FOREIGN KEY (loan_number) REFERENCES loan(loan_number)
);

ALTER TABLE loan
ADD pay_remain DECIMAL(10, 2) DEFAULT 0,  -- 类型与balance相同
ADD PayOver_Date DATE;

DELIMITER //

CREATE TRIGGER pay_remaining
AFTER INSERT ON payment
FOR EACH ROW
BEGIN
    DECLARE remaining DECIMAL(10, 2);
    
    -- 计算剩余金额
    SET remaining = (SELECT pay_remain FROM loan WHERE loan_number = NEW.loan_number) - NEW.payment_amount;
    
    -- 更新贷款表中的 pay_remain 列
    UPDATE loan 
    SET pay_remain = remaining 
    WHERE loan_number = NEW.loan_number;
    
    -- 如果剩余金额小于等于 0，更新还清日期
    IF remaining <= 0 THEN
        UPDATE loan 
        SET PayOver_Date = CURDATE()
        WHERE loan_number = NEW.loan_number;
    END IF;
    
    -- 检查剩余金额不能为负数，触发回滚
    IF remaining < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Remaining balance cannot be negative.';
    END IF;
END //

DELIMITER ;
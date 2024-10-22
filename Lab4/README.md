在Banking数据库上增加还款功能，要求：
 1）创建还款表 ：payment( loan_number,  payment_number, payment_datetime, payment_amount ) ，其中payment_datetime数据类型为DATETIME；
 2）修改贷款表 loan，增加列pay_remain（数据类型同balance），用于记录每次还款后的剩余待还金额（>=0）；增加一列 PayOver_Date（数据类型为DATE）用于记录还款完成的日期；
 3) 编写还款表上的触发器程序pay_remaining，要求每笔还款完成后，将贷款表的pay_remain列值修改为实际的剩余待还金额。（此处要考虑出错回滚代码）

DELIMITER ;;

/*!50003 CREATE*/ /*!50020 DEFINER=`test`@`localhost`*/ /*!50003 PROCEDURE `Test_Procedure`(

p_OperatorID INTEGER,

p_BillUpdatedID INTEGER,

p_Discount FLOAT

)

BEGIN

INSERT INTO PMRT.PMRT_BillingTransactions (DATETIME, OperatorID, TypeID, SubTypeID, BillID, Amount)

    VALUES (NOW(),p_OperatorID, 6, 5,p_BillID,p_Discount);

END */;;

DELIMITER ;

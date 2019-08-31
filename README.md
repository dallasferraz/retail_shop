# retail_shop
A public MySQL database I used for a small retail shop project developed with my associate in 2017. I filled the tables with dummy data for a better comprehension of how the system works. Feel free to modify it and use it as you please.

It is important to notice that the business rule tasks present in the stored procedure, trigger and custom function in this database are being displayed as examples. There are possibly other ways to accomplish the same tasks in a more efficient fashion. The structure of the database is designed as seen below:

![retail shop panorama](https://raw.githubusercontent.com/dallasferraz/retail_shop/master/mysqlmodel.png)

Both *sale* and *sale_item* store information about the actual sale, such as the date, payment option, volume of transaction, which products were sold and how many of each and so on. The table *employee* holds information about the company's personnel (password, role etc), *inventory_records* informs us which item was replenished by the suppliers or is selling more. Finally, *product* displays not only information about the item, such as vending price and cost, but also about the supplier.

As for the custom trigger shown below, it is responsible for keeping the stock positive, or at least zero, instead of allowing the sale to keep going even with no more items a certain type in inventory:

![trigger code](https://raw.githubusercontent.com/dallasferraz/retail_shop/master/zeroinventorytrigger.png)

The chunk of code below displays the function used for a general overview on the overall aquisition cost of a certain item:

```mysql
CREATE DEFINER=`root`@`localhost` FUNCTION `calculatedCosts`(productID INT(10)) RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE totalCost FLOAT(10,2);
    DECLARE unitCost FLOAT(10,2);
    DECLARE quantity INT(10);
    
    SET quantity = (SELECT SUM(`sale_item`.`quantity`) FROM `sale_item` WHERE `sale_item`.`fk_idProduct` = productID);
    SET unitCost = (SELECT `product`.`cost` FROM `product` WHERE `product`.`idProduct` = productID);
    SET totalCost = unitCost * quantity;
    
    RETURN totalCost;
END
```

And this chunk of code below demonstrates how it is possible to warn the user about missing values during the sale:

```mysql
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkData`(saleDate DATE,totalBefore DOUBLE,priceDiscount DOUBLE,cashAmount DOUBLE,creditCardAmount DOUBLE,checkAmount DOUBLE,checkDate VARCHAR(20),checkName VARCHAR(70),totalAfter DOUBLE,employeeID INT(10))
BEGIN
        DECLARE warningMessage VARCHAR(26);
		
		IF (((checkDate = '' OR checkName = '' OR checkDate IS NULL OR checkName IS NULL) AND checkAmount = 0) AND (cashAmount = 0) AND (creditCardAmount = 0)) THEN
			SET warningMessage = "Please fill all the fields";
		ELSE
			INSERT INTO `sale` (`sale_date`,`total_before`,`discount`,`cash`,`credit_card`,`check`,`check_date`,`check_name`,`total_after`,`fk_idEmployee`) VALUES (saleDate,totalBefore,priceDiscount,cashAmount,creditCardAmount,checkAmount,checkDate,checkName,totalAfter,employeeID);
			SET warningMessage = "Sale completed";
		END IF;
END
```
ALTER TABLE `ticket`.`departure` 
ADD COLUMN `dstartname` VARCHAR(45) NULL AFTER `dticket`,
ADD COLUMN `dthewayname` VARCHAR(45) NULL AFTER `dstartname`,
ADD COLUMN `dthewaytime` VARCHAR(45) NULL AFTER `dthewayname`,
ADD COLUMN `dtakeprice` VARCHAR(45) NULL AFTER `dthewaytime`,
ADD COLUMN `dtype` VARCHAR(45) NULL AFTER `dtakeprice`,
ADD COLUMN `ddistance` VARCHAR(45) NULL AFTER `dtype`;

ALTER TABLE `ticket`.`departure` 
CHANGE COLUMN `dstartname` `dstartname` VARCHAR(500) NULL DEFAULT NULL ,
CHANGE COLUMN `dthewayname` `dthewayname` VARCHAR(500) NULL DEFAULT NULL ,
CHANGE COLUMN `dthewaytime` `dthewaytime` VARCHAR(500) NULL DEFAULT NULL ,
CHANGE COLUMN `dtakeprice` `dtakeprice` VARCHAR(500) NULL DEFAULT NULL ,
CHANGE COLUMN `dtype` `dtype` VARCHAR(500) NULL DEFAULT NULL ,
CHANGE COLUMN `ddistance` `ddistance` VARCHAR(500) NULL DEFAULT NULL ;

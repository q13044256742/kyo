ALTER TABLE `ticket`.`departure` 
ADD COLUMN `dstartname` VARCHAR(45) NULL AFTER `dticket`,
ADD COLUMN `dthewayname` VARCHAR(45) NULL AFTER `dstartname`,
ADD COLUMN `dthewaytime` VARCHAR(45) NULL AFTER `dthewayname`,
ADD COLUMN `dtakeprice` VARCHAR(45) NULL AFTER `dthewaytime`,
ADD COLUMN `dtype` VARCHAR(45) NULL AFTER `dtakeprice`,
ADD COLUMN `ddistance` VARCHAR(45) NULL AFTER `dtype`;
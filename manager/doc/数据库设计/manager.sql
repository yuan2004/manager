DROP TABLE `manager`.`M_USER_INFO`;
CREATE  TABLE IF NOT EXISTS `manager`.`M_USER_INFO` (
  `LOGINNAME` VARCHAR(100) NULL PRIMARY KEY,
  `PASSWORD` VARCHAR(100) NULL ,
  `ROLE` INT NULL ,
  `STATUS` INT NULL ,
  `NAME` VARCHAR(100) NULL ,
  `EMPLOYEEID` VARCHAR(100) NULL ,
  `POSITION` VARCHAR(100) NULL ,
  `TEL` VARCHAR(20) NULL ,
  `BIRTHDAY` DATETIME NULL ,
  `PHOTO` VARCHAR(100) NULL ,
  `REGISTERDATE` DATETIME NULL ,
  `REGISTERUSER` VARCHAR(100) NULL ,
  `MODIFYDATE` DATETIME NULL ,
  `MODIFYUSER` INT NULL ,
  `COMMENT` VARCHAR(500) NULL )
ENGINE = InnoDB;

insert into M_USER_INFO(loginname, password, role, status, name) values('admin', 'admin', 0, 1, '��������Ա');

DROP TABLE `manager`.`M_GIFT_INFO`;
CREATE  TABLE IF NOT EXISTS `manager`.`M_GIFT_INFO` (
  `GIFTID` VARCHAR(100) NOT NULL PRIMARY KEY,
  `GIFTNAME` VARCHAR(200) NULL ,
  `RESERVE` INT NULL ,
  `SCORE` INT NULL ,
  `PHOTO` VARCHAR(100) NULL ,
  `REGISTERDATE` DATETIME NULL ,
  `REGISTERUSER` VARCHAR(100) NULL ,
  `MODIFYDATE` DATETIME NULL ,
  `MODIFYUSER` VARCHAR(100) NULL,  
  `COMMENT` VARCHAR(500) NULL )
ENGINE = InnoDB;

DROP TABLE `manager`.`M_SHOP_INFO`;
CREATE  TABLE IF NOT EXISTS `manager`.`M_SHOP_INFO` (
  `SHOPiD` INT NOT NULL auto_increment PRIMARY KEY,
  `SHOPNAME` VARCHAR(200) NULL ,
  `BRAND` VARCHAR(100) NULL ,
  `CONTACTUSER` VARCHAR(100) NULL ,
  `TEL` VARCHAR(20) NULL ,
  `REGISTERDATE` DATETIME NULL ,
  `REGISTERUSER` VARCHAR(100) NULL ,
  `MODIFYDATE` DATETIME NULL ,
  `MODIFYUSER` VARCHAR(100) NULL ,
  `COMMENT` VARCHAR(500) NULL  )
ENGINE = InnoDB;

DROP TABLE `manager`.`M_SHOP_LOCATION`;
CREATE  TABLE IF NOT EXISTS `manager`.`M_SHOP_LOCATION` (
  `LOCATIONID` INT NOT NULL auto_increment PRIMARY KEY,
  `LOCATIONNO` VARCHAR(100) NULL ,
  `SHOPID` INT NULL ,
  `REGISTERDATE` DATETIME NULL ,
  `REGISTERUSER` VARCHAR(100) NULL,
  `COMMENT` VARCHAR(500) NULL )
ENGINE = InnoDB;

DROP TABLE `manager`.`M_SHOP_BRAND`;
CREATE  TABLE IF NOT EXISTS `manager`.`M_SHOP_BRAND` (
  `BRANDID` INT NOT NULL auto_increment PRIMARY KEY,
  `BRAND` VARCHAR(100) NULL ,
  `SHOPID` INT NULL ,
  `REGISTERDATE` DATETIME NULL ,
  `REGISTERUSER` VARCHAR(100) NULL ,
  `COMMENT` VARCHAR(500) NULL )
ENGINE = InnoDB;

DROP TABLE `manager`.`M_MEMBER_INFO`;
CREATE  TABLE IF NOT EXISTS `manager`.`M_MEMBER_INFO` (
  `MEMBERID` INT NOT NULL auto_increment PRIMARY KEY,
  `STATUS` INT NULL ,
  `CARDID` VARCHAR(100) NULL ,
  `SCORE` INT NULL ,
  `NAME` VARCHAR(100) NULL ,
  `SEX` INT NULL ,
  `BIRTHDAY` DATETIME NULL ,
  `AGE` INT NULL ,
  `IDNO` VARCHAR(100) NULL ,
  `EXCHANGECODE` VARCHAR(100) NULL ,
  `REQUIREMENT` INT NULL ,
  `MOBILE` VARCHAR(20) NULL ,
  `TEL` VARCHAR(20) NULL ,
  `OCCUPATION` VARCHAR(100) NULL ,
  `EMAIL` VARCHAR(100) NULL ,
  `ADDRESS` VARCHAR(200) NULL ,
  `ACCEPT` INT NULL ,
  `REGISTERDATE` DATETIME NULL ,
  `REGISTERUSER` VARCHAR(100) NULL ,
  `COMMENT` VARCHAR(500) NULL ,
  `VERIFYSTATUS` INT NULL ,
  `VERIFIER` VARCHAR(100) NULL,
  `ISNEW` VARCHAR(1) NULL )
ENGINE = InnoDB;

CREATE UNIQUE INDEX U_MEMBER_CARDID ON M_MEMBER_INFO(CARDID);
CREATE UNIQUE INDEX U_MEMBER_IDNO ON M_MEMBER_INFO(IDNO);
drop INDEX U_MEMBER_IDNO on M_MEMBER_INFO;

DROP TABLE `manager`.`M_SCORE_LINE`;
CREATE  TABLE IF NOT EXISTS `manager`.`M_SCORE_LINE` (
  `RECORDID` INT NOT NULL auto_increment PRIMARY KEY,
  `MEMBERID` INT NULL ,
  `SHOPID` INT NULL ,
  `LOCATIONID` INT NULL ,
  `BRAND` VARCHAR(100) NULL ,
  `AMOUNT` INT NULL ,
  `SCORE` INT NULL ,
  `COMMENT` VARCHAR(500) NULL ,
  `RECORDDATE` DATETIME NULL ,
  `USERID` VARCHAR(100) NULL ,
  `STATUS` INT NULL ,
  `VERIFYSTATUS` INT NULL ,
  `VERIFIER` VARCHAR(100) NULL )
ENGINE = InnoDB;

DROP TABLE `manager`.`M_SCORE_MODIFY`;
CREATE  TABLE IF NOT EXISTS `manager`.`M_SCORE_MODIFY` (
  `MODIFYID` INT NOT NULL auto_increment PRIMARY KEY,
  `RECORDID` INT NULL ,
  `MEMBERID` INT NULL ,
  `SHOPID` INT NULL ,
  `LOCATIONID` INT NULL ,
  `BRAND` VARCHAR(100) NULL ,
  `AMOUNT` INT NULL ,
  `SCORE` INT NULL ,
  `COMMENT` VARCHAR(500) NULL ,
  `MODIFYDATE` DATETIME NULL ,
  `USERID` VARCHAR(100) NULL ,
  `STATUS` INT NULL ,
  `VERIFYSTATUS` INT NULL ,
  `VERIFIER` VARCHAR(100) NULL  )
ENGINE = InnoDB;

DROP TABLE `manager`.`M_EXCHANGE_LINE`;
CREATE  TABLE IF NOT EXISTS `manager`.`M_EXCHANGE_LINE` (
  `RECORDID` INT NOT NULL auto_increment PRIMARY KEY,
  `MEMBERID` INT NULL ,
  `GIFTID` varchar(100) NULL ,
  `COMMENT` VARCHAR(500) NULL ,
  `SCORE` INT NULL ,
  `RECORDDATE` DATETIME NULL ,
  `USERID` VARCHAR(100) NULL ,
  `STATUS` INT NULL ,
  `VERIFYSTATUS` INT NULL ,
  `VERIFIER` VARCHAR(100) NULL  )
ENGINE = InnoDB;



DROP TABLE `manager`.`M_LOSS_REPORT`;
CREATE  TABLE IF NOT EXISTS `manager`.`M_LOSS_REPORT` (
  `RECORDID` INT NOT NULL auto_increment PRIMARY KEY,
  `MEMBERID` INT NULL ,
  `TYPE` INT NULL ,
  `CARDID` VARCHAR(100) NULL ,
  `COMMENT` VARCHAR(500) NULL ,
  `RECORDDATE` DATETIME NULL ,
  `USERID` VARCHAR(100) NULL ,
  `STATUS` INT NULL ,
  `VERIFYSTATUS` INT NULL ,
  `VERIFIER` VARCHAR(100) NULL )
ENGINE = InnoDB;



DROP TABLE `manager`.`M_TICKET_RECORD`;
CREATE  TABLE IF NOT EXISTS `manager`.`M_TICKET_RECORD` (
  `RECORDID` INT NOT NULL auto_increment PRIMARY KEY,
  `CARDID` VARCHAR(100) NULL ,
  `GIFTNAME` VARCHAR(200) NULL ,
  `COUNT` INT NULL ,
  `SCORE` INT NULL ,
  `BALANCESCORE` INT NULL ,
  `USERID` VARCHAR(100) NULL ,
  `STATUS` INT NULL,
  `PRINTDATE` DATETIME NULL)
ENGINE = InnoDB;

DROP TABLE `manager`.`M_SMS_RECORD`;
CREATE  TABLE IF NOT EXISTS `manager`.`M_SMS_RECORD` (
  `ID` INT NOT NULL auto_increment PRIMARY KEY,
  `FLAG` VARCHAR(100) NULL ,
  `MEMBERNAME` VARCHAR(200) NULL ,
  `MOBILE` VARCHAR(100) NULL ,
  `SMS` VARCHAR(1000) NULL ,
  `ITEM01` VARCHAR(100) NULL ,
  `ITEM02` VARCHAR(100) NULL)
ENGINE = InnoDB;

DROP TABLE `manager`.`M_GIFT_RECORD`;
CREATE  TABLE IF NOT EXISTS `manager`.`M_GIFT_RECORD` (
  `RECORDID` INT NOT NULL auto_increment PRIMARY KEY,
  `GIFTID` VARCHAR(100) NULL,
  `GIFTNAME` VARCHAR(200) NULL ,
  `RESERVE` INT NULL ,
  `SCORE` INT NULL ,
  `PHOTO` VARCHAR(100) NULL ,
  `REGISTERDATE` DATETIME NULL ,
  `REGISTERUSER` VARCHAR(100) NULL ,
  `MODIFYDATE` DATETIME NULL ,
  `MODIFYUSER` VARCHAR(100) NULL,  
  `COMMENT` VARCHAR(500) NULL )
ENGINE = InnoDB;

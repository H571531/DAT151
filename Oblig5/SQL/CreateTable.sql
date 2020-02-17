CREATE TABLE IF NOT EXISTS `Oblig5`.`ImportTable` (
  `idtable1` INT NOT NULL,
  `regno` VARCHAR(45) NULL,
  `timestamp` DATETIME NULL,
  `idTollstation` VARCHAR(45) NULL,
  `tollname` VARCHAR(45) NULL,
  `OwnerName` VARCHAR(45) NULL,
  `taxDesc` VARCHAR(45) NULL,
  `ImportTablecol` ENUM('Yes', 'No') NULL,
  `TollSFee` INT(11) NULL,
  `SubFee` INT(11) NULL,
  PRIMARY KEY (`idtable1`))
ENGINE = MyISAM;

CREATE TABLE IF NOT EXISTS `Oblig5`.`Tollstation` (
  `idTollstation` SMALLINT UNSIGNED NOT NULL,
  `name` VARCHAR(85) NULL,
  PRIMARY KEY (`idTollstation`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Oblig5`.`TaxClass` (
  `idTaxClass` SMALLINT UNSIGNED NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`idTaxClass`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `oblig5`.`Fee` (
  `idFee` SMALLINT NOT NULL,
  `taxclass` SMALLINT UNSIGNED NOT NULL,
  `type` ENUM('regular', 'withsubscription') NOT NULL,
  `costPerPassing` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`idFee`),
  INDEX `fk_TaxPassing_TaxClass1_idx` (`taxclass` ASC) VISIBLE,
  CONSTRAINT `fk_TaxPassing_TaxClass1`
    FOREIGN KEY (`taxclass`)
    REFERENCES `Oblig5`.`TaxClass` (`idTaxClass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `oblig5`.`Car` (
  `regno` CHAR(7) NOT NULL,
  `owner` VARCHAR(85) NULL,
  `taxclass` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`regno`),
  INDEX `fk_Car_TaxClass1_idx` (`taxclass` ASC) VISIBLE,
  CONSTRAINT `fk_Car_TaxClass1`
    FOREIGN KEY (`taxclass`)
    REFERENCES `Oblig5`.`TaxClass` (`idTaxClass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `oblig5`.`Passing` (
  `regno` CHAR(7) NOT NULL,
  `timestamp` TIMESTAMP NOT NULL,
  `tollstation` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`regno`, `timestamp`),
  INDEX `fk_Passing_1_idx` (`tollstation` ASC) VISIBLE,
  INDEX `fk_Passing_Subscription1_idx` (`regno` ASC) VISIBLE,
  CONSTRAINT `fk_Passing_1`
    FOREIGN KEY (`tollstation`)
    REFERENCES `Oblig5`.`Tollstation` (`idTollstation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Passing_Subscription1`
    FOREIGN KEY (`regno`)
    REFERENCES `Oblig5`.`Car` (`regno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Oblig5`.`Subscription` (
  `regno` CHAR(7) NOT NULL,
  PRIMARY KEY (`regno`),
  CONSTRAINT `fk_Subscription_Car1`
    FOREIGN KEY (`regno`)
    REFERENCES `Oblig5`.`Car` (`regno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




> Source /home/admo/git/DAT151/Oblig5/SQL/CreateTable.sql

CREATE TABLE IF NOT EXISTS  ImportTable  (
   regno  VARCHAR(45) NULL,
   tid  DATETIME NULL,
   idTollstation  VARCHAR(45) NULL,
   tollname  VARCHAR(45) NULL,
   OwnerName  VARCHAR(45) NULL,
   taxId varchar(3),
   taxDesc  VARCHAR(45) NULL,
   Subscription  VARCHAR(10),
   TollSFee  INT(11) NULL,
   SubFee  INT(11) NULL
   )
ENGINE = MyISAM;

CREATE TABLE IF NOT EXISTS  Tollstation  (
   idTollstation  SMALLINT UNSIGNED NOT NULL,
   name  VARCHAR(85) NULL,
  PRIMARY KEY ( idTollstation ))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS  TaxClass  (
	idTaxClass  SMALLINT UNSIGNED NOT NULL,
	description  TEXT NULL,
	PRIMARY KEY ( idTaxClass )
  )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Fee  (
   idFee  SMALLINT NOT NULL AUTO_INCREMENT,
   taxclass  SMALLINT UNSIGNED NOT NULL,
   type  ENUM('regular', 'withsubscription') NOT NULL,
   costPerPassing  DECIMAL(5,2) NOT NULL,
  PRIMARY KEY ( idFee ),
  CONSTRAINT TeacherFK FOREIGN KEY (taxclass) REFERENCES TaxClass(idTaxClass)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS  Car  (
   regno  CHAR(7) NOT NULL,
   owner  VARCHAR(85) NULL,
   taxclass  SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY ( regno ),
  CONSTRAINT  fk_Car_TaxClass1 
    FOREIGN KEY ( taxclass )
    REFERENCES TaxClass (idTaxClass)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS  Passing  (
   regno  CHAR(7) NOT NULL,
   timestamp  TIMESTAMP NOT NULL,
   tollstation  SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY ( regno ,  timestamp ),
  CONSTRAINT  fk_Passing_1 
    FOREIGN KEY ( tollstation )
    REFERENCES  Tollstation  ( idTollstation )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT  fk_Passing_Subscription1 
    FOREIGN KEY ( regno )
    REFERENCES Car (regno)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS  Subscription  (
   regno  CHAR(7) NOT NULL,
  PRIMARY KEY ( regno ),
  CONSTRAINT  fk_Subscription_Car1 
    FOREIGN KEY (regno)
    REFERENCES Car (regno)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS  Passing2  (
   regno  CHAR(7) NOT NULL,
   timestamp  TIMESTAMP NOT NULL,
   tollstation  SMALLINT UNSIGNED NOT NULL,
   owner VARCHAR(85),
  PRIMARY KEY ( regno ,  timestamp ),
  CONSTRAINT  fk_Passing_2 
    FOREIGN KEY ( tollstation )
    REFERENCES  Tollstation  ( idTollstation )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT  fk_Passing_Subscription2
    FOREIGN KEY ( regno )
    REFERENCES Car (regno)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS  Passing3  (
   regno  CHAR(7) NOT NULL,
   timestamp  TIMESTAMP NOT NULL,
   tollstation  SMALLINT UNSIGNED NOT NULL,
   owner VARCHAR(85),
   type  ENUM('regular', 'withsubscription') NOT NULL,
   costPerPassing  DECIMAL(5,2) NOT NULL,
  PRIMARY KEY ( regno ,  timestamp ),
  CONSTRAINT  fk_Passing_3 
    FOREIGN KEY ( tollstation )
    REFERENCES  Tollstation  ( idTollstation )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT  fk_Passing_Subscription3
    FOREIGN KEY ( regno )
    REFERENCES Car (regno)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


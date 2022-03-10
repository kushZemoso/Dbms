-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema IRCTC
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema IRCTC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IRCTC` ;
USE `IRCTC` ;

-- -----------------------------------------------------
-- Table `IRCTC`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`Customer` (
  `idCustomer` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Customer_name` VARCHAR(45) NOT NULL,
  `Customer_gender` ENUM('Male', 'Female', 'TransGender') NOT NULL,
  `Customer_age` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCustomer`, `Customer_age`),
  UNIQUE INDEX `idCustomer_UNIQUE` (`idCustomer` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`Ticket` (
  `idTicket` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Ticket_customerid` INT UNSIGNED NOT NULL,
  `Ticket_price` FLOAT NOT NULL,
  `Ticket_doi` DATE NOT NULL,
  PRIMARY KEY (`idTicket`, `Ticket_customerid`),
  UNIQUE INDEX `idTicket_UNIQUE` (`idTicket` ASC),
  UNIQUE INDEX `Ticket_customerid_UNIQUE` (`Ticket_customerid` ASC),
  CONSTRAINT `fk_Ticket_1`
    FOREIGN KEY (`Ticket_customerid`)
    REFERENCES `IRCTC`.`Customer` (`idCustomer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`Train`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`Train` (
  `idTrain` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Train_name` VARCHAR(45) NOT NULL,
  `Train_start` VARCHAR(45) NOT NULL,
  `Train_destination` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTrain`),
  UNIQUE INDEX `idTrain_UNIQUE` (`idTrain` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`ReservedTicket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`ReservedTicket` (
  `ReservedTicket_ticketid` INT UNSIGNED NOT NULL,
  `ReservedTicket_trainid` INT UNSIGNED NOT NULL,
  `ReservedTicket_seatNcoach` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ReservedTicket_ticketid`, `ReservedTicket_trainid`),
  UNIQUE INDEX `ReservedTicket_ticketid_UNIQUE` (`ReservedTicket_ticketid` ASC),
  INDEX `fk_ReservedTicket_1_idx` (`ReservedTicket_trainid` ASC),
  CONSTRAINT `fk_ReservedTicket_1`
    FOREIGN KEY (`ReservedTicket_trainid`)
    REFERENCES `IRCTC`.`Train` (`idTrain`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ReservedTicket_2`
    FOREIGN KEY (`ReservedTicket_ticketid`)
    REFERENCES `IRCTC`.`Ticket` (`idTicket`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IRCTC`.`UnreservedTicket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IRCTC`.`UnreservedTicket` (
  `UnreservedTicket_ticketid` INT UNSIGNED NOT NULL,
  `UnreservedTicket_traintype` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`UnreservedTicket_ticketid`),
  UNIQUE INDEX `UnreservedTicket_ticketid_UNIQUE` (`UnreservedTicket_ticketid` ASC),
  CONSTRAINT `fk_UnreservedTicket_1`
    FOREIGN KEY (`UnreservedTicket_ticketid`)
    REFERENCES `IRCTC`.`Ticket` (`idTicket`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

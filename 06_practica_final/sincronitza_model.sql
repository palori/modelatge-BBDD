-- MySQL Workbench Synchronization
-- Generated: 2020-07-03 07:31
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: pa1_1

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `culdampolla` DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci ;

CREATE TABLE IF NOT EXISTS `culdampolla`.`proveidors` (
  `id_proveidor` INT(10) UNSIGNED NOT NULL,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `nif` VARCHAR(8) NULL DEFAULT NULL,
  `id_contacte` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_proveidor`),
  INDEX `fk_proveidors_contactes1_idx` (`id_contacte` ASC) VISIBLE,
  CONSTRAINT `fk_proveidors_contactes1`
    FOREIGN KEY (`id_contacte`)
    REFERENCES `culdampolla`.`contactes` (`id_contacte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;

CREATE TABLE IF NOT EXISTS `culdampolla`.`addresses` (
  `id_address` INT(10) UNSIGNED NOT NULL,
  `carrer` VARCHAR(45) NULL DEFAULT NULL,
  `numero` INT(10) UNSIGNED NULL DEFAULT NULL,
  `pis` INT(11) NULL DEFAULT NULL,
  `porta` VARCHAR(4) NULL DEFAULT NULL,
  `ciutat` VARCHAR(45) NULL DEFAULT NULL,
  `codi_postal` VARCHAR(10) NULL DEFAULT NULL,
  `pais` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_address`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;

CREATE TABLE IF NOT EXISTS `culdampolla`.`contactes` (
  `id_contacte` INT(10) UNSIGNED NOT NULL,
  `telefon` VARCHAR(10) NULL DEFAULT NULL,
  `fax` VARCHAR(10) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `data_registre` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `id_address` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_contacte`),
  INDEX `fk_contactes_addresses_idx` (`id_address` ASC) VISIBLE,
  CONSTRAINT `fk_contactes_addresses`
    FOREIGN KEY (`id_address`)
    REFERENCES `culdampolla`.`addresses` (`id_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;

CREATE TABLE IF NOT EXISTS `culdampolla`.`clients` (
  `id_client` INT(11) UNSIGNED NOT NULL,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `id_contacte` INT(10) UNSIGNED NOT NULL,
  `recomanat_per_un_client` BINARY(1) NULL DEFAULT NULL,
  `id_client_recomanador` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  INDEX `fk_clients_contactes1_idx` (`id_contacte` ASC) VISIBLE,
  INDEX `fk_clients_clients1_idx` (`id_client_recomanador` ASC) VISIBLE,
  CONSTRAINT `fk_clients_contactes1`
    FOREIGN KEY (`id_contacte`)
    REFERENCES `culdampolla`.`contactes` (`id_contacte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clients_clients1`
    FOREIGN KEY (`id_client_recomanador`)
    REFERENCES `culdampolla`.`clients` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;

CREATE TABLE IF NOT EXISTS `culdampolla`.`graduacions` (
  `id_graduacio` INT(10) UNSIGNED NOT NULL,
  `ull` VARCHAR(1) NULL DEFAULT NULL COMMENT 'D = dret\nE = esquerre',
  `miopia` FLOAT(11) NULL DEFAULT NULL,
  `hipermetropia` FLOAT(11) NULL DEFAULT NULL,
  `estigmatisme` FLOAT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_graduacio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;

CREATE TABLE IF NOT EXISTS `culdampolla`.`vidres` (
  `id_vidre` INT(11) UNSIGNED NOT NULL,
  `color` VARCHAR(45) NULL DEFAULT NULL,
  `preu` FLOAT(10) UNSIGNED NULL DEFAULT NULL,
  `id_marca` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_vidre`),
  INDEX `fk_vidres_marques1_idx` (`id_marca` ASC) VISIBLE,
  CONSTRAINT `fk_vidres_marques1`
    FOREIGN KEY (`id_marca`)
    REFERENCES `culdampolla`.`marques` (`id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;

CREATE TABLE IF NOT EXISTS `culdampolla`.`montures` (
  `id_montura` INT(10) UNSIGNED NOT NULL,
  `tipus` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Opcions:\nflotant\npasta\nmetàl·lica',
  `preu` FLOAT(10) UNSIGNED NULL DEFAULT NULL,
  `id_marca` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_montura`),
  INDEX `fk_montures_marques1_idx` (`id_marca` ASC) VISIBLE,
  CONSTRAINT `fk_montures_marques1`
    FOREIGN KEY (`id_marca`)
    REFERENCES `culdampolla`.`marques` (`id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;

CREATE TABLE IF NOT EXISTS `culdampolla`.`marques` (
  `id_marca` INT(10) UNSIGNED NOT NULL,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `id_proveidor` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_marca`),
  INDEX `fk_marques_proveidors1_idx` (`id_proveidor` ASC) VISIBLE,
  CONSTRAINT `fk_marques_proveidors1`
    FOREIGN KEY (`id_proveidor`)
    REFERENCES `culdampolla`.`proveidors` (`id_proveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;

CREATE TABLE IF NOT EXISTS `culdampolla`.`ulleres` (
  `id_ullera` INT(10) UNSIGNED NOT NULL,
  `preu` FLOAT(10) UNSIGNED NULL DEFAULT NULL,
  `id_montura` INT(10) UNSIGNED NOT NULL,
  `id_empleat_venedor` INT(10) UNSIGNED,
  `id_client` INT(10) UNSIGNED,
  PRIMARY KEY (`id_ullera`),
  INDEX `fk_ulleres_montures1_idx` (`id_montura` ASC) VISIBLE,
  INDEX `fk_ulleres_empleats1_idx` (`id_empleat_venedor` ASC) VISIBLE,
  INDEX `fk_ulleres_clients1_idx` (`id_client` ASC) VISIBLE,
  CONSTRAINT `fk_ulleres_montures1`
    FOREIGN KEY (`id_montura`)
    REFERENCES `culdampolla`.`montures` (`id_montura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ulleres_empleats1`
    FOREIGN KEY (`id_empleat_venedor`)
    REFERENCES `culdampolla`.`empleats` (`id_empleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ulleres_clients1`
    FOREIGN KEY (`id_client`)
    REFERENCES `culdampolla`.`clients` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;

CREATE TABLE IF NOT EXISTS `culdampolla`.`empleats` (
  `id_empleat` INT(10) UNSIGNED NOT NULL,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `id_contacte` INT(10) UNSIGNED NOT NULL,
  `carrec` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_empleat`),
  INDEX `fk_empleats_contactes1_idx` (`id_contacte` ASC) VISIBLE,
  CONSTRAINT `fk_empleats_contactes1`
    FOREIGN KEY (`id_contacte`)
    REFERENCES `culdampolla`.`contactes` (`id_contacte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;

CREATE TABLE IF NOT EXISTS `culdampolla`.`vidres_ulleres` (
  `id_vidre_ullera` INT(10) UNSIGNED NOT NULL,
  `id_ullera` INT(10) UNSIGNED,
  `id_graduacio` INT(10) UNSIGNED,
  `id_vidre` INT(10) UNSIGNED,
  PRIMARY KEY (`id_vidre_ullera`),
  INDEX `fk_vidres_ulls_ulleres_ulleres1_idx` (`id_ullera` ASC) VISIBLE,
  INDEX `fk_vidres_ulls_ulleres_graduacions1_idx` (`id_graduacio` ASC) VISIBLE,
  INDEX `fk_vidres_ulls_ulleres_vidres1_idx` (`id_vidre` ASC) VISIBLE,
  CONSTRAINT `fk_vidres_ulls_ulleres_ulleres1`
    FOREIGN KEY (`id_ullera`)
    REFERENCES `culdampolla`.`ulleres` (`id_ullera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vidres_ulls_ulleres_graduacions1`
    FOREIGN KEY (`id_graduacio`)
    REFERENCES `culdampolla`.`graduacions` (`id_graduacio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vidres_ulls_ulleres_vidres1`
    FOREIGN KEY (`id_vidre`)
    REFERENCES `culdampolla`.`vidres` (`id_vidre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

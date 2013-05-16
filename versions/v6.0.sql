SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mdpx` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mdpx` ;

-- -----------------------------------------------------
-- Table `mdpx`.`PartCategories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`PartCategories` (
  `partCatId` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(20) NOT NULL ,
  `parent` INT NULL ,
  PRIMARY KEY (`partCatId`) ,
  INDEX `fk_PartCategories_PartCategories1_idx` (`parent` ASC) ,
  CONSTRAINT `fk_PartCategories_PartCategories1`
    FOREIGN KEY (`parent` )
    REFERENCES `mdpx`.`PartCategories` (`partCatId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`Users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`Users` (
  `userId` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(32) NOT NULL ,
  `firstName` VARCHAR(45) NOT NULL ,
  `lastName` VARCHAR(45) NOT NULL ,
  `phone` DECIMAL(10) NULL ,
  `affiliation` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`userId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`Parts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`Parts` (
  `serialNum` VARCHAR(10) NOT NULL ,
  `name` VARCHAR(20) NOT NULL ,
  `type` INT NOT NULL ,
  `description` VARCHAR(200) NOT NULL ,
  `addedOn` TIMESTAMP NOT NULL ,
  `addedBy` INT NOT NULL ,
  PRIMARY KEY (`serialNum`) ,
  INDEX `fk_Parts_PartCategories_idx` (`type` ASC) ,
  INDEX `fk_Parts_Users1_idx` (`addedBy` ASC) ,
  CONSTRAINT `fk_Parts_PartCategories`
    FOREIGN KEY (`type` )
    REFERENCES `mdpx`.`PartCategories` (`partCatId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Parts_Users1`
    FOREIGN KEY (`addedBy` )
    REFERENCES `mdpx`.`Users` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`ChamberSides`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`ChamberSides` (
  `chamberType` INT NOT NULL ,
  `sideId` INT NOT NULL ,
  `description` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`chamberType`, `sideId`) ,
  INDEX `fk_ChamberSides_PartCategories1_idx` (`chamberType` ASC) ,
  CONSTRAINT `fk_ChamberSides_PartCategories1`
    FOREIGN KEY (`chamberType` )
    REFERENCES `mdpx`.`PartCategories` (`partCatId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`GasTypes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`GasTypes` (
  `gasTypeId` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`gasTypeId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`VesselSetup`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`VesselSetup` (
  `vesselSetupId` INT NOT NULL AUTO_INCREMENT ,
  `dateTime` DATETIME NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(45) NOT NULL ,
  `chamber` VARCHAR(10) NOT NULL ,
  `upperElectrode` VARCHAR(10) NOT NULL ,
  `lowerElectrode` VARCHAR(10) NOT NULL ,
  `roughPump` VARCHAR(10) NOT NULL ,
  `turboPump` VARCHAR(10) NOT NULL ,
  `massFlowController` VARCHAR(10) NOT NULL ,
  `pressureGauge` VARCHAR(10) NOT NULL ,
  `dustShaker` VARCHAR(10) NOT NULL ,
  INDEX `fk_VesselSetup_Parts1_idx` (`roughPump` ASC) ,
  INDEX `fk_VesselSetup_Parts2_idx` (`turboPump` ASC) ,
  INDEX `fk_VesselSetup_Parts3_idx` (`massFlowController` ASC) ,
  INDEX `fk_VesselSetup_Parts4_idx` (`pressureGauge` ASC) ,
  INDEX `fk_VesselSetup_Parts5_idx` (`dustShaker` ASC) ,
  PRIMARY KEY (`vesselSetupId`) ,
  INDEX `fk_VesselSetup_Parts6_idx` (`chamber` ASC) ,
  INDEX `fk_VesselSetup_Parts7_idx` (`upperElectrode` ASC) ,
  INDEX `fk_VesselSetup_Parts8_idx` (`lowerElectrode` ASC) ,
  CONSTRAINT `fk_VesselSetup_Parts1`
    FOREIGN KEY (`roughPump` )
    REFERENCES `mdpx`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts2`
    FOREIGN KEY (`turboPump` )
    REFERENCES `mdpx`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts3`
    FOREIGN KEY (`massFlowController` )
    REFERENCES `mdpx`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts4`
    FOREIGN KEY (`pressureGauge` )
    REFERENCES `mdpx`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts5`
    FOREIGN KEY (`dustShaker` )
    REFERENCES `mdpx`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts6`
    FOREIGN KEY (`chamber` )
    REFERENCES `mdpx`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts7`
    FOREIGN KEY (`upperElectrode` )
    REFERENCES `mdpx`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts8`
    FOREIGN KEY (`lowerElectrode` )
    REFERENCES `mdpx`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`DustTypes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`DustTypes` (
  `dustTypeId` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`dustTypeId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`Experiments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`Experiments` (
  `experimentId` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(45) NOT NULL ,
  `dateTime` DATETIME NOT NULL ,
  `researcherId` INT NOT NULL ,
  `operatorId` INT NOT NULL ,
  PRIMARY KEY (`experimentId`) ,
  INDEX `fk_Experiments_Users1_idx` (`researcherId` ASC) ,
  INDEX `fk_Experiments_Users2_idx` (`operatorId` ASC) ,
  CONSTRAINT `fk_Experiments_Users1`
    FOREIGN KEY (`researcherId` )
    REFERENCES `mdpx`.`Users` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Experiments_Users2`
    FOREIGN KEY (`operatorId` )
    REFERENCES `mdpx`.`Users` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`ExperimentSetup`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`ExperimentSetup` (
  `experimentSetupId` INT NOT NULL AUTO_INCREMENT ,
  `experimentId` INT NOT NULL ,
  `dateTime` DATETIME NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(45) NOT NULL ,
  `vesselSetupId` INT NOT NULL ,
  `dcVoltageSetpoint` DECIMAL(18,9) NOT NULL ,
  `dcCurrentSetpoint` DECIMAL(18,9) NOT NULL ,
  `rfPowerSetpoint` VARCHAR(45) NULL ,
  `pressureSetpoint` DECIMAL(18,9) NULL ,
  `magnet1Setpoint` DECIMAL(18,9) NULL ,
  `magnet2Setpoint` DECIMAL(18,9) NULL ,
  `magnet3Setpoint` DECIMAL(18,9) NULL ,
  `magnet4Setpoint` DECIMAL(18,9) NULL ,
  `magneticFieldSetpoint` DECIMAL(18,9) NULL ,
  `magneticFieldGradientSetpoint` DECIMAL(18,9) NULL ,
  `gasType1` INT NOT NULL ,
  `gasType2` INT NOT NULL ,
  `dustType1` INT NOT NULL ,
  `dustType2` INT NOT NULL ,
  PRIMARY KEY (`experimentSetupId`) ,
  INDEX `fk_ExperimentSetup_GasTypes1_idx` (`gasType1` ASC) ,
  INDEX `fk_ExperimentSetup_GasTypes2_idx` (`gasType2` ASC) ,
  INDEX `fk_ExperimentSetup_DustTypes1_idx` (`dustType1` ASC) ,
  INDEX `fk_ExperimentSetup_DustTypes2_idx` (`dustType2` ASC) ,
  INDEX `fk_ExperimentSetup_VesselSetup1_idx` (`vesselSetupId` ASC) ,
  INDEX `fk_ExperimentSetup_Experiments1_idx` (`experimentId` ASC) ,
  CONSTRAINT `fk_ExperimentSetup_GasTypes1`
    FOREIGN KEY (`gasType1` )
    REFERENCES `mdpx`.`GasTypes` (`gasTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExperimentSetup_GasTypes2`
    FOREIGN KEY (`gasType2` )
    REFERENCES `mdpx`.`GasTypes` (`gasTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExperimentSetup_DustTypes1`
    FOREIGN KEY (`dustType1` )
    REFERENCES `mdpx`.`DustTypes` (`dustTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExperimentSetup_DustTypes2`
    FOREIGN KEY (`dustType2` )
    REFERENCES `mdpx`.`DustTypes` (`dustTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExperimentSetup_VesselSetup1`
    FOREIGN KEY (`vesselSetupId` )
    REFERENCES `mdpx`.`VesselSetup` (`vesselSetupId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExperimentSetup_Experiments1`
    FOREIGN KEY (`experimentId` )
    REFERENCES `mdpx`.`Experiments` (`experimentId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`VesselPlates`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`VesselPlates` (
  `vesselSetupId` INT NOT NULL ,
  `side` INT NOT NULL ,
  `plate` VARCHAR(10) NOT NULL ,
  INDEX `fk_VesselPlates_VesselSetup1_idx` (`vesselSetupId` ASC) ,
  INDEX `fk_VesselPlates_Parts1_idx` (`plate` ASC) ,
  PRIMARY KEY (`vesselSetupId`, `side`, `plate`) ,
  CONSTRAINT `fk_VesselPlates_VesselSetup1`
    FOREIGN KEY (`vesselSetupId` )
    REFERENCES `mdpx`.`VesselSetup` (`vesselSetupId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselPlates_Parts1`
    FOREIGN KEY (`plate` )
    REFERENCES `mdpx`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`SetupProbes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`SetupProbes` (
  `vesselSetupId` INT NOT NULL ,
  `side` INT NOT NULL ,
  `probe` VARCHAR(10) NOT NULL ,
  `length` DECIMAL(18,9) UNSIGNED NULL ,
  `width` DECIMAL(18,9) NULL ,
  PRIMARY KEY (`vesselSetupId`, `side`, `probe`) ,
  INDEX `fk_SetupProbes_VesselSetup1_idx` (`vesselSetupId` ASC) ,
  INDEX `fk_SetupProbes_Parts1_idx` (`probe` ASC) ,
  CONSTRAINT `fk_SetupProbes_VesselSetup1`
    FOREIGN KEY (`vesselSetupId` )
    REFERENCES `mdpx`.`VesselSetup` (`vesselSetupId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SetupProbes_Parts1`
    FOREIGN KEY (`probe` )
    REFERENCES `mdpx`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`SetupCameras`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`SetupCameras` (
  `vesselSetupId` INT NOT NULL ,
  `camera` VARCHAR(10) NOT NULL ,
  `side` INT NOT NULL ,
  `description` VARCHAR(45) NULL ,
  `positionR` DECIMAL(18,9) NULL ,
  `positionZ` DECIMAL(18,9) NULL ,
  `lens` VARCHAR(10) NOT NULL ,
  `filter` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`vesselSetupId`, `camera`, `side`) ,
  INDEX `fk_SetupCameras_Parts1_idx` (`camera` ASC) ,
  INDEX `fk_SetupCameras_Parts2_idx` (`lens` ASC) ,
  INDEX `fk_SetupCameras_Parts3_idx` (`filter` ASC) ,
  INDEX `fk_SetupCameras_VesselSetup1_idx` (`vesselSetupId` ASC) ,
  CONSTRAINT `fk_SetupCameras_Parts1`
    FOREIGN KEY (`camera` )
    REFERENCES `mdpx`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SetupCameras_Parts2`
    FOREIGN KEY (`lens` )
    REFERENCES `mdpx`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SetupCameras_Parts3`
    FOREIGN KEY (`filter` )
    REFERENCES `mdpx`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SetupCameras_VesselSetup1`
    FOREIGN KEY (`vesselSetupId` )
    REFERENCES `mdpx`.`VesselSetup` (`vesselSetupId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`PIVSetup`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`PIVSetup` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`LIFSetup`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`LIFSetup` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdpx`.`Measurements`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mdpx`.`Measurements` (
  `measurementId` VARCHAR(15) NOT NULL ,
  `experimentSetupId` INT NOT NULL ,
  `dateTime` DATETIME NOT NULL ,
  `dcVoltage` DECIMAL(18,9) NULL ,
  `dcCurrent` DECIMAL(18,9) NULL ,
  `rfPower` DECIMAL(18,9) NULL ,
  `massFlow` DECIMAL(18,9) NULL ,
  `pressure` DECIMAL(18,9) NULL ,
  `magnet1` DECIMAL(18,9) NULL ,
  `magnet2` DECIMAL(18,9) NULL ,
  `magnet3` DECIMAL(18,9) NULL ,
  `magnet4` DECIMAL(18,9) NULL ,
  `magneticField` DECIMAL(18,9) NULL ,
  `magneticFieldGradient` DECIMAL(18,9) NULL ,
  `dataPath` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`measurementId`) ,
  UNIQUE INDEX `measurementId_UNIQUE` (`measurementId` ASC) ,
  INDEX `fk_Measurements_ExperimentSetup1_idx` (`experimentSetupId` ASC) ,
  CONSTRAINT `fk_Measurements_ExperimentSetup1`
    FOREIGN KEY (`experimentSetupId` )
    REFERENCES `mdpx`.`ExperimentSetup` (`experimentSetupId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

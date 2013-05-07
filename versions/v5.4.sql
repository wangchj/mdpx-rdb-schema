SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`PartCategories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`PartCategories` (
  `partCatId` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(20) NOT NULL ,
  `parent` INT NULL ,
  PRIMARY KEY (`partCatId`) ,
  INDEX `fk_PartCategories_PartCategories1_idx` (`parent` ASC) ,
  CONSTRAINT `fk_PartCategories_PartCategories1`
    FOREIGN KEY (`parent` )
    REFERENCES `mydb`.`PartCategories` (`partCatId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Users` (
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
-- Table `mydb`.`Parts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Parts` (
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
    REFERENCES `mydb`.`PartCategories` (`partCatId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Parts_Users1`
    FOREIGN KEY (`addedBy` )
    REFERENCES `mydb`.`Users` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ChamberSides`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`ChamberSides` (
  `chamberType` INT NOT NULL ,
  `sideId` INT NOT NULL ,
  `description` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`chamberType`, `sideId`) ,
  INDEX `fk_ChamberSides_PartCategories1_idx` (`chamberType` ASC) ,
  CONSTRAINT `fk_ChamberSides_PartCategories1`
    FOREIGN KEY (`chamberType` )
    REFERENCES `mydb`.`PartCategories` (`partCatId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GasTypes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`GasTypes` (
  `gasTypeId` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`gasTypeId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VesselSetup`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`VesselSetup` (
  `vesselSetupId` INT NOT NULL AUTO_INCREMENT ,
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
    REFERENCES `mydb`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts2`
    FOREIGN KEY (`turboPump` )
    REFERENCES `mydb`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts3`
    FOREIGN KEY (`massFlowController` )
    REFERENCES `mydb`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts4`
    FOREIGN KEY (`pressureGauge` )
    REFERENCES `mydb`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts5`
    FOREIGN KEY (`dustShaker` )
    REFERENCES `mydb`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts6`
    FOREIGN KEY (`chamber` )
    REFERENCES `mydb`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts7`
    FOREIGN KEY (`upperElectrode` )
    REFERENCES `mydb`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselSetup_Parts8`
    FOREIGN KEY (`lowerElectrode` )
    REFERENCES `mydb`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DustTypes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`DustTypes` (
  `dustTypeId` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`dustTypeId`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ExperimentSetup`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`ExperimentSetup` (
  `experimentSetupId` INT NOT NULL AUTO_INCREMENT ,
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
  CONSTRAINT `fk_ExperimentSetup_GasTypes1`
    FOREIGN KEY (`gasType1` )
    REFERENCES `mydb`.`GasTypes` (`gasTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExperimentSetup_GasTypes2`
    FOREIGN KEY (`gasType2` )
    REFERENCES `mydb`.`GasTypes` (`gasTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExperimentSetup_DustTypes1`
    FOREIGN KEY (`dustType1` )
    REFERENCES `mydb`.`DustTypes` (`dustTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExperimentSetup_DustTypes2`
    FOREIGN KEY (`dustType2` )
    REFERENCES `mydb`.`DustTypes` (`dustTypeId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExperimentSetup_VesselSetup1`
    FOREIGN KEY (`vesselSetupId` )
    REFERENCES `mydb`.`VesselSetup` (`vesselSetupId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Experiments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Experiments` (
  `experimentId` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(45) NOT NULL ,
  `dateTime` DATETIME NOT NULL ,
  `researcherId` INT NOT NULL ,
  `operatorId` INT NOT NULL ,
  `experimentSetupId` INT NOT NULL ,
  `ExpDataPath` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`experimentId`) ,
  INDEX `fk_Experiments_Users1_idx` (`researcherId` ASC) ,
  INDEX `fk_Experiments_Users2_idx` (`operatorId` ASC) ,
  INDEX `fk_Experiments_ExperimentSetup1_idx` (`experimentSetupId` ASC) ,
  CONSTRAINT `fk_Experiments_Users1`
    FOREIGN KEY (`researcherId` )
    REFERENCES `mydb`.`Users` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Experiments_Users2`
    FOREIGN KEY (`operatorId` )
    REFERENCES `mydb`.`Users` (`userId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Experiments_ExperimentSetup1`
    FOREIGN KEY (`experimentSetupId` )
    REFERENCES `mydb`.`ExperimentSetup` (`experimentSetupId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VesselPlates`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`VesselPlates` (
  `vesselSetupId` INT NOT NULL ,
  `side` INT NOT NULL ,
  `plate` VARCHAR(10) NOT NULL ,
  INDEX `fk_VesselPlates_VesselSetup1_idx` (`vesselSetupId` ASC) ,
  INDEX `fk_VesselPlates_Parts1_idx` (`plate` ASC) ,
  PRIMARY KEY (`vesselSetupId`, `side`, `plate`) ,
  CONSTRAINT `fk_VesselPlates_VesselSetup1`
    FOREIGN KEY (`vesselSetupId` )
    REFERENCES `mydb`.`VesselSetup` (`vesselSetupId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VesselPlates_Parts1`
    FOREIGN KEY (`plate` )
    REFERENCES `mydb`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SetupProbes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`SetupProbes` (
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
    REFERENCES `mydb`.`VesselSetup` (`vesselSetupId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SetupProbes_Parts1`
    FOREIGN KEY (`probe` )
    REFERENCES `mydb`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SetupCameras`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`SetupCameras` (
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
    REFERENCES `mydb`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SetupCameras_Parts2`
    FOREIGN KEY (`lens` )
    REFERENCES `mydb`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SetupCameras_Parts3`
    FOREIGN KEY (`filter` )
    REFERENCES `mydb`.`Parts` (`serialNum` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SetupCameras_VesselSetup1`
    FOREIGN KEY (`vesselSetupId` )
    REFERENCES `mydb`.`VesselSetup` (`vesselSetupId` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PIVSetup`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`PIVSetup` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LIFSetup`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`LIFSetup` (
)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

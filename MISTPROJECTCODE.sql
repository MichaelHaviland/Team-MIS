-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `MealPlan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MealPlan` (
  `idMealPlan` INT NOT NULL,
  `mealPlanType` VARCHAR(45) NULL,
  `planCost` VARCHAR(45) NULL,
  PRIMARY KEY (`idMealPlan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Student` (
  `idStudent` INT NOT NULL,
  `studentFName` VARCHAR(45) NULL,
  `studentLName` VARCHAR(45) NULL,
  `studentEmail` VARCHAR(45) NULL,
  `idMealPlan` INT NOT NULL,
  `year` VARCHAR(45) NULL,
  PRIMARY KEY (`idStudent`),
  INDEX `fk_Student_Meal Plan1_idx` (`idMealPlan` ASC) VISIBLE,
  CONSTRAINT `fk_Student_Meal Plan1`
    FOREIGN KEY (`idMealPlan`)
    REFERENCES `MealPlan` (`idMealPlan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Classes` (
  `idClasses` INT NOT NULL,
  `className` VARCHAR(45) NULL,
  PRIMARY KEY (`idClasses`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Enrollment` (
  `idEnrollment` INT NOT NULL,
  `idStudent` INT NOT NULL,
  `idClasses` INT NOT NULL,
  PRIMARY KEY (`idEnrollment`, `idStudent`),
  INDEX `fk_Enrollment_Student1_idx` (`idStudent` ASC) VISIBLE,
  INDEX `fk_Enrollment_Classes1_idx` (`idClasses` ASC) VISIBLE,
  CONSTRAINT `fk_Enrollment_Student1`
    FOREIGN KEY (`idStudent`)
    REFERENCES `Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Enrollment_Classes1`
    FOREIGN KEY (`idClasses`)
    REFERENCES `Classes` (`idClasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Organizations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Organizations` (
  `idOrganizations` INT NOT NULL,
  `organizationName` VARCHAR(45) NULL,
  `organizationType` VARCHAR(45) NULL,
  PRIMARY KEY (`idOrganizations`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Parking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Parking` (
  `idParking` INT NOT NULL,
  `parkingLocation` VARCHAR(45) NULL,
  `parkingType` VARCHAR(45) NULL,
  PRIMARY KEY (`idParking`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ResidenceHalls`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ResidenceHalls` (
  `idResidenceHall` INT NULL,
  `residenceHallName` VARCHAR(45) NULL,
  `residenceHallOccupancy` VARCHAR(45) NULL,
  PRIMARY KEY (`idResidenceHall`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ParkingAssignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ParkingAssignment` (
  `idParkingAssignment` INT NOT NULL,
  `idStudent` INT NOT NULL,
  `idParking` INT NOT NULL,
  `parkingAssignmentStartDate` VARCHAR(45) NULL,
  `parkingAssignmentEndDate` VARCHAR(45) NULL,
  PRIMARY KEY (`idParkingAssignment`, `idStudent`),
  INDEX `fk_Parking Assignment_Student1_idx` (`idStudent` ASC) VISIBLE,
  INDEX `fk_Parking Assignment_Parking1_idx` (`idParking` ASC) VISIBLE,
  CONSTRAINT `fk_Parking Assignment_Student1`
    FOREIGN KEY (`idStudent`)
    REFERENCES `Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Parking Assignment_Parking1`
    FOREIGN KEY (`idParking`)
    REFERENCES `Parking` (`idParking`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StudentInvolvement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentInvolvement` (
  `idStudentInvolvement` INT NOT NULL,
  `idStudent` INT NOT NULL,
  `idOrganizations` INT NOT NULL,
  PRIMARY KEY (`idStudentInvolvement`, `idStudent`),
  INDEX `fk_Student Involvement_Student1_idx` (`idStudent` ASC) VISIBLE,
  INDEX `fk_Student Involvement_Organizations1_idx` (`idOrganizations` ASC) VISIBLE,
  CONSTRAINT `fk_Student Involvement_Student1`
    FOREIGN KEY (`idStudent`)
    REFERENCES `Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student Involvement_Organizations1`
    FOREIGN KEY (`idOrganizations`)
    REFERENCES `Organizations` (`idOrganizations`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DormRoom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DormRoom` (
  `idDormRoom` INT NOT NULL,
  `idResidenceHalls` INT NOT NULL,
  `dormRoomType` VARCHAR(45) NULL,
  PRIMARY KEY (`idDormRoom`),
  INDEX `fk_DormRoom_Residence Halls1_idx` (`idResidenceHalls` ASC) VISIBLE,
  CONSTRAINT `fk_DormRoom_Residence Halls1`
    FOREIGN KEY (`idResidenceHalls`)
    REFERENCES `ResidenceHalls` (`idResidenceHall`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RoomAssignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RoomAssignment` (
  `idRoomAssignment` INT NOT NULL,
  `idStudent` INT NOT NULL,
  `idDormRoom` INT NOT NULL,
  `roomAssignmentStartDate` VARCHAR(45) NULL,
  `roomAssignmentEndDate` VARCHAR(45) NULL,
  PRIMARY KEY (`idRoomAssignment`, `idStudent`),
  INDEX `fk_RoomAssignment_Student1_idx` (`idStudent` ASC) VISIBLE,
  INDEX `fk_RoomAssignment_DormRoom1_idx` (`idDormRoom` ASC) VISIBLE,
  CONSTRAINT `fk_RoomAssignment_Student1`
    FOREIGN KEY (`idStudent`)
    REFERENCES `Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RoomAssignment_DormRoom1`
    FOREIGN KEY (`idDormRoom`)
    REFERENCES `DormRoom` (`idDormRoom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Programs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Programs` (
  `idPrograms` INT NOT NULL,
  `programName` VARCHAR(45) NULL,
  `programType` VARCHAR(45) NULL,
  PRIMARY KEY (`idPrograms`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StudentPrograms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentPrograms` (
  `idStudentPrograms` INT NOT NULL,
  `idStudent` INT NOT NULL,
  `idPrograms` INT NOT NULL,
  `admitTerm` VARCHAR(45) NULL,
  `expectedGraduationTerm` VARCHAR(45) NULL,
  PRIMARY KEY (`idStudentPrograms`, `idStudent`),
  INDEX `fk_StudentPrograms_Student1_idx` (`idStudent` ASC) VISIBLE,
  INDEX `fk_StudentPrograms_Programs1_idx` (`idPrograms` ASC) VISIBLE,
  CONSTRAINT `fk_StudentPrograms_Student1`
    FOREIGN KEY (`idStudent`)
    REFERENCES `Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentPrograms_Programs1`
    FOREIGN KEY (`idPrograms`)
    REFERENCES `Programs` (`idPrograms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

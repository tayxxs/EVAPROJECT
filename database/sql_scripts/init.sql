-- MySQL Script generated by MySQL Workbench
-- Sat Jun  2 20:52:13 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema eva
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `eva` ;

-- -----------------------------------------------------
-- Schema eva
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eva` DEFAULT CHARACTER SET utf8 ;
USE `eva` ;

-- -----------------------------------------------------
-- Table `eva`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eva`.`user` ;

CREATE TABLE IF NOT EXISTS `eva`.`user` (
  `ID` INT NOT NULL COMMENT '唯一标识码',
  `USER` VARCHAR(12) NULL COMMENT '用户名，不建议变更',
  `NICK_NAME` VARCHAR(45) NULL COMMENT '用户昵称',
  `CREATE_TIME` TIMESTAMP NULL COMMENT '创建时间',
  `PASSWORD` VARCHAR(100) NULL COMMENT '密码',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
COMMENT = '用户信息表';


-- -----------------------------------------------------
-- Table `eva`.`article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eva`.`article` ;

CREATE TABLE IF NOT EXISTS `eva`.`article` (
  `ID` INT NOT NULL,
  `USER_ID` INT NULL,
  `TITLE` VARCHAR(100) NULL COMMENT '文章标题',
  `CREATE_TIME` TIMESTAMP NULL,
  `UPDTAE_TIME` TIMESTAMP NULL,
  `STATUS` INT NULL COMMENT '文章状态：已删除（-1）\n',
  `READ_RECORD` INT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
COMMENT = '文章表';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
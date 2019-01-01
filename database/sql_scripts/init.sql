-- MySQL Script generated by MySQL Workbench
-- Mon Sep 24 20:19:19 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
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
-- Table `eva`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eva`.`category` ;

CREATE TABLE IF NOT EXISTS `eva`.`category` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `cateName` VARCHAR(64) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 65
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eva`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eva`.`user` ;

CREATE TABLE IF NOT EXISTS `eva`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(64) NULL DEFAULT NULL,
  `nickname` VARCHAR(64) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `enabled` TINYINT(1) NULL DEFAULT '1',
  `email` VARCHAR(64) NULL DEFAULT NULL,
  `userface` VARCHAR(255) NULL DEFAULT NULL,
  `regTime` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eva`.`article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eva`.`article` ;

CREATE TABLE IF NOT EXISTS `eva`.`article` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `mdContent` TEXT NULL DEFAULT NULL COMMENT 'md文件源码',
  `htmlContent` TEXT NULL DEFAULT NULL COMMENT 'html源码',
  `summary` TEXT NULL DEFAULT NULL,
  `cid` INT(11) NULL DEFAULT NULL,
  `uid` INT(11) NULL DEFAULT NULL,
  `publishDate` DATETIME NULL DEFAULT NULL,
  `editTime` DATETIME NULL DEFAULT NULL,
  `state` INT(11) NULL DEFAULT NULL COMMENT '0表示草稿箱，1表示已发表，2表示已删除',
  `pageView` INT(11) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `cid` (`cid` ASC),
  INDEX `uid` (`uid` ASC),
  CONSTRAINT `article_ibfk_1`
    FOREIGN KEY (`cid`)
    REFERENCES `eva`.`category` (`id`),
  CONSTRAINT `article_ibfk_2`
    FOREIGN KEY (`uid`)
    REFERENCES `eva`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 122
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eva`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eva`.`tags` ;

CREATE TABLE IF NOT EXISTS `eva`.`tags` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tagName` VARCHAR(32) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `tagName` (`tagName` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 67
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eva`.`article_tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eva`.`article_tags` ;

CREATE TABLE IF NOT EXISTS `eva`.`article_tags` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `aid` INT(11) NULL DEFAULT NULL,
  `tid` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `tid` (`tid` ASC),
  INDEX `article_tags_ibfk_1` (`aid` ASC),
  CONSTRAINT `article_tags_ibfk_1`
    FOREIGN KEY (`aid`)
    REFERENCES `eva`.`article` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `article_tags_ibfk_2`
    FOREIGN KEY (`tid`)
    REFERENCES `eva`.`tags` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 52
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eva`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eva`.`comments` ;

CREATE TABLE IF NOT EXISTS `eva`.`comments` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `aid` INT(11) NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `publishDate` DATETIME NULL DEFAULT NULL,
  `parentId` INT(11) NULL DEFAULT NULL COMMENT '-1表示正常回复，其他值表示是评论的回复',
  `uid` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `aid` (`aid` ASC),
  INDEX `uid` (`uid` ASC),
  INDEX `parentId` (`parentId` ASC),
  CONSTRAINT `comments_ibfk_1`
    FOREIGN KEY (`aid`)
    REFERENCES `eva`.`article` (`id`),
  CONSTRAINT `comments_ibfk_2`
    FOREIGN KEY (`uid`)
    REFERENCES `eva`.`user` (`id`),
  CONSTRAINT `comments_ibfk_3`
    FOREIGN KEY (`parentId`)
    REFERENCES `eva`.`comments` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eva`.`pv`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eva`.`pv` ;

CREATE TABLE IF NOT EXISTS `eva`.`pv` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `countDate` DATE NULL DEFAULT NULL,
  `pv` INT(11) NULL DEFAULT NULL,
  `uid` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `pv_ibfk_1` (`uid` ASC),
  CONSTRAINT `pv_ibfk_1`
    FOREIGN KEY (`uid`)
    REFERENCES `eva`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eva`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eva`.`roles` ;

CREATE TABLE IF NOT EXISTS `eva`.`roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eva`.`roles_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eva`.`roles_user` ;

CREATE TABLE IF NOT EXISTS `eva`.`roles_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `rid` INT(11) NULL DEFAULT '2',
  `uid` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `rid` (`rid` ASC),
  INDEX `roles_user_ibfk_2` (`uid` ASC),
  CONSTRAINT `roles_user_ibfk_1`
    FOREIGN KEY (`rid`)
    REFERENCES `eva`.`roles` (`id`),
  CONSTRAINT `roles_user_ibfk_2`
    FOREIGN KEY (`uid`)
    REFERENCES `eva`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 131
DEFAULT CHARACTER SET = utf8;

USE `eva` ;

-- -----------------------------------------------------
-- View `eva`.`pvview`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `eva`.`pvview` ;
USE `eva`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `eva`.`pvview` AS select sum(`eva`.`pv`.`pv`) AS `pv`,`eva`.`pv`.`uid` AS `uid` from `eva`.`pv` group by `eva`.`pv`.`uid`;

-- -----------------------------------------------------
-- View `eva`.`totalpvview`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `eva`.`totalpvview` ;
USE `eva`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `eva`.`totalpvview` AS select sum(`a`.`pageView`) AS `totalPv`,`a`.`uid` AS `uid` from `eva`.`article` `a` group by `a`.`uid`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

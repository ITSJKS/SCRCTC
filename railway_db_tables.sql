create database if not exists railwayDB;
use railwayDB;


CREATE TABLE `railwaydb`.`trains` (
  `train_no` INT NOT NULL,
  `train_name` VARCHAR(45) NOT NULL,
  `source` VARCHAR(45) NOT NULL,
  `destination` VARCHAR(45) NOT NULL,
  `available_seats` INT NULL DEFAULT 50,
  PRIMARY KEY (`train_no`));
  
  ALTER TABLE `railwaydb`.`trains` 
ADD COLUMN `source_time` VARCHAR(45) NOT NULL AFTER `available_seats`,
ADD COLUMN `destination_time` VARCHAR(45) NOT NULL AFTER `source_time`,
ADD COLUMN `fare` INT UNSIGNED NOT NULL AFTER `destination_time`,
CHANGE COLUMN `available_seats` `available_seats` INT NOT NULL DEFAULT '50' ;
train_no
  CREATE TABLE `railwaydb`.`station` (
  `station_code` VARCHAR(45) NOT NULL,
  `station_name` VARCHAR(45) NULL,
  PRIMARY KEY (`station_code`));

CREATE TABLE `railwaydb`.`passenger` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `age` INT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `railwaydb`.`ticket` (
  `pnr` INT NOT NULL,
  `destination` VARCHAR(45) NULL,
  `source` VARCHAR(45) NULL,
  `train_name` VARCHAR(45) NULL,
  `train_no` VARCHAR(45) NULL,
  `seat_no` INT(10) NULL,
  PRIMARY KEY (`pnr`));
  
ALTER TABLE `railwaydb`.`ticket` 
ADD COLUMN `date` DATE NULL AFTER `departure_time`,
CHANGE COLUMN `train_no` `train_no` INT NULL DEFAULT NULL ;


INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`) VALUES ('12721', 'Dakshin Express', 'Hyedrabad', 'Delhi', '50');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`) VALUES ('22162', 'Rajyarani Express', 'Damoh', 'Bhopal', '50');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`) VALUES ('18236', 'Chhattisgarh Express', 'Amritsar', 'Bilaspur', '50');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`) VALUES ('12722', 'Dakshin Express', 'Delhi', 'Hyedrabad', '50');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `availapassengerble_seats`) VALUES ('22163', 'Rajyarani Express', 'Bhopal', 'Damoh', '50');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`) VALUES ('18237', 'Chhattisgarh Express', 'Bilaspur', 'Amritsar', '50');

UPDATE `railwaydb`.`trains` SET `fare` = '1000' WHERE (`train_no` = '12721');
UPDATE `railwaydb`.`trains` SET `fare` = '1000' WHERE (`train_no` = '12722');
UPDATE `railwaydb`.`trains` SET `fare` = '800' WHERE (`train_no` = '18236');
UPDATE `railwaydb`.`trains` SET `fare` = '800' WHERE (`train_no` = '18237');
UPDATE `railwaydb`.`trains` SET `fare` = '1200' WHERE (`train_no` = '22162');
UPDATE `railwaydb`.`trains` SET `fare` = '1200' WHERE (`train_no` = '22163');

INSERT INTO `railwaydb`.`station` (`station_code`, `station_name`) VALUES ('BPL', 'Bhopal');
INSERT INTO `railwaydb`.`station` (`strainstation_code`, `station_name`) VALUES ('DMO', 'Damoh');
INSERT INTO `railwaydb`.`station` (`station_code`, `station_name`) VALUES ('BLS', 'Bilaspur');
INSERT INTO `railwaydb`.`station` (`station_code`, `station_name`) VALUES ('AMR', 'Amritsar');
INSERT INTO `railwaydb`.`station` (`station_code`, `station_name`) VALUES ('DEL', 'Delhi');

UPDATE `railwaydb`.`trains` SET `source_time` = '03:00', `destination_time` = '12:00' WHERE (`train_no` = '12721');
UPDATE `railwaydb`.`trains` SET `source_time` = '18:00', `destination_time` = '03:00' WHERE (`train_no` = '12722');
UPDATE `railwaydb`.`trains` SET `source_time` = '16:00', `destination_time` = '02:00' WHERE (`train_no` = '18236');
UPDATE `railwaydb`.`trains` SET `source_time` = '10:00', `destination_time` = '08:00' WHERE (`train_no` = '18237');
UPDATE `railwaydb`.`trains` SET `source_time` = '15:00', `destination_time` = '19:00' WHERE (`train_no` = '22162');
UPDATE `railwaydb`.`trains` SET `source_time` = '01:00', `destination_time` = '05:00' WHERE (`train_no` = '22163');




INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('61632', 'Memu Express', 'Bhopal', 'Bina', '50', '12:00', '16:00', '500');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('61633', 'Memu Express', 'Bina', 'Bhopal', '50', '20:00', '00:00', '500');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('18619', 'Dumka-Ranchi Express', 'Dumka', 'Ranchi', '50', '15:00', '04:00', '500');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('18620', 'Ranchi-Dumka Express', 'Ranchi', 'Dumka', '50', '21:20', '10:20', '500');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('11057', 'Pathankot Express', 'Amritsar', 'Billaspur', '50', '14:00', '02:00', '1000');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('11058', 'Pathankot Express', 'Bilaspur', 'Amritsar', '50', '03:00', '15:00', '1000');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('12315', 'Mumbai Delhi Express', 'Mumbai', 'Delhi', '50', '13:00', '01:00', '800');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('12316', 'Delhi Mumbai Express', 'Delhi', 'Mumbai', '50', '02:00', '14:00', '800');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('18751', 'Ranchi Banaras Express', 'Ranchi', 'Varanasi', '50', '21:00', '09:00', '700');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('18752', 'Banaras Ranchi Express', 'Varanasi', 'Ranchi', '50', '12:00', '00:00', '700');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('17542', 'Ranchi Deoghar Express', 'Ranchi', 'Deoghar', '50', '13:00', '21:00', '500');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('17543', 'Deoghar Ranchi Express', 'Deoghar', 'Ranchi', '50', '04:00', '12:00', '500');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('15478', 'Maurya Express', 'Ranchi', 'Deoghar', '50', '03:00', '12:00', '500');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('15479', 'Maurya Express', 'Deoghar', 'Ranchi', '50', '12:00', '21:00', '500');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('13456', 'Baidynath Dham Express', 'Ranchi', 'Deoghar', '50', '14:00', '01:00', '500');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('13457', 'Baidynath Dham Express', 'Deoghar', 'Ranchi', '50', '03:00', '12:00', '500');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('34561', 'Ranchi Jasidih Express', 'Ranchi', 'Deoghar', '50', '16:00', '03:00', '500');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('12345', 'Shatabadi Express', 'Kolkata', 'Delhi', '50', '12:00', '11:00', '1200');
INSERT INTO `railwaydb`.`trains` (`train_no`, `train_name`, `source`, `destination`, `available_seats`, `source_time`, `destination_time`, `fare`) VALUES ('12346', 'Shatabadi Express', 'Delhi', 'Kolkata', '50', '13:00', '12:00', '1200');


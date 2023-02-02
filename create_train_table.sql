CREATE TABLE `projectdb`.`train` (
  `train_number` INT NOT NULL,
  `train_name` VARCHAR(45) NULL,
  `start_from` VARCHAR(45) NULL,
  `train_dest` VARCHAR(45) NULL,
  PRIMARY KEY (`train_number`),
  UNIQUE INDEX `train_number_UNIQUE` (`train_number` ASC) VISIBLE);

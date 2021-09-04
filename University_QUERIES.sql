-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `student_id` INT NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `dob` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`semester`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`semester` (
  `semester_id` INT NOT NULL,
  `term` VARCHAR(45) NOT NULL,
  `year` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`semester_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`college`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`college` (
  `college_id` INT NOT NULL,
  `college_name` VARCHAR(45) NULL,
  PRIMARY KEY (`college_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course` (
  `course_id` INT NOT NULL,
  `course_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`department` (
  `department_id` INT NOT NULL,
  `dept_name` VARCHAR(45) NOT NULL,
  `dept_code` VARCHAR(45) NOT NULL,
  `dept_number` VARCHAR(45) NOT NULL,
  `college_college_id` INT NOT NULL,
  `course_course_id` INT NOT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `fk_department_college1_idx` (`college_college_id` ASC) VISIBLE,
  INDEX `fk_department_course1_idx` (`course_course_id` ASC) VISIBLE,
  CONSTRAINT `fk_department_college1`
    FOREIGN KEY (`college_college_id`)
    REFERENCES `mydb`.`college` (`college_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_department_course1`
    FOREIGN KEY (`course_course_id`)
    REFERENCES `mydb`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course` (
  `course_id` INT NOT NULL,
  `course_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`section` (
  `section_id` INT NOT NULL,
  `section_number` VARCHAR(45) NOT NULL,
  `semester_semester_id` INT NOT NULL,
  `college_college_id` INT NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_semester1_idx` (`semester_semester_id` ASC) VISIBLE,
  INDEX `fk_section_college1_idx` (`college_college_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_semester1`
    FOREIGN KEY (`semester_semester_id`)
    REFERENCES `mydb`.`semester` (`semester_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_college1`
    FOREIGN KEY (`college_college_id`)
    REFERENCES `mydb`.`college` (`college_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`faculty` (
  `faculty_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `capacity` VARCHAR(45) NOT NULL,
  `section_section_id` INT NOT NULL,
  `course_course_id` INT NOT NULL,
  PRIMARY KEY (`faculty_id`),
  INDEX `fk_faculty_section1_idx` (`section_section_id` ASC) VISIBLE,
  INDEX `fk_faculty_course1_idx` (`course_course_id` ASC) VISIBLE,
  CONSTRAINT `fk_faculty_section1`
    FOREIGN KEY (`section_section_id`)
    REFERENCES `mydb`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_faculty_course1`
    FOREIGN KEY (`course_course_id`)
    REFERENCES `mydb`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`section_has_Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`section_has_Student` (
  `section_section_id` INT NOT NULL,
  `Student_student_id` INT NOT NULL,
  PRIMARY KEY (`section_section_id`, `Student_student_id`),
  INDEX `fk_section_has_Student_Student1_idx` (`Student_student_id` ASC) VISIBLE,
  INDEX `fk_section_has_Student_section_idx` (`section_section_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_has_Student_section`
    FOREIGN KEY (`section_section_id`)
    REFERENCES `mydb`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_has_Student_Student1`
    FOREIGN KEY (`Student_student_id`)
    REFERENCES `mydb`.`Student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO student VALUES
	(1, "Pual" , "Miller" , "M" , "Dallas" , "TX" , "1996-02-22")
    (2 , "Katie" , "Smith" , "F" , "Provo" , "UT" , "1995-07-22")
    (3, "Kelly" , "Jones" , 'F' , 'Provo' , 'UT' , '1998-06-22')
    (4, "Devon" , "Merrill" 'M' , "Mesa" , 'AZ' , "2000-07-22")
    (5 , "Mandy" , "Murdock" , 'F' , "Topek" , "KS" , "1996-11-22")
    (6 , "Alece" , "Adams" , 'F' , "Rigby" , "ID" , "1997-05-22")
    (7 , "Bryce" , "Carlson" , 'M' , "Bozeman" , "MT" , "1997-11-22")
    (8 , "Preston" , "Larsen" , 'M' , "Decatur" , "TN" , "1996-09-22")
    (9 , "Julia" , "Madsen" , 'F' , "Rexburg" , "ID" , "1998-09-22")
    (10 , "Susan" , "Sorensen" , 'F' , "Mesa" , "AZ" , "1998-08-09");
    
INSERT INTO semester VALUES
	(1, "Fall" , "2019")
    (2, "Winter" , "2018");
    
INSERT INTO college VALUES
	(1, "College of Physical Science and Engineering")
    (2, "College of Buuisness and Communication")
    (3, "College of Language and Letters")
    
INSERT INTO course VALUES
	(1, "CIT 111")
    (2, "ECON 150")
    (3, "ECON 388")
    (4, "HUM 376")
    
INSERT INTO department VALUES
	(1, "Computer Information Technology" , "CIT" , "111")
    (2, "Economics" , "ECON" , "388" )
    (3, "Economics" , "ECON" , "150")
    (4 , "Humanities and Philosopy" , "HUM" . "376");
    
INSERT INTO sections VALUES
	(1,1)
    (1,2)
    (1,3);
    
INSERT INTO faculty VALUES
	(1, "Marty" , "Morring" , "30")
    (2, "Nate" , "Nathan" , "50")
    (3, "Ben" , "Barrus" , "35")
    (4, "John" , "Jensen" , "30");
    
INSERT INTO courseinfo VALUES
	(1, "Intro to Database" , "CIT" , "3")
    (2, "Econometrics" , "ECON" , "4")
    (3, "Micro Economics" , "ECON" , "3")
    (4, "Classical Heritage" , "HUM" , "2");
    
-- question 1 
use mydb;
SELECT dob, dob AS 'Sept Birthdays'
FROM student
WHERE dob = 'September';

-- question 2
use mydb;
SELECT dob , FORMAT(dob) AS 'YEARS AND DAYS'
FROM student;



-- question 3 
use mydb;
SELECT section_number as fname, lname
FROM faculty f 
JOIN section sec
ON f.section_section_id = sec.section_id
JOIN section_has_Student ssc
ON sec.section_id = ssc.section_section_id
JOIN student s
ON ssc.Student_student_id = s.student_id;

-- question 4
use mybd;
SELECT fname lname
FROM faculty f 
JOIN section sec
ON f.section_section_id = sec.section_id
JOIN section_has_Student ssc
ON sec.section_id = ssc.section_section_id
JOIN student s
ON ssc.Student_student_id = s.student_id;
WHERE student = 'Bryce';

-- question 5
use mybd;
SELECT fname lanme
FROM student s
JOIN section_has_Student ssc
ON s.student_id = sscStudent_student_id
JOIN section sec
ON ssc.section_section_id = sec.section_id
JOIN faculty f
ON f.section_section_id = sec.section_id
JOIN course c
ON c.course_id = f.course_course_id
WHERE course_name = 'economics'
ORDER BY course_name;

-- question 6
use mybd;
SELECT fname , AS dept_name dept_code dept_number
FROM student s
JOIN section_has_Student shs
ON s.student_id = shs.Student_student_id
JOIN section sc
ON shs.section_section_id = sc.section_id
JOIN college c 
ON sc.college_college_id = c.college_id
JOIN department d 
ON c.college_id = d.college_college_id
WHERE student = 'BRYCE' 
ORDER BY course_name;

-- question 7 
use mybd;
SELECT term, COUNT(student_student_id) AS 'Enrollment'
FROM semester s
JOIN section sc
ON s.semester_id = sc.semester_semester_id 
JOIN section_has_Student shs
ON sc.section_id = shs.section_section_id
GROUP BY term 
ORDER BY term;

-- question 8
use mybd;
SELECT department_name, COUNT(course) 
FROM department d
JOIN course c
ON d.course_course_id = c. course_id
GROUP BY department_name;

-- question 9 
use mybd;
SELECT capacity 
FROM faculty 
GROUP BY capacity;

-- question 10 
use mybd;
SELECT fname lname , COUNT(credit)
FROM student s
JOIN section_has_Student ssc
ON s.student_id = sscStudent_student_id
JOIN section sec
ON ssc.section_section_id = sec.section_id
JOIN faculty f
ON f.section_section_id = sec.section_id
JOIN course c
ON c.course_id = f.course_course_id
GROUP BY credit;





    
    









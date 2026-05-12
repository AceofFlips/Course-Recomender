CREATE TABLE IF NOT EXISTS Courses(
   `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
   `c_id` NVARCHAR(12) NOT NULL UNIQUE, /* Id of the course as listed on the school's id system */
   `course_name` NVARCHAR(64) NOT NULL, /* Name of the course */
   `class_name` NVARCHAR(64), /* Alternate/Display name of the course */
    `dep_id` INT NOT NULL,
    `semesters` INT NOT NULL DEFAULT 1,
    `AP` BOOLEAN NOT NULL DEFAULT FALSE,
    `DC` BOOLEAN NOT NULL DEFAULT FALSE,
    `CC` BOOLEAN NOT NULL DEFAULT FALSE,
    `NCAA` BOOLEAN NOT NULL DEFAULT FALSE,
    `max_takes` INT NOT NULL DEFAULT 1,
    `public` BOOLEAN NOT NULL DEFAULT FALSE,
    `description` NVARCHAR(20000) NOT NULL DEFAULT 'No description was provided',

    FOREIGN KEY(`dep_id`) REFERENCES Departments(`id`),

    INDEX `ix_c_id`(`c_id`),
    INDEX `ix_course_name`(`course_name`)
);

ALTER TABLE Courses
MODIFY `c_id` NVARCHAR(12) NOT NULL UNIQUE;
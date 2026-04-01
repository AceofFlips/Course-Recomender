/* This Script is not functional yet. Do not run. */
CREATE TABLE IF NOT EXISTS Pathways(
   `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
   `c_id` NVARCHAR(8) NOT NULL UNIQUE, /* Id of the course as listed on the school's id system */
   `course_name` NVARCHAR(64) NOT NULL, /* Name of the course */
   `class_name` NVARCHAR(64), /* Alternate/Display name of the course */
   `years`
);
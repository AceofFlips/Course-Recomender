CREATE TABLE IF NOT EXISTS CoursesYears(
    `c_id` INT NOT NULL,
    `year` INT NOT NULL,

    FOREIGN KEY(`c_id`) REFERENCES Courses(`id`)
);
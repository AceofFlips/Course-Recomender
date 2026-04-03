CREATE TABLE IF NOT EXISTS CoursesPrereqs(
    `c_id` INT NOT NULL,
    `req_id` INT NOT NULL,
    `required` BOOLEAN NOT NULL,
    `group` INT NOT NULL DEFAULT 1,

    FOREIGN KEY(`c_id`) REFERENCES Courses(`id`),
    FOREIGN KEY(`req_id`) REFERENCES Courses(`id`)
);
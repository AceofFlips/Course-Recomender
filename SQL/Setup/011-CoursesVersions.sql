CREATE TABLE IF NOT EXISTS CoursesVersions(
    `c_id` INT NOT NULL,
    `ver_id` INT NOT NULL,

    FOREIGN KEY(`c_id`) REFERENCES Courses(`id`),
    FOREIGN KEY(`ver_id`) REFERENCES Courses(`id`)
);
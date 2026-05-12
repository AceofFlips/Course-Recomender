CREATE TABLE IF NOT EXISTS CoursesPathways(
    `c_id` INT NOT NULL,
    `path_id` INT NOT NULL,

    FOREIGN KEY(`c_id`) REFERENCES Courses(`id`),
    FOREIGN KEY(`path_id`) REFERENCES Pathways(`id`)
);
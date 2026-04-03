CREATE TABLE IF NOT EXISTS CoursesCredits(
    `c_id` INT NOT NULL,
    `cred_id` INT NOT NULL,

    FOREIGN KEY(`c_id`) REFERENCES Courses(`id`),
    FOREIGN KEY(`cred_id`) REFERENCES Credits(`id`)
);
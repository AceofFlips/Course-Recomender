CREATE TABLE IF NOT EXISTS CourseOtherReqs
(
    c_id INT NOT NULL,
    other_id INT NOT NULL,

    FOREIGN KEY(`c_id`) REFERENCES Courses(`id`),
    FOREIGN KEY(`other_id`) REFERENCES OtherReqs(`id`)
);

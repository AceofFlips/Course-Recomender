CREATE PROCEDURE IF NOT EXISTS GetCoursesByCredit(
    target int
)
BEGIN
    SELECT * FROM Courses JOIN CoursesCredits
        WHERE Courses.id = CoursesCredits.c_id
            AND CoursesCredits.cred_id = target;
end;
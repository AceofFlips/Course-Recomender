CREATE PROCEDURE IF NOT EXISTS GetCourseById(
    target int
)
BEGIN
    SELECT * FROM Courses
        WHERE id = target;
end;

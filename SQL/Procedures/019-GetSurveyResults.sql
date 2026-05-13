CREATE PROCEDURE IF NOT EXISTS GetSurveyResults(
    Path NVARCHAR(12),
    Credit NVARCHAR(12),
    IsCC TINYINT(1)
)
BEGIN
    SELECT  Paths.id, Paths.course_name, Paths.description
    FROM    (SELECT Display.id, Display.course_name, Display.description,
                    ROW_NUMBER() OVER (PARTITION BY Display.course_name ORDER BY Display.id) AS RowNumber
             FROM Courses AS Display JOIN CoursesPathways
             WHERE Display.id = CoursesPathways.c_id
               AND Display.public = 1
               AND FIND_IN_SET(CoursesPathways.path_id,Path)) AS Paths
    WHERE   Paths.RowNumber = 1
    UNION
    SELECT Cred.id, Cred.course_name, Cred.description
    FROM (SELECT Display.id, Display.course_name, Display.description,
                 ROW_NUMBER() OVER (PARTITION BY Display.course_name ORDER BY Display.id) AS RowNumber
          FROM Courses AS Display JOIN CoursesCredits
          WHERE Display.id = CoursesCredits.c_id
            AND Display.public = 1
            AND FIND_IN_SET(CoursesCredits.cred_id,Credit)) AS Cred
    WHERE Cred.RowNumber = 1
    UNION
    SELECT Difficulty.id, Difficulty.course_name, Difficulty.description
    FROM Courses AS Difficulty
    WHERE Difficulty.CC = IsCC
        AND Difficulty.public = 1
    UNION
    SELECT Display.id, Display.course_name, Display.description
    FROM Courses AS Display
    WHERE Display.public = 1;

end;
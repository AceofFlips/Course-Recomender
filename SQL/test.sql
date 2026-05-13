/* used to test queries; do not run unless testing */
/* Research DISTINCT and UNION */

-- Source - https://stackoverflow.com/a/966215
-- Posted by Aaron Alton
-- Retrieved 2026-05-08, License - CC BY-SA 2.5

SELECT  Paths.id, Paths.course_name, Paths.description
FROM    (SELECT Display.id, Display.course_name, Display.description,
                ROW_NUMBER() OVER (PARTITION BY Display.course_name ORDER BY Display.id) AS RowNumber
         FROM Courses AS Display JOIN CoursesPathways
         WHERE Display.id = CoursesPathways.c_id
           AND FIND_IN_SET(CoursesPathways.path_id,'4')
           AND Display.public = 1) AS Paths
WHERE   Paths.RowNumber = 1
UNION
SELECT Cred.id, Cred.course_name, Cred.description
FROM (SELECT Display.id, Display.course_name, Display.description,
             ROW_NUMBER() OVER (PARTITION BY Display.course_name ORDER BY Display.id) AS RowNumber
      FROM Courses AS Display JOIN CoursesCredits
      WHERE Display.id = CoursesCredits.c_id
        AND FIND_IN_SET(CoursesCredits.cred_id,'2,3')
        AND Display.public = 1) AS Cred
WHERE Cred.RowNumber = 1
UNION
SELECT Display.id, Display.course_name, Display.description
FROM Courses AS Display
WHERE Display.public = 1;

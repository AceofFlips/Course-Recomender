/* used to test queries; do not run unless testing */

SELECT DISTINCT Display.course_name, CoursesPathways.path_id FROM Courses AS Display JOIN CoursesPathways
         WHERE Display.id = CoursesPathways.c_id
         AND CoursesPathways.path_id IN (1,3,5,7,9,11,13,15,17,19,2,4,6,8,10,12,14,16)
        ORDER BY FIND_IN_SET(path_id,'1,3,5,7,9,11,13,15,17,19,2,4,6,8,10,12,14,16');

/* Research DISTINCT and UNION */
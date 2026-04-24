CREATE PROCEDURE IF NOT EXISTS JoinAllTables()
BEGIN
    SELECT * FROM Courses JOIN CoursesCredits JOIN CoursesOtherReqs JOIN CoursesPathways
                          JOIN CoursesPrereqs JOIN CoursesVersions JOIN CoursesYears JOIN Credits
                          JOIN Departments JOIN OtherReqs JOIN Pathways
    WHERE Courses.id = CoursesCredits.c_id AND Credits.id = CoursesCredits.cred_id
      AND Courses.id = CoursesOtherReqs.c_id AND OtherReqs.id = CoursesOtherReqs.other_id
      AND Courses.id = CoursesPathways.c_id AND Pathways.id = CoursesPathways.path_id
      AND Courses.id = CoursesYears.c_id
      AND Courses.dep_id = Departments.id;
end;
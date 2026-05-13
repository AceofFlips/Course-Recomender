CREATE PROCEDURE IF NOT EXISTS ShowSelectColumns(
    TblName NVARCHAR(256),
    SColumns NVARCHAR(512)
)
BEGIN
    SET @statement = CONCAT(
            "SELECT ", SColumns," FROM ",TblName,";");
    PREPARE statement_ FROM @statement;
    EXECUTE statement_;
    DEALLOCATE PREPARE statement_;
END;
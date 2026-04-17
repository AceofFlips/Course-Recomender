CREATE PROCEDURE IF NOT EXISTS JoinOnForKey(
    TblOneName NVARCHAR(256),
    TblTwoName NVARCHAR(256),
    JoinColumn NVARCHAR(256),
    SColumns NVARCHAR(512)
)
BEGIN
    SET @statement = CONCAT(
            "SELECT ",SColumns," FROM ",TblOneName, " JOIN ",TblTwoName," ON ", TblOneName,".id = ",TblTwoName,".",JoinColumn,";");
    PREPARE statement_ FROM @statement;
    EXECUTE statement_;
    DEALLOCATE PREPARE statement_;
END;
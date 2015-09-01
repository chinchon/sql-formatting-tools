USE tool;

IF OBJECT_ID('CountNull','FN') IS NOT NULL
    DROP FUNCTION CountNull;

CREATE FUNCTION dbo.CountNull(@One INT,@Two INT,@Three INT,@Four INT,@Five INT)
RETURNS INT
AS
BEGIN
    DECLARE @Result INT = 0
    IF @One IS NULL SET @Result = @Result + 1
    IF @Two IS NULL SET @Result = @Result + 1
    IF @Three IS NULL SET @Result = @Result + 1
    IF @Four IS NULL SET @Result = @Result + 1
    IF @Five IS NULL SET @Result = @Result + 1
    RETURN @Result
END;

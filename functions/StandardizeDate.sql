USE tool;

IF OBJECT_ID('StandardizeDate','FN') IS NOT NULL
    DROP FUNCTION StandardizeDate;

CREATE FUNCTION dbo.StandardizeDate(@Date VARCHAR(255))
RETURNS DATE
AS
BEGIN
    IF @Date = '' SET @Date = NULL
    IF tool.dbo.RegexRemove(@Date,'[^0-9]') = '00000000' SET @Date = NULL
    ELSE SET @Date = CONVERT(DATE,@Date)
    RETURN @Date
END;

USE tool;

IF OBJECT_ID('FixMYR','FN') IS NOT NULL
    DROP FUNCTION FixMYR;

CREATE FUNCTION dbo.FixMYR(@String VARCHAR(255))
RETURNS VARCHAR(255)
AS
BEGIN
    IF @String = 'RM' SET @String = 'MYR'
    RETURN @String
END;

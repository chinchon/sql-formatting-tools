USE tool;

IF OBJECT_ID('StripSpaces','FN') IS NOT NULL
    DROP FUNCTION StripSpaces;

CREATE FUNCTION dbo.StripSpaces(@String VARCHAR(255))
RETURNS VARCHAR(255)
AS
BEGIN
    SET @String = REPLACE(@String,'	',' ')
    WHILE CHARINDEX('  ',@String) > 0 
        SET @String = REPLACE(@String,'  ',' ')
    RETURN @String
END;

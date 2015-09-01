USE tool;

IF OBJECT_ID('RemoveLeadingZero','FN') IS NOT NULL
    DROP FUNCTION RemoveLeadingZero;

CREATE FUNCTION dbo.RemoveLeadingZero(@String VARCHAR(255))
RETURNS VARCHAR(255)
AS
BEGIN
    WHILE LEFT(@String,1) = '0'
    SET @String = STUFF(@String,1,1,'')
    RETURN @String
END;

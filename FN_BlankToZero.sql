USE tool;

IF OBJECT_ID('BlankToZero','FN') IS NOT NULL
    DROP FUNCTION BlankToZero;

CREATE FUNCTION dbo.BlankToZero(@Number VARCHAR(255))
RETURNS VARCHAR(255)
AS
BEGIN
    SET @Number = REPLACE(@Number,',','')
    IF @Number = '' SET @Number = '0'
    RETURN @Number
END;

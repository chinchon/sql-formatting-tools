USE tool;

IF OBJECT_ID('BlankToNull','FN') IS NOT NULL
    DROP FUNCTION BlankToNull;

CREATE FUNCTION dbo.BlankToNull(@Number VARCHAR(255))
RETURNS VARCHAR(255)
AS
BEGIN
    SET @Number = REPLACE(@Number,',','')
    IF @Number = '' SET @Number = NULL
    RETURN @Number
END;

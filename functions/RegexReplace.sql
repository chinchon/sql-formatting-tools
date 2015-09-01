USE tool;

IF OBJECT_ID('RegexReplace', 'FN') IS NOT NULL
    DROP FUNCTION RegexReplace;

-- replaces characters that match regex pattern with provided string
-- infinite loop risk, make sure string to replace with does not match the regex pattern 
CREATE FUNCTION dbo.RegexReplace(@String VARCHAR(255),@Pattern VARCHAR(255),@ReplaceWith VARCHAR(255))
RETURNS VARCHAR(255)
AS
BEGIN
    SET @Pattern = '%'+@Pattern+'%'

    WHILE PATINDEX(@Pattern,@String) > 0
    SET @String = STUFF(@String,PATINDEX(@Pattern,@String),1,@ReplaceWith)

    RETURN @String
END;

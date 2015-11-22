USE tool;

IF OBJECT_ID('RegexRemove', 'FN') IS NOT NULL
    DROP FUNCTION RegexRemove;

-- removes characters that match provided regex pattern  
CREATE FUNCTION dbo.RegexRemove(@String VARCHAR(255),@Pattern VARCHAR(255))
RETURNS VARCHAR(255)
AS
BEGIN
    RETURN tool.dbo.RegexReplace(@String,@Pattern,'')
END;

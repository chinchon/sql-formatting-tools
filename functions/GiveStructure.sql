USE tool;

IF OBJECT_ID('GiveStructure','FN') IS NOT NULL
    DROP FUNCTION GiveStructure;

CREATE FUNCTION dbo.GiveStructure(@String VARCHAR(255))
RETURNS VARCHAR(255)
AS
BEGIN
    WHILE PATINDEX('%[^X9-]%',@String) > 0
    BEGIN
    DECLARE @Pos INT = PATINDEX('%[^X9-]%',@String)
    SET @String =
        CASE  
            WHEN SUBSTRING(@String,@Pos,1) LIKE '[a-z]' THEN STUFF(@String,@Pos,1,'X')
            WHEN SUBSTRING(@String,@Pos,1) LIKE '[0-9]' THEN STUFF(@String,@Pos,1,'9')
            ELSE STUFF(@String,@Pos,1,'-')
        END
    END
    RETURN UPPER(@String)
END;

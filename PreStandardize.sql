-- PreStandardize is a stored procedure that creates new table with standardized column names and standard cleansing on the data


-- drop procedure if procedure exists in database
IF OBJECT_ID('PreStandardize') IS NOT NULL 
DROP PROCEDURE PreStandardize;

-- create procedure taking original table name, new table name and the source file name
CREATE PROCEDURE PreStandardize(
    @TableName VARCHAR(255)
    ,@NewTable VARCHAR(255)
    ,@srcfile VARCHAR(255)
) AS
    -- create a temporary table to store column names and their sequential numbering
    DECLARE @Temp TABLE(
        col VARCHAR(255)
        ,pos INT
    )
    INSERT INTO @Temp 
    SELECT COLUMN_NAME,ORDINAL_POSITION 
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName
   
    DECLARE @ColumnNames VARCHAR(max) = '' -- string to be executed in the dynamic query later
    DECLARE @Counter INT = 1 -- counter to be looped over
    DECLARE @MaxColumn INT = (SELECT MAX(pos) FROM @Temp) -- number of column, where loop should stop
   
    -- append one column name per loop to the query string 
    WHILE @Counter <= @MaxColumn
    BEGIN
        SET @ColumnNames = @ColumnNames 
        + ',' 
        -- enable trimming and reducing white spaces in data when query is executed
        + ( 
            SELECT 'LTRIM(RTRIM(tool.dbo.StripSpaces([' + col + '])))' 
            FROM @Temp WHERE pos = @Counter
        ) 
        + ' AS '
        -- standardize column name: lower case, spaces replaced with underscores, trimmed, white spaces reduced, only alphanumeric characters kept
        + ( 
            SELECT LOWER(REPLACE(LTRIM(RTRIM(tool.dbo.StripSpaces(tool.dbo.RegexReplace(col,'[^a-z0-9 ]',' ')))),' ','_')) 
            FROM @Temp WHERE pos = @Counter
        ) 
        + CHAR(13) -- add a new line
        
        -- update counter
        SET @Counter = @Counter + 1
    END
   
    -- append source file name at the end of the query string
    SET @ColumnNames = @ColumnNames + ',''' + @srcfile + ''' AS src_file'
    
    -- remove the first comma from the query string
    SET @ColumnNames = STUFF(@ColumnNames,1,1,'')
   
    -- execute the dynamic query, new table is created 
    EXECUTE(' SELECT ' + @ColumnNames + ' INTO ' + @NewTable + ' FROM ' + @TableName);
    
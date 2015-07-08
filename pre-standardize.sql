IF OBJECT_ID('PreStandardize') IS NOT NULL DROP PROCEDURE PreStandardize;
CREATE PROCEDURE PreStandardize(@TableName VARCHAR(255),@NewTable VARCHAR(255),@srcfile VARCHAR(255)) AS
	DECLARE @Temp TABLE(col VARCHAR(255), pos INT)
   INSERT INTO @Temp SELECT COLUMN_NAME,ORDINAL_POSITION FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName
   
   DECLARE @ColumnNames VARCHAR(max) = ''
	DECLARE @Counter INT = 1
   DECLARE @MaxColumn INT = (SELECT MAX(pos) FROM @Temp)
   WHILE @Counter <= @MaxColumn
   BEGIN
      SET @ColumnNames = @ColumnNames + ',' 
		+(SELECT 'LTRIM(RTRIM(tool.dbo.StripSpaces([' + col + '])))' FROM @Temp WHERE pos = @Counter) + ' AS '
      +(SELECT LOWER(REPLACE(LTRIM(RTRIM(tool.dbo.StripSpaces(tool.dbo.RegexReplace(col,'[^a-z0-9 ]',' ')))),' ','_')) 
		FROM @Temp WHERE pos = @Counter) + CHAR(13)
      SET @Counter = @Counter + 1
   END
   
   SET @ColumnNames = @ColumnNames + ',''' + @srcfile + ''' AS pwc_src_file'
   SET @ColumnNames = STUFF(@ColumnNames,1,1,'')
   
   EXECUTE(' SELECT ' + @ColumnNames + ' INTO ' + @NewTable + ' FROM ' + @TableName);

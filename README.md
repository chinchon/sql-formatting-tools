# sql-formatting-functions

## PreStandardize.sql
PreStandardize is a stored procedure that creates new table with standardized column names. It also applies standard cleansing on the data. This store procedure requires only the original table name and the new table name. A preliminary table will be created under the new table name. 

## Functions
This folder contains utility functions that can be used to cleanse data. The functions include: 
    
    BlankToNull.sql
    BlankToZero.sql
    CountNull.sql
    DecimalPlaces.sql
    FixMYR.sql
    GiveStructure.sql
    RegexRemove.sql
    RegexReplace.sql
    RemoveLeadingZero.sql
    StandardizeDate.sql
    StandardizePhoneNo.sql
    StripSpaces.sql

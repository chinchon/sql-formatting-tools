# sql-formatting-tools

## Stored Procedure
* PreStandardize: creates a new table with standardized column names and applies cleansing to the data.

## Functions
* BlankToNull: returns NULL instead of blanks, useful for fields that cannot be blank, e.g. DATE
* BlankToZero: returns 0 instead of blanks, useful for fields that cannot be blank, e.g. NUMERIC
* DecimalPlaces: returns the number of decimal places of a number
* FixMYR: returns official currency code 'MYR' instead of 'RM'
* GiveStructure: returns a string comprising of 'X','9','-' corresponding to aplhabets, numbers and symbols, e.g. '$foobar$2000' -> '-XXXXXX-9999', useful for finding patterns among data
* RegexRemove: returns a string with characters matching regular expression removed
* RegexReplace: returns a string with characters matching regular expression replaced
* RemoveLeadingZero: returns a string with leading zeroes removed
* StandardizeDate: returns a properly formatted date 
* StadardizePhoneNo: returns a string of phone number with country and area codes removed
* StripSpaces: returns a string with additional white spaces removed

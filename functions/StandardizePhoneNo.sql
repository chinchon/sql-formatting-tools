USE tool;

IF OBJECT_ID('StandardizePhoneNo', 'FN') IS NOT NULL
    DROP FUNCTION StandardizePhoneNo;

CREATE FUNCTION dbo.StandardizePhoneNo(@PhoneNo VARCHAR(255))
RETURNS VARCHAR(255)
AS
BEGIN
    SET @PhoneNo = tool.dbo.RegexRemove(@PhoneNo,'[^0-9]') 
    WHILE LEFT(@PhoneNo,1) = '0' SET @PhoneNo = STUFF(@PhoneNo,1,1,'')
    IF LEFT(@PhoneNo,2) = '60' SET @PhoneNo = STUFF(@PhoneNo,1,2,'')
    RETURN @PhoneNo 
END;
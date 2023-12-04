CREATE PROCEDURE dbo.pInsertVolunteerDriver(@Title nvarchar(8), @FirstName nvarchar(50), @MiddleName nvarchar(50), @LastName nvarchar(50), 
                 @Suffix nvarchar(10), @DOB datetime, @Email nvarchar(50), @EmailContactPref bit, @ModifiedBy nvarchar(50), 
				 @VolunteerPersonID INT, @ContactAddress1 nvarchar(max), @ContactAddress2 nvarchar(max), @City nvarchar(50), @State varchar(20),
				 @ZipCode varchar(10),@ContactHomePhone nvarchar(25), @ContactWorkPhone nvarchar(25), @ContactCellPhone nvarchar(25),
				 @ContactPager nvarchar(25) , @VolunteerTypeID int, @IsActive BIT, @ContactInformation nvarchar(MAX), @Job nvarchar(50), @Note varchar(MAX))
AS
BEGIN
  DECLARE @PersonID INT

  EXEC dbo.pInsertPerson @Title, @FirstName, @MiddleName, @LastName , @Suffix, @DOB, @Email, @EmailContactPref, @ModifiedBy, 1, 1 , ''
  Select * FROM Person.Person WHERE @PersonID = (Select MAX(PersonID) FROM Person.Person)
  EXEC dbo.pInsertVolunteerContactInformation @VolunteerPersonID, @PersonID, 10, @ContactAddress1, @ContactAddress2, @City , @State,
	                                          @ZipCode, @ContactHomePhone, @ContactWorkPhone, @ContactCellPhone, @ContactPager,
											  @VolunteerTypeID, @IsActive, @ModifiedBy

  EXEC dbo.pInsertVolunteerEmergencyContact @VolunteerPersonID, @ContactInformation, @ModifiedBy
  EXEC dbo.pInsertVolunteerJobs @VolunteerPersonID, @Job, @ModifiedBy
  EXEC dbo.pInsertVolunteerNotes @VolunteerPersonID, @Note, @ModifiedBy
END
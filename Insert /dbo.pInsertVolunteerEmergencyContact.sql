CREATE Procedure dbo.pInsertVolunteerEmergencyContact(@VolunteerPersonID INT, @ContactInformation nvarchar(MAX), @ModifiedBy varchar(50)) 
AS
BEGIN

 INSERT Volunteer.VolunteerEmergencyContact(VolunteerPersonID, ContactInformation, ModifiedDate, ModifiedBy)
					VALUES (@VolunteerPersonID,@ContactInformation, SYSDATETIME(),@ModifiedBy)
END

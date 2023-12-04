CREATE Procedure dbo.pInsertVolunteerNotes(@VolunteerPersonID INT, @Note varchar(MAX), @ModifiedBy varchar(50)) 
AS
BEGIN

 INSERT Volunteer.VolunteerNotes(VolunteerPersonID, Note, ModifiedDate, ModifiedBy)
					VALUES (@VolunteerPersonID,@Note, SYSDATETIME(),@ModifiedBy)
END
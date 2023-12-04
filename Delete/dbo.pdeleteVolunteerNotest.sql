CREATE Procedure dbo.pDeleteVolunteerNotes( @VolunteerPersonID INT) 
AS
BEGIN

 DELETE FROM Volunteer.VolunteerNotes Where VolunteerPersonID = @VolunteerPersonID 
				
END

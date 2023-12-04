CREATE Procedure dbo.pDeleteVolunteerContactInformation( @VolunteerPersonID INT) 
AS
BEGIN

 DELETE FROM Volunteer.VolunteerContactInformation Where VolunteerPersonID = @VolunteerPersonID 
				
END

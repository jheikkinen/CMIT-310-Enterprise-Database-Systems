CREATE Procedure dbo.pDeleteVolunteerEmergencyContact( @VolunteerPersonID INT) 
AS
BEGIN

 DELETE FROM Volunteer.VolunteerEmergencyContact Where VolunteerPersonID = @VolunteerPersonID 
				
END

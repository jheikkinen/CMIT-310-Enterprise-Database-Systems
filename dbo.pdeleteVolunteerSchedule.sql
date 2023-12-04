CREATE Procedure dbo.pDeleteVolunteerSchedule( @VolunteerPersonID INT) 
AS
BEGIN

 DELETE FROM Volunteer.VolunteerSchedule Where VolunteerPersonID = @VolunteerPersonID 
				
END
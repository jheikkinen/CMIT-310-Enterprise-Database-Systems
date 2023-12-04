CREATE Procedure dbo.pDeleteVolunteerJobs( @VolunteerPersonID INT) 
AS
BEGIN

 DELETE FROM Volunteer.VolunteerJobs Where VolunteerPersonID = @VolunteerPersonID 
				
END

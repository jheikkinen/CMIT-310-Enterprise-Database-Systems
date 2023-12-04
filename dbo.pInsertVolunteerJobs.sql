CREATE Procedure dbo.pInsertVolunteerJobs(@VolunteerPersonID INT, @Job nvarchar(50), @ModifiedBy varchar(50)) 
AS
BEGIN

 INSERT Volunteer.VolunteerJobs(VolunteerPersonID, Job, ModifiedDate, ModifiedBy)
					VALUES (@VolunteerPersonID,@Job, SYSDATETIME(),@ModifiedBy)
END
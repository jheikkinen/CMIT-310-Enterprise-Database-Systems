CREATE Procedure dbo.pDeleteLUVolunteerJobType( @JobTypeID INT) 
AS
BEGIN

 DELETE FROM Volunteer.LUVolunteerJobType Where VolunteerJobTypeID = @JobTypeID 
				
END

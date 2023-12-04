CREATE Procedure dbo.pDeleteLUVolunteerType( @VolunteerTypeID INT) 
AS
BEGIN

 DELETE FROM Volunteer.LUVolunteerType Where VolunteerTypeID = @VolunteerTypeID 
				
END

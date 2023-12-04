CREATE Procedure dbo.pInsertLUVolunteerJobType( @JobType nvarchar(50), @JobDescription nvarchar(50), @ModifiedBy varchar(50), @IsDeleted BIT) 
AS
BEGIN

 INSERT Volunteer.LUVolunteerJobType(JobType, JobDescription, ModifiedDate, ModifiedBy, IsDeleted)
					VALUES (@JobType, @JobDescription, SYSDATETIME(),@ModifiedBy, @IsDeleted)
END

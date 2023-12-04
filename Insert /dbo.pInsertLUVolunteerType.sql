CREATE Procedure dbo.pInsertLUVolunteerType( @VolunteerType nvarchar(20), @VolunteerTypeDescription nvarchar(50), @ModifiedBy varchar(50), @IsDeleted BIT) 
AS
BEGIN

 INSERT Volunteer.LUVolunteerType( VolunteerType , VolunteerTypeDescription , ModifiedDate, ModifiedBy, IsDeleted)
					VALUES (@VolunteerType , @VolunteerTypeDescription , SYSDATETIME(),@ModifiedBy, @IsDeleted)
END

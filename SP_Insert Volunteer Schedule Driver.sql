CREATE PROCEDURE dbo.pInsertVolunteerScheduleDriver(
   @FirstName nvarchar(50),
   @LastName nvarchar(50),
   @Date date,
   @StartTime time,
   @EndTime time,
   @Location nvarchar(50),
   @IsNoShow bit,
   @HoursTotal int,
   @ModifiedBy varchar(50),
   @OrganizationName nvarchar(50),
   @Job nvarchar(50),
   @Success bit Output,
   @ErrorStatus Nvarchar(50) Output
)

AS
SET NOCOUNT ON;
BEGIN
  DECLARE 
  @PersonID INT,
  @VolunteerPersonID INT,
  @VolunteerScheduleID INT,
  @OrganizationID INT;

  SET @Success = 0;
  SET @ErrorStatus ='';

BEGIN TRY
     BEGIN TRANSACTION;

	 SELECT @PersonID = Person.PersonID FROM Person.Person WHERE Person.FirstName = @FirstName AND Person.LastName = @LastName;
	 SELECT @VolunteerPersonID = VolunteerContactInformation.VolunteerPersonID FROM Volunteer.VolunteerContactInformation WHERE VolunteerContactInformation.PersonID = @PersonID;
	 SELECT @OrganizationID = dbo.Organization.OrganizationID FROM dbo.Organization WHERE dbo.Organization.OrganizationName = @OrganizationName

	 EXEC dbo.pInsertVolunteerSchedule @VolunteerPersonID, @OrganizationID, @Date, @StartTime, @EndTime, @Location, @IsNoShow, @HoursTotal, @ModifiedBy

    if @@ERROR <> 0
      BEGIN
	      SELECT @ErrorStatus = CONVERT(nVarchar(50), @@ERROR) + '-1000';
		  SET @Success = 0;
		  RAISERROR(@ErrorStatus, 16, 1);
	  END

  Select * FROM Volunteer.VolunteerSchedule WHERE @VolunteerScheduleID = (Select MAX(VolunteerScheduleID) FROM Volunteer.VolunteerSchedule);

  	 EXEC dbo.pInsertVolunteerJobs @VolunteerScheduleID, @Job, @ModifiedBy

  set @success = 1;
  set @ErrorStatus = 0;
  
  COMMIT TRANSACTION;
  END TRY

  BEGIN CATCH
		ROLLBACK TRANSACTION;
		
        if @@ERROR <> 0
          BEGIN
	         SELECT @ErrorStatus = CONVERT(nVarchar(50), @@ERROR) + '-1000';
		     SET @Success = 0;
		     RAISERROR(@ErrorStatus, 16, 1);
	      END

  END CATCH

END
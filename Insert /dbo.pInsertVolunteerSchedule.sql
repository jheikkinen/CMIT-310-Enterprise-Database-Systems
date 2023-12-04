CREATE Procedure dbo.pInsertVolunteerSchedule(@VolunteerPersonID INT, @Date DATE, @StartTime TIME, @ENDTime TIME, @IsNoShow BIT, @HoursTotal INT, @ModifiedBy varchar(50)) 
AS
BEGIN

 INSERT Volunteer.VolunteerSchedule(VolunteerPersonID, Date, StartTime, ENDTime, IsNoShow, HoursTotal, ModifiedDate, ModifiedBy)
					VALUES (@VolunteerPersonID,@Date, @StartTime, @ENDTime, @IsNoShow, @HoursTotal, SYSDATETIME(),@ModifiedBy)
END

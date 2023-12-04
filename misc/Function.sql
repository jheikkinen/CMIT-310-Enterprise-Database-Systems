USE [ChamplainCharityLLC]
GO

CREATE FUNCTION [dbo].[TotalHoursPerVolunteer]
(@PersonID1 int, @PersonID2 INT)
RETURNS TABLE
AS
RETURN
  SELECT CI.PersonID, CI.ContactAddress1, CI.City, CI.State, CI.ZipCode, CI.ContactHomePhone, CI.ContactCellPhone, S.HoursTotal FROM Volunteer.VolunteerContactInformation AS CI
  Inner Join Volunteer.VolunteerSchedule AS S
  ON CI.VolunteerPersonID = S.VolunteerPersonID
  Where CI.VolunteerPersonID BETWEEN @PersonID1 AND @PersonID2; 

  GO

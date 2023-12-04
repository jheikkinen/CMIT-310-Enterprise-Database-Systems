CREATE Procedure dbo.VolunteerHoursReport(@PersonID1 INT, @PersonID2 INT)
AS
BEGIN
WITH HoursTotal
  AS (Select * FROM [dbo].TotalHoursPerVolunteer(@PersonID1,@PersonID2))
  SELECT P.FirstName, P.LastName, H.PersonID, H.ContactAddress1, H.ContactHomePhone, H.ContactCellPhone, SUM(H.HoursTotal) AS TotalHours
  FROM HoursTotal AS H
  Inner Join Person.Person AS P
  ON H.PersonID = P.PersonID
  Group BY P.FirstName, P.LastName, H.PersonID, H.ContactAddress1, H.ContactHomePhone, H.ContactCellPhone;
END

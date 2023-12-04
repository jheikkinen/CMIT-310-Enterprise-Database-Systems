CREATE Procedure dbo.pReportVolunteer( @VolunteerPersonID INT) 
AS
BEGIN

 WITH Volunteer AS
	    (Select VolunteerPersonID = @VolunteerPersonID, PersonID, ContactAddress1, ContactAddress2, ContactHomePhone, ContactCellPhone FROM Volunteer.VolunteerContactInformation),
	  Notes AS
	    (Select VolunteerPersonID = @VolunteerPersonID, Note FROM Volunteer.VolunteerNotes)
Select  CONCAT(P.FirstName, '', P.LastName), P.DateOfBirth, P.EmailAddress , V.ContactAddress1, V.ContactAddress2, V.ContactHomePhone, V.ContactCellPhone, N.Note
	FROM Volunteer AS V
	Inner Join Notes AS N
	On V.VolunteerPersonID = N.VolunteerPersonID
	Inner Join Person.Person AS P
	ON V.PersonID = P.PersonID 
				
END
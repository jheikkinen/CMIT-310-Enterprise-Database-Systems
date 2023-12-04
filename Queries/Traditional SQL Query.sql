/*Query looks up a Person's email and housing status. Uses a select query with an inner join
to combine two tables.*/
Select  concat(Person.Firstname, ' ', Person.LastName) As Name, --Concat funtion used to combine first and last names.
  IsNull(Person.EmailAddress, 'No Email') AS Email, --Null function is used to replace null email addresses with 'No Email'.
  Demographics.HousingStatus AS Housing 
  From  Person.Person
  Inner Join Person.Demographics --Joins the demographics table with the person table.
  On Person.PersonID = Demographics.PersonID
  Where Demographics.HousingStatus = 'Rent' OR Demographics.HousingStatus = 'OWN' --Looking for people who have housing.

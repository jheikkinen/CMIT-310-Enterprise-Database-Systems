/*Query looks up a Person's email and housing status via CTE table.
CTE Uses a select query with an inner join to combine two tables.
Then another select statement to query the CTE table for people who rent or own.*/
With PersonHousing (Name, Email, Housing) --CTE Statement
  AS (Select  concat(Person.Firstname, ' ', Person.LastName), --Concat funtion used to combine first and last names.
  IsNull(Person.EmailAddress, 'No Email'), --Null function is used to replace null email addresses with 'No Email'.
  Demographics.HousingStatus 
  From  Person.Person 
  Inner Join Person.Demographics --Joins the demographics table with the person table.
  On Person.PersonID = Demographics.PersonID) 
Select Name, Email, Housing From PersonHousing --Select statement that is looking for people who rent or own.
  Where Housing = 'Rent' OR Housing = 'OWN'
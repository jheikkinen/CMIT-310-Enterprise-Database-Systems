/*************************************************************************************************
*Author: James Heikkinen
*Date: 15 JAN 2023
Description: Returns all people based on housing status and tamily status. 
**************************************************************************************************/

/*Find listed data from the Person and Demographics tables.*/
SELECT FirstName, LastName, HousingStatus, FamilyStatusType
FROM Person.Person
RIGHT Join Person.Demographics ON Person.PersonID = Demographics.PersonID

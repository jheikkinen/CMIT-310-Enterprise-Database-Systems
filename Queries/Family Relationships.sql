/*************************************************************************************************
*Author: James Heikkinen
*Date: 15 JAN 2023
Description: Returns all people within a family. 
**************************************************************************************************/

/*Find listed data from the FamilyRelationships and Person tables. Filter items with a null value for FamilyRelationshipID.*/
Select FamilyRelationshipID, FirstName, LastName, RelationDescription 
 FROM Person.FamilyRelationships
 RIGHT JOIN Person.Person 
 ON FamilyRelationships.PersonID = Person.PersonID
 WHERE FamilyRelationshipID IS NOT null
  

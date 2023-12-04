CREATE Procedure dbo.pInsertVolunteerContactInformation(@VolunteerPersonID INT, @ContactAddress1 nvarchar(max), 
       @ContactAddress2 nvarchar(max), @ContactHomePhone nvarchar(25),@ContactWorkPhone nvarchar(25), @ContactCellPhone nvarchar(25),
	   @ContactPager nvarchar(25) , @VolunteerTypeID int, @IsActive BIT, @ModifiedBy varchar(50)) 
AS
BEGIN

 INSERT Volunteer.VolunteerContactInformation(VolunteerPersonID, ContactAddress1, 
       ContactAddress2, ContactHomePhone,ContactWorkPhone, ContactCellPhone, ContactPager, VolunteerTypeID,
	    IsActive,ModifiedDate, ModifiedBy)
					VALUES (@VolunteerPersonID, @ContactAddress1, 
       @ContactAddress2, @ContactHomePhone,@ContactWorkPhone, @ContactCellPhone, @ContactPager, @VolunteerTypeID,
	    @IsActive, SYSDATETIME(),@ModifiedBy)
END

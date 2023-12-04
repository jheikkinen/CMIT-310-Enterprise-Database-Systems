Create Table Volunteer.VolunteerSchedule (
	VolunteerScheduleID Int Primary Key,
	VolunteerPersonID Int Not NULL,
	Constraint FK_VolunteerPersonID
	Foreign Key(VolunteerPersonID)  
	References Volunteer.VolunteerContactInformation(VolunteerPersonID),
	Date Date Not Null,
	StartTime Time,
	EndTime Time,
	IsNoShow BIT Default null,
	HoursTotal Int,
	ModifiedDate Date Not NULL,
	ModifiedBy VARCHAR(50) Not NULL
	)

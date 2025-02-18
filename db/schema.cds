namespace eagle.cnf01;

using { 
  cuid,
  Country,
  Currency,
  Language,
  sap.common.Timezones as Timezones,
  User,
  managed,
  sap.common.CodeList as CodeList, 
} from '@sap/cds/common';

entity Confirmations : cuid, managed {
  Description : String(255);
  @mandatory
  @title : 'User'
  User: Association to one Users;
  @title : 'Plant'
  Plant : Association to one Plants;
  @title : 'Location'
  Location : Association to one Locations;
  @assert.target
  @mandatory
  @title : 'Type of Work'
  WorkType: Association to one CnfWorkTypes;  
  @title : 'Start Date/Time'
  StartTime : Timestamp;
  @title : 'End Date/Time'
  EndTime : Timestamp;
  @assert.target
  @mandatory  
  @title : 'Status'
  Status : Association to one CnfStatusses;
}

entity CnfIndLabTasks : CodeList, managed {
  key code : String(10);
}

entity CnfWorkTypes : CodeList, managed {
  key code : String(10);
}

type Status : String enum {
    Started; 
    InProgress; 
    Completed; 
    Canceled;
  } default 'Started';

entity CnfStatusses : CodeList, managed {
  key code : String(10) default '10';  
}

annotate Confirmations{
   @Core.Computed
   ID;
};

entity Users : cuid, managed {
  @title : 'First Name'
  FirstName : String(100);
  @title : 'Last Name'
  LastName : String(100);
  @mandatory
  @title : 'E-mail'
  Email : String(255);
  @mandatory
  @title : 'Workday ID'
  WorkDayID : String(50);
  @title : 'User TimeZone'
  Timezone : Association to Timezones;
  @mandatory
  @title : 'User Language'
  Language: Language;
  @title : 'User Site/Plant'
  AssignedPlant: Association to one Plants;
  @title : 'Default Location'
  DefaultLocation : Association to one Locations;
}

annotate Users with @assert.unique :
{
    UserWorkDayID : [ WorkDayID ],
};

entity Plants : CodeList, managed {
  key code : String(10);
}

entity Locations : CodeList, managed {
  key code : String(10);
  @title : 'Location Plant'
  Plant : Association to one Plants;
}


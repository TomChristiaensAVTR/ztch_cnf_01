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
  User: Association to one Users;
  @assert.target
  @mandatory
  WorkType: Association to one WorkTypes;  
  @mandatory
  StartTime : Timestamp;
  EndTime : Timestamp;
  Status : String enum {
    Started; 
    InProgress; 
    Completed; 
    Canceled;
  } default 'Started';
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

entity WorkTypes : CodeList, managed {
  key code : String(10);
}

entity Plants : CodeList{
  key code : String(10);
}

entity Locations : CodeList, managed {
  key code : String(10);
  @title : 'Location Plant'
  Plant : Association to one Plants;
}


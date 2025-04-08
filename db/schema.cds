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
  @title : 'Description'
  Description : String(255);
  @mandatory
  @title : 'User'
  _User: Association to one Users;
  @title : 'Plant'
  _Plant : Association to one Plants;
  @title : 'Location'
  _Location : Association to one Locations;
  @assert.target
  @mandatory
  @title : 'Type of Work (Direct/Indirect)'
  _WorkType: Association to one CnfWorkTypes;  
  @title : 'Production Order'
  DirOrder : String(10);
  @title : 'Production Order Operation'
  DirTask : String(10);
  @title : 'Indirect Labour Task'
  _IndTask : Association to CnfIndLabTasks;
  @title : 'Start Date/Time'
  StartTime : Timestamp;
  @title : 'End Date/Time'
  EndTime : Timestamp;
  @assert.target
  @mandatory  
  @title : 'Status'
  _Status : Association to one CnfStatusses;
}

entity CnfIndLabTasks : CodeList, managed {
  key code : String(10);
  directfieldControl : Integer;
  indirectfieldcontrol : Integer;  
}

entity CnfWorkTypes : CodeList, managed {
  key code : String(10);
  directfieldControl : Integer;
  indirectfieldcontrol : Integer;
}

// fieldcontrol - More information
// 7 - Mandatory
// 3 - Optional
// 1 - Read Only
// 0 - Hidden/Inapplicable 

type Status : String enum {
    Started; 
    InProgress; 
    Completed; 
    Canceled;
  } default 'Started';

entity CnfStatusses : CodeList, managed {
  key code : String(10) default '10';
  fieldControl : Integer;
  startActionControl : Boolean;
  stopActionControl : Boolean;  
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
  @assert.format : '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
  Email : String(255);
  @mandatory
  @title : 'Workday ID'
  WorkDayID : String(50);
  @title : 'User TimeZone'
  _Timezone : Association to one Timezones;
  @mandatory
  @title : 'User Language'
  Language: Language;
  @title : 'User Site/Plant'
  @mandatory
  @assert.target
  _DefaultPlant: Association to one Plants;
  @title : 'Default Location'
  @mandatory
  @assert.target
  _DefaultLocation : Association to one Locations;
}

annotate Users with @assert.unique :
{
    UserWorkDayID : [ WorkDayID ],
};

annotate Users {
   @Core.Computed
   ID;
};

entity Plants : CodeList, managed {
  @ttile: 'Plant ID'
  key code : String(10);
}

entity Locations : CodeList, managed {
  @ttile: 'Location ID'
  key code : String(10);
  @title : 'Location Plant'
  _Plant : Association to one Plants;
}


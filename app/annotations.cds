using { admin } from '../srv/service.cds';

annotate admin.CnfWorkTypes with @UI.HeaderInfo: { TypeName: 'Work Type', TypeNamePlural: 'Work Types', Title: { Value: descr } };
annotate admin.CnfWorkTypes with @UI.Identification: [{ Value:descr }];
annotate admin.CnfWorkTypes with {
  descr @title: 'Description'
};

annotate admin.CnfWorkTypes with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: descr }
];

annotate admin.CnfWorkTypes with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: descr }
  ]
};

annotate admin.CnfWorkTypes with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate admin.CnfWorkTypes with @UI.SelectionFields: [
  code
];


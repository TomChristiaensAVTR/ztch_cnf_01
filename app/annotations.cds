using { admin } from '../srv/service.cds';

annotate admin.WorkTypes with @UI.HeaderInfo: { TypeName: 'Work Type', TypeNamePlural: 'Work Types', Title: { Value: descr } };
annotate admin.WorkTypes with @UI.Identification: [{ Value:descr }];
annotate admin.WorkTypes with {
  descr @title: 'Description'
};

annotate admin.WorkTypes with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: descr }
];

annotate admin.WorkTypes with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: descr }
  ]
};

annotate admin.WorkTypes with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate admin.WorkTypes with @UI.SelectionFields: [
  code
];


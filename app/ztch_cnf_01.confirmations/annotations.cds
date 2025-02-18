using admin as service from '../../srv/service';
annotate service.Confirmations with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : Description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'WorkType_code',
                Value : WorkType_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'StartTime',
                Value : StartTime,
            },
            {
                $Type : 'UI.DataField',
                Label : 'EndTime',
                Value : EndTime,
            },
            {
                $Type : 'UI.DataField',
                Value : User_ID,
                Label : 'User_ID',
            },
            {
                $Type : 'UI.DataField',
                Value : Status,
                Label : 'Status',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : Description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'WorkType_code',
            Value : WorkType_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'StartTime',
            Value : StartTime,
        },
        {
            $Type : 'UI.DataField',
            Label : 'EndTime',
            Value : EndTime,
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'admin.Start',
            Label : 'Start',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'admin.Stop',
            Label : 'Stop',
        },
    ],
);

annotate service.Confirmations with {
    User @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Users',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : User_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'FirstName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'LastName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'WorkDayID',
            },
        ],
    }
};


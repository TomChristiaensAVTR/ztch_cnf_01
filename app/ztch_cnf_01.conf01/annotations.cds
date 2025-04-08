using admin as service from '../../srv/service';
annotate service.Confirmations with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Description,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>DirectindirectWork}',
                Value : _WorkType_code,
            },
            {
                $Type : 'UI.DataField',
                Value : _User.WorkDayID,
            },
            {
                $Type : 'UI.DataField',
                Label : '_Plant_code',
                Value : _Plant_code,
            },
            {
                $Type : 'UI.DataField',
                Label : '_Location_code',
                Value : _Location_code,
            },
            {
                $Type : 'UI.DataField',
                Value : DirOrder,
            },
            {
                $Type : 'UI.DataField',
                Value : DirTask,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>IndirectLabourTask}',
                Value : _IndTask_code,
            },
            {
                $Type : 'UI.DataField',
                Value : StartTime,
            },
            {
                $Type : 'UI.DataField',
                Value : EndTime,
            },
            {
                $Type : 'UI.DataField',
                Label : '_Status_code',
                Value : _Status_code,
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
            Value : Description,
        },
        {
            $Type : 'UI.DataField',
            Label : '_Plant_code',
            Value : _Plant_code,
        },
        {
            $Type : 'UI.DataField',
            Label : '_Location_code',
            Value : _Location_code,
        },
        {
            $Type : 'UI.DataField',
            Label : '_WorkType_code',
            Value : _WorkType_code,
        },
        {
            $Type : 'UI.DataField',
            Value : DirOrder,
        },
    ],
);

annotate service.Confirmations with {
    _User @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Users',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : _User_ID,
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

annotate service.Confirmations with {
    _WorkType @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'CnfWorkTypes',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : _WorkType_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.Confirmations with {
    DirTask @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Orders',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : DirTask,
                    ValueListProperty : 'Name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};


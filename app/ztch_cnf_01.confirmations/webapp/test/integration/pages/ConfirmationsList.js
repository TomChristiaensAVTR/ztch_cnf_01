sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'ztchcnf01.confirmations',
            componentId: 'ConfirmationsList',
            contextPath: '/Confirmations'
        },
        CustomPageDefinitions
    );
});
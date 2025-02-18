sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'ztchcnf01.confirmations',
            componentId: 'ConfirmationsObjectPage',
            contextPath: '/Confirmations'
        },
        CustomPageDefinitions
    );
});
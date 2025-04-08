sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ztchcnf01/conf01/test/integration/FirstJourney',
		'ztchcnf01/conf01/test/integration/pages/ConfirmationsList',
		'ztchcnf01/conf01/test/integration/pages/ConfirmationsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ConfirmationsList, ConfirmationsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ztchcnf01/conf01') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheConfirmationsList: ConfirmationsList,
					onTheConfirmationsObjectPage: ConfirmationsObjectPage
                }
            },
            opaJourney.run
        );
    }
);
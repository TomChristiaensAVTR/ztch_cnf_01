sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ztchcnf01/confirmations/test/integration/FirstJourney',
		'ztchcnf01/confirmations/test/integration/pages/ConfirmationsList',
		'ztchcnf01/confirmations/test/integration/pages/ConfirmationsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ConfirmationsList, ConfirmationsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ztchcnf01/confirmations') + '/index.html'
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
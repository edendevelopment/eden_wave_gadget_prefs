package co.uk.edendevelopment.edenWaveGadgetPrefs.wave
{
	import co.uk.edendevelopment.edenWaveGadgetPrefs.model.EdenWaveGadgetPrefsModelLocator;
	
	import mx.controls.Text;
	
	public class WaveCallbackHandlers
	{
		public function WaveCallbackHandlers()
		{
		}
		
		public static function handleWaveStateCallback(state:Object):void {
			var appModel:EdenWaveGadgetPrefsModelLocator = EdenWaveGadgetPrefsModelLocator.getInstance();
			
			if(appModel.appWave.getState().getStringValue("my_super_pref") != appModel.appRootView.myPrefsTextBox.text) {
				appModel.appRootView.myPrefsTextBox.text = appModel.appWave.getState().getStringValue("my_super_pref");
			}
			
			var textStuff:Text = new Text();
			textStuff.text = 'Current Viewer: '+appModel.appWave.getViewer().displayName;
			appModel.appRootView.historyVBox.addChild(textStuff);
			// mx.controls.Alert.show(mx.utils.ObjectUtil.toString(state));
			// mx.controls.Alert.show(mx.utils.ObjectUtil.toString(appModel.appWave.getState().getKeys()));
		}
		
		public static function handleWaveParticipantCallback(waveParticipants:Object):void {
			// mx.controls.Alert.show(mx.utils.ObjectUtil.toString(waveParticipants));
		}

	}
}
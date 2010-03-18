package co.uk.edendevelopment.edenWaveGadgetPrefs.wave
{
	import co.uk.edendevelopment.edenWaveGadgetPrefs.model.EdenWaveGadgetPrefsModelLocator;
	import co.uk.edendevelopment.jsonUtils.UnwrapJSON;
	
	import com.adobe.serialization.json.JSON;
	
	import mx.controls.Alert;
	import mx.utils.ObjectUtil;
	
	public class WaveCallbackHandlers
	{
		[Bindable]
		private var appMode:EdenWaveGadgetPrefsModelLocator = EdenWaveGadgetPrefsModelLocator.getInstance();
		
		public static function handleWaveStateCallback(state:Object):void {
			var appModel:EdenWaveGadgetPrefsModelLocator = EdenWaveGadgetPrefsModelLocator.getInstance();
			
			if(appModel.appWave.getState().getStringValue(EdenWaveGadgetPrefsModelLocator.WAVE_PREFERNCE_SETUP_VAR_NAME) != null) {
				var wavePrefWaveSetupVal:Array = UnwrapJSON.unwrapJSONObject(JSON.decode(appModel.appWave.getState().getStringValue(EdenWaveGadgetPrefsModelLocator.WAVE_PREFERNCE_SETUP_VAR_NAME))).returnObj;
				if(JSON.encode(wavePrefWaveSetupVal) != JSON.encode(appModel.prefWaveSetupDefAC.source)) {
					appModel.prefWaveSetupDefAC.removeAll();
					appModel.prefWaveSetupDefAC.source = wavePrefWaveSetupVal;
					appModel.appRootView.handlePrefWaveSetupDefACUpdate();
					// mx.controls.Alert.show(mx.utils.ObjectUtil.toString(wavePrefWaveSetupVal));
					// mx.controls.Alert.show(mx.utils.ObjectUtil.toString(appModel.prefWaveSetupDefAC.source));
				}
			}
			
			appModel.appRootView.handleWaveStateValueUpdates();

			// mx.controls.Alert.show(mx.utils.ObjectUtil.toString(state));
			// mx.controls.Alert.show(mx.utils.ObjectUtil.toString(appModel.appWave.getState().getKeys()));
			
			/* for(var x:int=0; x < appModel.appWave.getState().getKeys().length; x++) {
				var keyName:String = appModel.appWave.getState().getKeys()[x];
				mx.controls.Alert.show(keyName+': '+appModel.appWave.getState().getStringValue(keyName));
			} */
		}
		
		public static function handleWaveParticipantCallback(waveParticipants:Object):void {
			// mx.controls.Alert.show(mx.utils.ObjectUtil.toString(waveParticipants));
		}

	}
}
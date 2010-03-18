package co.uk.edendevelopment.edenWaveGadgetPrefs.model
{
	import co.uk.edendevelopment.edenWaveGadgetPrefs.view.MainView;
	
	import com.adobe.cairngorm.model.ModelLocator;
	import com.nextgenapp.wave.gadget.Wave;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	[Bindable]
	public class EdenWaveGadgetPrefsModelLocator implements ModelLocator
	{
		private static var instance:EdenWaveGadgetPrefsModelLocator = new EdenWaveGadgetPrefsModelLocator();
		
		// singleton pattern, use getInstance
		public function EdenWaveGadgetPrefsModelLocator() {
			if (instance) throw new Error("GenericModelLocator and can only be accessed through GenericModelLocator.getInstance()");
		}
		
		// returns the singleton instance of the model
		public static function getInstance():EdenWaveGadgetPrefsModelLocator {
       		return instance;
   		}
   		
   		/* standard application init vars */
   		public static const AppID:String = UIDUtil.createUID(); // creates a unique id for each instance of the application
   		
   		public var appRootView:MainView = null; // the core main view (needed for bubbled events)
   		
   		public var isDebugMode:Boolean = true;
   		
   		/* application specific variables */
   		public static const WAVE_PREFERNCE_SETUP_VAR_NAME:String = "pref_wave_setup_def";
   		
   		public var appWave:Wave;
   		public var currentWaveViewerID:String="";
   		public var currentWaveViewerDisplayName:String="";
   		
		public var prefWaveSetupDefAC:ArrayCollection = new ArrayCollection();
	}
}
package co.uk.edendevelopment.edenWaveGadgetPrefs.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	
	import mx.containers.Canvas;
	import mx.utils.UIDUtil;
	
	[Bindable]
	public class EdenWaveGadgetModelLocator implements ModelLocator
	{
		private static var instance:EdenWaveGadgetModelLocator = new EdenWaveGadgetModelLocator();
		
		// singleton pattern, use getInstance
		public function EdenWaveGadgetModelLocator() {
			if (instance) throw new Error("GenericModelLocator and can only be accessed through GenericModelLocator.getInstance()");
		}
		
		// returns the singleton instance of the model
		public static function getInstance():EdenWaveGadgetModelLocator {
       		return instance;
   		}
   		
   		/* standard application init vars */
   		public static const AppID:String = UIDUtil.createUID(); // creates a unique id for each instance of the application
   		
   		public var appRootView:Canvas = null; // the core main view (needed for bubbled events)
   		
   		/* application specific variables */

	}
}
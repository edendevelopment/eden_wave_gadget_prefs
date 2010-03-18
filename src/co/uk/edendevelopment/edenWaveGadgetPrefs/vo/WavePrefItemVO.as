package co.uk.edendevelopment.edenWaveGadgetPrefs.vo
{
	import co.uk.edendevelopment.edenWaveGadgetPrefs.model.EdenWaveGadgetPrefsModelLocator;
	import co.uk.edendevelopment.jsonUtils.UnwrapJSON;
	
	import com.adobe.serialization.json.JSON;
	
	[Bindable]
	public class WavePrefItemVO
	{
		public static const PREF_VAR_TYPE_BOOLEAN:String = "Boolean";
		public static const PREF_VAR_TYPE_INT:String = "Int";
		public static const PREF_VAR_TYPE_NUMBER:String = "Number";
		public static const PREF_VAR_TYPE_STRING:String = "String";
		public static const PREF_VAR_TYPE_GROUP_RADIO:String = "GroupRadio";
		public static const PREF_VAR_TYPE_GROUP_DROPDOWN:String = "GroupDropdown";
		
		public var prefVarName:String = "";
		public var prefVarDescription:String = "";
		public var prefVarType:String = WavePrefItemVO.PREF_VAR_TYPE_STRING;
		public var prefDefaultValue:* = null;
		public var prefGroupOptions:Array = new Array();
		
		private var appModel:EdenWaveGadgetPrefsModelLocator = EdenWaveGadgetPrefsModelLocator.getInstance();
		
		public function WavePrefItemVO() {
		}
		
		public static function unwrapJSON(jsonObj:Object):WavePrefItemVO {
			var returnVO:WavePrefItemVO = new WavePrefItemVO();
			
			returnVO.prefVarName = UnwrapJSON.unwrapJSONObject(jsonObj.prefVarName).returnObj;
			returnVO.prefVarDescription = UnwrapJSON.unwrapJSONObject(jsonObj.prefVarDescription).returnObj;
			returnVO.prefVarType = UnwrapJSON.unwrapJSONObject(jsonObj.prefVarType).returnObj;
			returnVO.prefDefaultValue = UnwrapJSON.unwrapJSONObject(jsonObj.prefDefaultValue).returnObj;
			returnVO.prefGroupOptions = UnwrapJSON.unwrapJSONObject(jsonObj.prefGroupOptions).returnObj;
			
			return returnVO;
		}
	}
}
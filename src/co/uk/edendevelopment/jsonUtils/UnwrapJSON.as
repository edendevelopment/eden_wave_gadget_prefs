package co.uk.edendevelopment.jsonUtils
{
	import co.uk.edendevelopment.jsonUtils.coreWrappers.*;
	import co.uk.edendevelopment.jsonUtils.vo.JSONUnwrapResultVO;
	
	import flash.utils.getDefinitionByName;
	
	public class UnwrapJSON
	{
		private var JSONUnwrapDateObj:JSONUnwrapDate;
		
		public static function unwrapJSONObject(jsonObj:Object):JSONUnwrapResultVO {
			var resultUnwrapVO:JSONUnwrapResultVO = new JSONUnwrapResultVO();
			resultUnwrapVO.isUnwrapped = false;
			resultUnwrapVO.returnObj = jsonObj;
			
			if(jsonObj == null) {
				return resultUnwrapVO;
			}
			
			if("ofASClassType" in jsonObj) {
				try {
					var objClass:Class = getDefinitionByName(jsonObj.ofASClassType) as Class;
					if ("unwrapJSON" in objClass) {
						resultUnwrapVO.returnObj = objClass["unwrapJSON"](jsonObj);
						resultUnwrapVO.isUnwrapped = true;
					} else {
						objClass = getDefinitionByName('co.uk.edendevelopment.jsonUtils.coreWrappers::JSONUnwrap'+jsonObj.ofASClassType) as Class;
						if ("unwrapJSON" in objClass) {
							resultUnwrapVO.returnObj = objClass["unwrapJSON"](jsonObj);
							resultUnwrapVO.isUnwrapped = true;
						}
					}
				} catch(err:Error) {
					// coun't find class name, returning object passed in as is
					trace("----UNWRAPJSON Error-------------------------------");
					trace("This error is most likely caused because the coreWrapper class you are referencing does not have an instance loaded, thus, autoload does not work.");
					trace(err.message);
					trace(err.getStackTrace());
					trace("---------------------------------------------------");
				}
			}
			
			// if not unwrapped and is an array or object, then recurse over elements and return
			
			// check if array
			if (!resultUnwrapVO.isUnwrapped && jsonObj is Array) {
				var returnArray:Array = new Array();
				for(var i:int=0; i < (jsonObj as Array).length; i++) {
					returnArray.push(UnwrapJSON.unwrapJSONObject((jsonObj as Array)[i]).returnObj);	
				}
				resultUnwrapVO.returnObj = returnArray;
				resultUnwrapVO.isUnwrapped = true;
			}
			
			// check if object
			if(!resultUnwrapVO.isUnwrapped) {
				var returnObj:Object = new Object();
				
				var areKeys:Boolean = false;
				for (var key:String in jsonObj) {
					areKeys = true;
					// assign value to a variable for quick lookup
					returnObj[key] = UnwrapJSON.unwrapJSONObject(jsonObj[key]).returnObj;
				}
				
				if(areKeys) {
					resultUnwrapVO.returnObj = returnObj;
					resultUnwrapVO.isUnwrapped = true;
				}
			}
			
			return resultUnwrapVO;
		}
	}
}
package co.uk.edendevelopment.jsonUtils.coreWrappers
{
	public class JSONUnwrapDate
	{
		public static function unwrapJSON(jsonObj:Object):Date {
			return new Date(jsonObj.fullYear,jsonObj.month,jsonObj.date,jsonObj.hours,jsonObj.minutes,jsonObj.seconds,jsonObj.milliseconds);
		}
		
	}
}
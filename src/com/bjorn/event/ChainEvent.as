package com.bjorn.event
{

	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class ChainEvent extends CairngormEvent {
		public function ChainEvent( type:String ) {
			super( type );
		}
	
		public var nextChainedEvent:ChainEvent;
	}

}
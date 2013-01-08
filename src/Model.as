package {
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	[Bindable]
	public class Model extends EventDispatcher {
		
		public function Model(target: IEventDispatcher = null) {
			super(target);
		}
		
		public var modes: Array = [
			new ModeVO("Lamour", []),
			new ModeVO("Spring", [])
		];
		
		public var currentMode: ModeVO;
	}
}
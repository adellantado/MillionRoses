package {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.controls.Alert;
	
	public class ConfigController extends EventDispatcher {
		
		public var loader: URLLoader = new URLLoader();
		
		public var songs: Array = [];
		
		public function ConfigController(target: IEventDispatcher = null) {
			super(target);
			init();
		}
		
		private function init(): void {
			loader.load(new URLRequest("config.xml"));
			addListeners();
		}
		
		private function addListeners(): void {
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.addEventListener(IOErrorEvent.NETWORK_ERROR, onIOError);
			loader.addEventListener(IOErrorEvent.VERIFY_ERROR, onIOError);
		}
		
		private function removeListeners(): void {
			loader.removeEventListener(Event.COMPLETE, onComplete);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.removeEventListener(IOErrorEvent.NETWORK_ERROR, onIOError);
			loader.removeEventListener(IOErrorEvent.VERIFY_ERROR, onIOError);
		}
		
		private function onComplete(event: Event): void {
			removeListeners();
			var xml: XML = XML(loader.data);
			for each (var item: XML in xml..track) {
				songs.push({id: item.@id, name: item.@name, path: item.@path});
			}
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		private function onIOError(event: IOErrorEvent): void {
			removeListeners();
			Alert.show("Sorry, error was occured. Try to reload page.", "Error");
		}
	}
}
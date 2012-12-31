package {
	
	public class ModeVO {

		public var name: String;
		
		public var flowers: Array = [];
		
		public var melody: *;
		
		public function ModeVO(name: String, flowers: Array) {
			this.name = name;
			this.flowers = flowers;
		}
	}
}
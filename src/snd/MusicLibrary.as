package snd {
	
	public class MusicLibrary implements IMusicLibrary {
		
		private var library: Array;
		
		private var position: int;
		
		private var current: Object;
		
		public function MusicLibrary(library: Array) {
			this.library = library;	
		}
		
		public function nextSong(): Object {
			/*position++;
			if (position > library.length-1) {
				position = 0;
			}
			return library[position];*/
			return current = randomSong;
		}
		
		public function currentSong(): Object {
			//return library[position];
			return current;
		}
		
		public function get randomSong(): Object {
			return library[Math.round((library.length - 1) * Math.random())];
		}
	}
}
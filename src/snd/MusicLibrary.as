package snd {
	
	public class MusicLibrary implements IMusicLibrary {
		
		private var library: Array;
		
		private var position: int;
		
		public function MusicLibrary(library: Array) {
			this.library = library;	
		}
		
		public function nextSong(): String {
			position++;
			if (position > library.length-1) {
				position = 0;
			}
			return library[position];
		}
		
		public function currentSong(): String {
			return library[position];
		}
	}
}
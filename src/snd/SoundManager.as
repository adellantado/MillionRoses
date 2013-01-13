package snd {
	import flash.events.Event;
	import flash.media.ID3Info;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	
	public class SoundManager {
		
		private var sound: Sound;
		private var channel: SoundChannel;
		private var transform: SoundTransform = new SoundTransform(0.5);
		
		private var pauseTime: Number = 0;
		
		private var musicLibrary: IMusicLibrary;
		
		public function SoundManager(musicLibrary: IMusicLibrary) {
			this.musicLibrary = musicLibrary;
			start();
		}
		
		public function start(): void {
			sound = new Sound(new URLRequest(musicLibrary.nextSong().path));
			sound.addEventListener(Event.COMPLETE, onComplete);
			sound.addEventListener(Event.ID3, onID3Available);
		}
		
		public function onComplete(event: Event): void {
			sound.removeEventListener(Event.COMPLETE, onComplete);
			play();
		}
		
		public function play(): void {
			channel = sound.play(pauseTime, 0, transform);
			channel.addEventListener(Event.SOUND_COMPLETE, onSoundComplete);
		}
		
		public function pause(): void {
			pauseTime = channel.position;
			stop();
		}
		
		public function stop(): void {
			channel.stop();
			channel.removeEventListener(Event.SOUND_COMPLETE, onSoundComplete);
		}
		
		[Bindable]
		public function get volume(): Number {
			return transform.volume;
		}
		
		public function set volume(value: Number): void {
			transform.volume = value;
			channel.soundTransform = transform;
		}
		
		private function onSoundComplete(event: Event): void {
			//channel = null;
			pauseTime = 0;
			start();
		}
		
		private function onID3Available(event: Event): void {
			sound.removeEventListener(Event.ID3, onID3Available);
			var id3: ID3Info = event.target.id3;
			trace("Received ID3 Info:");
			for (var propName: String in id3) {
				trace(propName + " = " + id3[propName]);
			}
		}
		
	}
}
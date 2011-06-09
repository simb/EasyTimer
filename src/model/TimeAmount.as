package model
{
	public class TimeAmount extends Object
	{
		private var _hours:Number;
		private var _minutes:Number;
		private var _seconds:Number;
		private var _totalseconds:Number;
		private var _trackseconds:Number;
		
		public function TimeAmount(hours:Number=0, minutes:Number=0, seconds:Number=0 )
		{
			super();
			_hours = hours;
			_minutes = minutes;
			_seconds = seconds;
			reset();
		}
		
		public function reset():void
		{
			_totalseconds = _trackseconds = seconds + (minutes*60) + (hours*60*60);
		}
		
		public function increment():void
		{
			_trackseconds = _trackseconds + 1;
		}
		
		public function decrement():void
		{
			_trackseconds = _trackseconds - 1;
		}
		
		private function leadingZero(num:int):String 
		{
			if ( num > 9 ) {
				return num.toString();
			} else {
				return '0' + num;
			}
		}
		
		public function get FormattedTime():String{
			var i:Number = _trackseconds;
			if ( i < 60 ){
				return "00:00:" + leadingZero(i%60);
			}else if ( i < 60*60 ){
				return "00:" + leadingZero(i/60) + ":" + leadingZero(i%60);
			}else if ( i < 100*60*60 ){
				return leadingZero(i/(60*60)) + ":" + leadingZero((i/60)%60) + ":" + leadingZero(i%60);
			}
			return "99:59:59";
		}
		
		public function get hours():Number {
			return _hours;
		}
		
		public function get minutes():Number {
			return _minutes;
		}
		
		public function get seconds():Number {
			return _seconds;
		}
		
		public function get secondsleft():Object {
			return _trackseconds;
		}
		
		public function get totalseconds():Number {
			return _totalseconds;
		}
		
	}
}
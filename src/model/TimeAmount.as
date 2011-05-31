package model
{
	public class TimeAmount extends Object
	{
		private var _hours:Number;
		private var _minutes:Number;
		private var _seconds:Number;
		private var _totalseconds:Number;
		private var _timeleft:Object;
		
		public function TimeAmount(hours:Number=0, minutes:Number=0, seconds:Number=0 )
		{
			super();
			_hours = hours;
			_minutes = minutes;
			_seconds = seconds;
			_totalseconds = seconds + (minutes*60) + (hours*60*60);
			reset();
		}
		
		public function reset():void
		{
			_timeleft = {
				hours: _hours,
				minutes: _minutes,
				seconds: _seconds,
				secondsleft: _totalseconds
			};
		}
		
		public function decrement():void
		{
			if ( _timeleft.secondsleft == 0 ) {
				/* We're done */
				//return;
			}
			_timeleft.secondsleft = _timeleft.secondsleft - 1;
			if ( _timeleft.seconds == 0 ) {
				_timeleft.seconds = 59;
				if ( _timeleft.minutes == 0 ) {
					_timeleft.minutes = 59;
					_timeleft.hours = _timeleft.hours - 1;
				} else {
					_timeleft.minutes = _timeleft.minutes - 1;
				}
			} else {
				_timeleft.seconds = _timeleft.seconds - 1
			}
		}
		
		[Bindable]
		public function get hours():Number {
			return _hours;
		}
		public function set hours(hours:Number):void {
			_hours = hours;
		}
		
		[Bindable]
		public function get minutes():Number {
			return _minutes;
		}
		public function set minutes(minutes:Number):void {
			_minutes = minutes;
		}
		
		[Bindable]
		public function get seconds():Number {
			return _seconds;
		}
		public function set seconds(seconds:Number):void {
			_seconds = seconds;
		}
		
		public function get totalseconds():Number {
			return _totalseconds;
		}
		public function get timeleft():Object {
			return _timeleft;
		}
		
	}
}
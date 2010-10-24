//------------------------------------------------------------------------------
//
//Copyright (c) 2010 Justin Mclean Class Software (justin@classsoftware.com) 
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy 
// of this software and associated documentation files (the "Software"), to deal 
// in the Software without restriction, including without limitation the rights 
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
// copies of the Software, and to permit persons to whom the Software is 
// furnished to do so, subject to the following conditions: 
// 
// The above copyright notice and this permission notice shall be included in 
// all copies or substantial portions of the Software. 
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
// THE SOFTWARE. 
//
//------------------------------------------------------------------------------

package com.classsoftware.binary
{
	/**
	 * Represents a single bit. Use the static constants when creating bits rather than creating them via the constructor.
	 * Like so:
	 * <listing>
	 *  	var bit:Bit = Bit.ONE; 
	 * </listing>
	 * 
	 * @author Justin Mclean
	 */
	public class Bit
	{
		
		/**
		 * Same as ZERO. Bit with a value of '0'.
		 */			
		public static const FALSE:Bit = Bit.ZERO;
		
		/**
		 * Bit with a value of '1'.
		 */
		public static const ONE:Bit = new Bit(true);
		
		/**
		 * Same as ONE. Bit with a value of '1'.
		 */		
		public static const TRUE:Bit = Bit.ONE;
		
		/**
		 * Bit with a value of '0'.
		 */
		public static const ZERO:Bit = new Bit(false);

		private static var _created:Boolean = false;

		/*
		 * Static code block this is executed before the constructor but after any static properties have been created.
		 * We can use this to make a constructor that throws an error at runtime if it is called.
		 */
		{
			_created = true;
		}
		
		/**
		 * Creates a bit. Use static constants ONE, ZERO, TRUE or FALSE when creating bits instead of this constructor.
		 * Uses a a static code block and a boolean check to emulate a private constructor. In AcrionScript all constructors are public.
		 * @param value value (true or false) to set bit to.
		 * @default false
		 */
		public function Bit(value:Boolean = false)
		{
			init(value);
		}
		
		// Check if an instance has been created and if so throw an error otherwise set the value to 0 or 1
		private function init(value:Boolean):void {
			if (_created) {
				throw new Error('Plese use static constants Bit.ZERO, Bit.ONE, Bit.TRUE or Bit.FALSE');
			}
			_value = value;
		}
		
		private var _value:Boolean = false; // TODO check if boolean or int is faster

		/**
		 * Converts a Bit to a Boolean.
		 * @return true or false depending on value of bit
		 */
		public function toBoolean():Boolean {
			return _value;
		}
		
		/**
		 * Converts a Bit to an int.
		 * @return 0 or 1 depending on value of bit
		 */
		public function toInt():int {
			return int(_value);
		}
		
		/**
		 * Converts a Bit to a String.
		 * @return "0" or "1" depending on value of bit
		 */
		public function toString():String {
			return int(_value).toString();
		}
	}
}
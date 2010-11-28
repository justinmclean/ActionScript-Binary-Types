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

package com.classsoftware.binary {
	/**
	 * Implements a Binary type used by the Byte and Word classes to manipulate Bits.
	 * @author Justin Mclean
	 * @see Word
	 * @see Byte
	 */
	public class Binary implements IBinary {
		
		private static const MAXBITS:Number = 32;
		private var _maxValue:uint = 0; // int dosn't support 32 bit positive numbers
		private var _noBits:int = 0;
		private var _value:uint = 0;
		
		/**
		 * Creates a Binary type and optionally sets it value.
		 * @param value Value to set Binary value to.
		 */
		public function Binary(noBits:int = 0, value:int = 0) {
			checkMaxBits(noBits);
			_noBits = noBits;
			_maxValue = (1 << _noBits) - 1; // works for bit lengths up to 31
			if (_noBits == 32) {
				_maxValue = uint(-1); // for overflow when bit length is 32
			}
			this.value = value; // just in case value is over maximum
		}

		private function checkMaxBits(noBits:int):void
		{
			if (noBits > MAXBITS) {
				throw('Class only supports bit lengths up to ' + MAXBITS.toString() +' bits');
			}
		}
		
		/**
		 * Clears a bit in a Binary type.
		 * @param bit The bit to clear.
		 */
		public function clearBit(bit:int):void {
			_value &= ~(1 << bit);			
		}

		/**
		 * Returns a bit from a Binary type.
		 * @param bit The bit to return.
		 * @return Bit.ONE if bit is set and Bit.ZERO is bit is not set.
		 */
		public function getBit(bit:int):Bit {
			var result:Bit;
			var mask:uint = 1 << bit;
			
			if (_value & mask) {
				result = Bit.ONE;
			} else {
				result = Bit.ZERO;
			}
			
			return result;
		}

		/**
		 * Returns if a bit is set in a Binary type.
		 * @param bit to test if set.
		 * @return True is bit is set, false if bit is not set.
		 */
		public function isBitSet(bit:int):Boolean {
			var result:Boolean;
			var mask:uint = 1 << bit;
			
			if (_value & mask) {
				result = true;
			} else {
				result = false;
			}
			
			return result;
		}

		/**
		 * The maximum value of a Binary type.
		 * @return The maximum value.
		 */
		public function get maxValue():uint
		{
			return _maxValue;
		}

		/**
		 * The number of bits in a Binary type.
		 * @return The number of bits.
		 */
		public function get noBits():int
		{
			return _noBits;
		}

		/**
		 * Sets a bit in a Binary type.
		 * @param bit Bit to set.
		 */
		public function setBit(bit:int):void {
			if (bit > _noBits) {
				return;
			}
			
			var mask:uint = 1 << bit;
			
			_value |= mask;
		}

		/**
		 * Converts a twos compliment number to a decimal number.
		 * @param bits No of bits in the number.
		 * @default bits 8
		 * @return A positive or negative number.
		 */
		public function toDec(bits:int = -1):int {
			if (bits == -1) {
				bits = _noBits;
			}
			
			var neg:uint = 1 << (bits - 1);
			var dec:int = 0;

			if (_value >= neg) {
				dec = ~_value & (neg - 1);
				dec = -(dec + 1);
			} else {
				dec = _value;
			}

			return dec;
		}

		/**
		 * Return the value of a Binary type.
		 * @return Value of the Binary type.
		 */
		public function get value():uint {
			return _value;
		}

		/**
		 * Sets the value of a Binary type.
		 * @param value Value to set the Binary type to.
		 */
		public function set value(value:uint):void {
			_value = value & maxValue;
		}
		
		/**
		 * Decrements the value of a Binary type by one.
		 * @return The instance of the modified binary type.
		 */
		public function dec():* {
			value = _value - 1;		
			return this;
		}
		
		/**
		 * Increments the value of a Binary type by one.
		 * @return The instance of the modified binary type.
		 */
		public function inc():* {
			value = _value + 1;			
			return this;
		}	
		
		/**
		 * Converts a Binary type to a String.
		 * @return A digit hexadecimal number padded with zeros (if needed).
		 */		
		public function toString():String {
			var textmem:String = value.toString(16);
			
			while (textmem.length < _noBits/4) {
				textmem = '0' + textmem;
			}
			
			return textmem;
		}	
	}
}
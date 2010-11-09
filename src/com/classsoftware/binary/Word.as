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
	 * Implements a Word type (2 bytes/16 bits) with values in the range of 0 to 0xFFFF.
	 * <listing>
	 *  	var word:Word = new Word(0xFFFF); 
	 * </listing>
	 * @author Justin Mclean
	 */
	public class Word extends Binary {
		
		 /**
		  * Creates a Word and optionally sets it value.
		  * @param value Value to set Word to (0 - 0xFFFF).
		  */
		public function Word(value:int = 0) {
			super(16, value);
		}
		
		/**
		 * Returns the high Byte from a Word.
		 * @return The high Byte.
		 */
		public function highByte():Byte {
			return new Byte(value >> 8);
		}
		
		/**
		 * Returns The low Byte of a Word.
		 * @return The low byte.
		 */
		public function lowByte():Byte {
			return new Byte(value);
		}
		
		/**
		 * Converts a Word to a String.
		 * @return A 4 digit hexadecimal number padded with zeros (if needed) and prefixed by 0x.
		 */
		override public function toString():String {
			return '0x' + super.toString();
		}
	}
}
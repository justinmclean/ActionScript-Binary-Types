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
	 * Implements a Byte type (8 bit) with values in the range of 0 to 0xFF.
	 * <listing>
	 *  	var byte:Byte = new Byte(0xFF); 
	 * </listing>
	 * @author Justin Mclean
	 */
	public class Byte extends Binary {
		/**
		 * Creates a Byte and optionally sets it value.
		 * @param value Value to set Byte to (0 - 0xFF).
		 */
		public function Byte(value:int = 0) {
			super(8, value);
		}
		
		/**
		 * Decrements the value of a Byte by one.
		 * Pubic type safe version of parent class decInternal.
		 * @return The new value.
		 */
		public function dec():Byte {
			return decInternal() as Byte;
		}
		
		/**
		 * Increments the value of a Byte by one.
		 * Pubic type safe version of parent class decInternal.
		 * @return The new value.
		 */
		public function inc():Byte {
			return incInternal() as Byte;
		}
	}
}
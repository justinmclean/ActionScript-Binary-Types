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
	 * Binary type interface.
	 * Use when a variable can have different binary types (eg a Byte or Word).
	 * <listing>
	 * var timer:IBinary;
	 * 
	 * if (largeTimer)
	 * 	timer = new Word();
	 * else
	 * 	timer = new Byte();
	 * 
	 * // later in the code
	 * timer.inc();
	 * 
	 * </listing>
	 * @author Justin Mclean
	 * @see Binary
	 */
	public interface IBinary
	{
		function clearBit(bit:int):void;
		function getBit(bit:int):Bit;
		function isBitSet(bit:int):Boolean;
		function get maxValue():int;
		function get noBits():int;
		function setBit(bit:int):void;
		function toDec(bits:int = -1):int;
		function toString():String;
		function get value():int;
		function set value(value:int):void;
	}
}
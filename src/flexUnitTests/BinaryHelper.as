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

package flexUnitTests
{
	import com.classsoftware.binary.Binary;
	import com.classsoftware.binary.IBinary;
	
	import flexunit.framework.Assert;
	
	public class BinaryHelper
	{
		public function BinaryHelper()
		{
		}

		public function testBits(nobits:int):void {
			var binary:Binary = new Binary(nobits,0);
			
			// tests on no bits and max value
			Assert.assertEquals(binary.noBits, nobits);
			Assert.assertEquals(binary.maxValue, (1 << nobits) - 1);
			
			// test all zero
			getBits(binary,allZero);
			isBitSet(binary,allZero);
			
			// text all one
			binary = new Binary(nobits,binary.maxValue);
			getBits(binary,allOne);
			isBitSet(binary,allOne);			
			
			// test one bit at a time
			for (var i:int = 0; i < binary.noBits; i++) {
				binary = new Binary(nobits,1 << i);
				getBits(binary,oneOne(i));
				isBitSet(binary,oneOne(i));			
			}
			
			// test clearing bits on zero binary
			binary = new Binary(nobits,0);
			for (i = 0; i < binary.noBits; i++) {
				binary.clearBit(i);
				Assert.assertEquals(binary.value, 0);
			}
			
			// test setting bits on zero binary
			for (i = 0; i < binary.noBits; i++) {
				binary = new Binary(nobits,0);
				binary.setBit(i);
				Assert.assertEquals(binary.value, 1 << i);
			}
			
			// test setting bits one after the other
			binary = new Binary(nobits,0);
			for (i = 0; i < binary.noBits; i++) {		
				binary.setBit(i);
				Assert.assertEquals(binary.value, binary.maxValue >> (binary.noBits-i-1));
			}				
		}
		
		protected function get allOne():Array {
			return [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
		}
		
		
		protected function get allZero():Array {
			return [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		}
		
		protected function getBits(byte:IBinary, bits:Array):void
		{
			for (var i:int = 0; i < byte.noBits; i++) {
				Assert.assertEquals(byte.getBit(i), bits[i]);
			}
		}
		
		protected function isBitSet(byte:IBinary, bits:Array):void
		{
			for (var i:int = 0; i < byte.noBits; i++) {
				Assert.assertEquals(byte.isBitSet(i), bits[i]);
			}
		}
		
		protected function oneOne(index:int):Array {
			var one:Array = allZero.slice();
			one[index] = 1;
			return one;
		}
	}
}
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
	import com.classsoftware.binary.Bit;
	
	import flexunit.framework.Assert;
	
	public class BinaryTest extends BinaryHelper
	{	
		[Test]
		public function zeroLength():void {
			testBits(0);
		}
		
		[Test]
		public function smallBitLength():void {
			testBits(2);
			binarys(2);
			testBits(3);
			binarys(3);
			testBits(4);
			binarys(4);
		}
		
		[Test]
		public function mediumBitLength():void {			
			testBits(7);
			binarys(7);
			testBits(8);
			binarys(8);
		}	
			
		[Test]
		public function largeBitLength():void {			
			testBits(16);
			binarys(16);
			testBits(32); // largest currently supported
			binarys(32);
		}


		public function binarys(noBits:int):void {
			var binary:Binary = new Binary(noBits);
			
			// test initial values is 0
			Assert.assertEquals(binary.value, 0);
			Assert.assertEquals(binary.toDec(), 0);
			var zero:String = '0';
			for  (var i:int = 0; i < noBits/4-1; i++) {
				zero += '0';
			}
			Assert.assertEquals(binary.toString(), zero);
			
			// test 1/2 point
			var mid:int = binary.maxValue/2;
			binary.value = mid;
			Assert.assertEquals(binary.value, mid);		
			Assert.assertEquals(binary.toDec(), mid);
			Assert.assertEquals(binary.toString(), mid.toString(16));			
			
			// test max value
			binary.value = binary.maxValue;
			Assert.assertEquals(binary.value, binary.maxValue);	
			Assert.assertEquals(binary.toDec(), -1); // two's complement
			Assert.assertEquals(binary.toString(), binary.maxValue.toString(16));			
			
			// test zero
			binary.value = 0;
			Assert.assertEquals(binary.value, 0);	
			
			// test max value + 1
			binary.value = binary.maxValue+1;
			Assert.assertEquals(binary.value, 0);	
			
			// test -1
			binary.value = uint(-1);
			Assert.assertEquals(binary.value, binary.maxValue);	// two's complement
			Assert.assertEquals(binary.toDec(), -1); // two's complement
			Assert.assertEquals(binary.toString(), binary.maxValue.toString(16));				
		}
	}
}
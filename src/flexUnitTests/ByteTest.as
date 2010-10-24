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
	import com.classsoftware.binary.Bit;
	import com.classsoftware.binary.Byte;
	
	import flexunit.framework.Assert;
	public class ByteTest extends BinaryHelper
	{	
		[Test]
		public function bytes():void {
			var byte:Byte = new Byte(0);
			Assert.assertEquals(byte.value, 0);
			byte = new Byte(0x80);
			Assert.assertEquals(byte.value, 0x80);			
			byte = new Byte(0xFF);
			Assert.assertEquals(byte.value, 0xFF);	
			byte = new Byte(0xFFFF);
			Assert.assertEquals(byte.value, 0xFF);				
		}
		
		[Test]
		public function incdec():void {
			var byte:Byte = new Byte(0);
			byte.inc();
			Assert.assertEquals(byte.value, 0x01);	
			byte.dec();
			Assert.assertEquals(byte.value, 0x00);	
		}
	}
}
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
	import com.classsoftware.binary.Nibble;
	
	import flexunit.framework.Assert;
	public class NibbleTest extends BinaryHelper
	{	
		[Test]
		public function nibbles():void {
			var nibble:Nibble = new Nibble(0);
			Assert.assertEquals(nibble.value, 0);
			nibble = new Nibble(0x8);
			Assert.assertEquals(nibble.value, 0x8);			
			nibble = new Nibble(0xF);
			Assert.assertEquals(nibble.value, 0xF);	
			nibble = new Nibble(0xFF);
			Assert.assertEquals(nibble.value, 0xF);				
		}
		
		[Test]
		public function incdec():void {
			var nibble:Nibble = new Nibble(0);
			nibble.inc();
			Assert.assertEquals(nibble.value, 0x01);	
			nibble.dec();
			Assert.assertEquals(nibble.value, 0x00);	
		}
	}
}
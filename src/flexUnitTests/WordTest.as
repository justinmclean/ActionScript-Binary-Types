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
	import com.classsoftware.binary.Word;
	
	import flexunit.framework.Assert;
	
	public class WordTest extends BinaryHelper
	{	
		[Test]
		public function words():void {
			var word:Word = new Word(0);
			Assert.assertEquals(word.value, 0);
			word = new Word(0x80);
			Assert.assertEquals(word.value, 0x80);			
			word = new Word(0xFF);
			Assert.assertEquals(word.value, 0xFF);	
			word = new Word(0xFFFF);
			Assert.assertEquals(word.value, 0xFFFF);
			word = new Word(0xFFFFFF);
			Assert.assertEquals(word.value, 0xFFFF);			
		}
		
		[Test]
		public function incdec():void {
			var word:Word = new Word(0);
			word.inc();
			Assert.assertEquals(word.value, 0x01);	
			word.dec();
			Assert.assertEquals(word.value, 0x00);	
		}	
		
		[Test]
		public function highLowBytes():void {
			var word:Word = new Word(0x00FF);
			Assert.assertEquals(word.lowByte().value, new Byte(0xFF).value);
			Assert.assertEquals(word.highByte().value, new Byte(0x00).value);
			
			word = new Word(0xFF00);
			Assert.assertEquals(word.lowByte().value, new Byte(0x00).value);
			Assert.assertEquals(word.highByte().value, new Byte(0xFF).value);	
			
			word = new Word(0x1234);
			Assert.assertEquals(word.lowByte().value, new Byte(0x34).value);
			Assert.assertEquals(word.highByte().value, new Byte(0x12).value);				
		}

		
		[Test]
		public function toString():void {
			var word:Word = new Word();
			Assert.assertEquals(word.toString(), "0x0000");
			
			word = new Word(0xFF);
			Assert.assertEquals(word.toString(), "0x00ff");			
			
			word = new Word(0x1234);
			Assert.assertEquals(word.toString(), "0x1234");
		}
	}
	
	
}
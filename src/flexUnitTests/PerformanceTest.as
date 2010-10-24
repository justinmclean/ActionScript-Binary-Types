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
	import com.classsoftware.binary.Byte;
	
	import flash.utils.getTimer;
	
	import flexunit.framework.Assert;
		
	public class PerformanceTest
	{	
		// Higher for fast machine, lower for slow ones
		private static const SPEEDFACTOR:int = 25;
		
		[Test]
		public function create():void {
			var noRuns:int = SPEEDFACTOR * 10000;
			var start:int = getTimer();
			for (var i:int = 0; i < noRuns; i++) {
				var byte:Byte = new Byte(0);
			}
			var end:int = getTimer();
			var perSec:Number = noRuns/((end-start)/1000);
			Assert.assertEquals("Create Bytes > " + noRuns.toString() + " /sec", perSec > noRuns, true);	
		}	
		
		[Test]
		public function setBit():void {
			var byte:Byte = new Byte(0);
			var noRuns:int = SPEEDFACTOR * 20000;
			var start:int = getTimer();
			for (var i:int = 0; i < noRuns; i++) {
				byte.setBit(1);
			}
			var end:int = getTimer();
			var perSec:Number = noRuns/((end-start)/1000);
			Assert.assertEquals("Set bit > " + noRuns.toString() + " /sec", perSec > noRuns, true);	
		}
		
		[Test]
		public function clearBit():void {
			var byte:Byte = new Byte(0);
			var noRuns:int = SPEEDFACTOR * 20000;
			var start:int = getTimer();
			for (var i:int = 0; i < noRuns; i++) {
				byte.clearBit(1);
			}
			var end:int = getTimer();
			var perSec:Number = noRuns/((end-start)/1000);
			Assert.assertEquals("Clear bit > " + noRuns.toString() + " /sec", perSec > noRuns, true);	
		}
		
		[Test]
		public function setByte():void {
			var byte:Byte = new Byte(0);
			var noRuns:int = SPEEDFACTOR * 40000;
			var start:int = getTimer();
			for (var i:int = 0; i < noRuns; i++) {
				byte.value = 0x80;
			}
			var end:int = getTimer();
			var perSec:Number = noRuns/((end-start)/1000);
			Assert.assertEquals("Clear bit > " + noRuns.toString() + " /sec", perSec > noRuns, true);	
		}			
		
		[Test]
		public function getByte():void {
			var byte:Byte = new Byte(0);
			var noRuns:int = SPEEDFACTOR * 80000;
			var start:int = getTimer();
			for (var i:int = 0; i < noRuns; i++) {
				var value:int = byte.value;
			}
			var end:int = getTimer();
			var perSec:Number = noRuns/((end-start)/1000);
			Assert.assertEquals("Get bit > " + noRuns.toString() + " /sec", perSec > noRuns, true);	
		}
		
		[Test]
		public function inc():void {
			var byte:Byte = new Byte(0);
			var noRuns:int = SPEEDFACTOR * 20000;
			var start:int = getTimer();
			for (var i:int = 0; i < noRuns; i++) {
				byte.inc();
			}
			var end:int = getTimer();
			var perSec:Number = noRuns/((end-start)/1000);
			Assert.assertEquals("Inc bit > " + noRuns.toString() + " /sec", perSec > noRuns, true);	
		}	
		
		[Test]
		public function dec():void {
			var byte:Byte = new Byte(0);
			var noRuns:int = SPEEDFACTOR * 20000;
			var start:int = getTimer();
			for (var i:int = 0; i < noRuns; i++) {
				byte.inc();
			}
			var end:int = getTimer();
			var perSec:Number = noRuns/((end-start)/1000);
			Assert.assertEquals("Inc bit > " + noRuns.toString() + " /sec", perSec > noRuns, true);	
		}	
		
		
		[Test]
		public function toString():void {
			var byte:Byte = new Byte(0x80);
			var noRuns:int = SPEEDFACTOR * 10000;
			var start:int = getTimer();
			for (var i:int = 0; i < noRuns; i++) {
				var value:String = byte.toString();
			}
			var end:int = getTimer();
			var perSec:Number = noRuns/((end-start)/1000);
			Assert.assertEquals("Inc bit > " + noRuns.toString() + " /sec", perSec > noRuns, true);	
		}			
	}
}
/**
@@Date:				Jan 16, 2009
@@Author			Steve Griffith
@@Description		The library has a movieclip called Letter and a Font called V
					Listen for keyboard events and as the user types on the keyboard
					randomly create copies of the letters using the font from the library
					and add them to the stage
**/

package{
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.Font;
	
	public class Keyboarding extends MovieClip{
		
		public var tf:TextFormat = new TextFormat();
		Font.registerFont(VFont);		//the class name of the font in the library
		
		public function Keyboarding(){
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, addLetters);			
			tf.font = 'Verdana';
			tf.size = 36;
			tf.color = 0x0033CC;
		}
		
		
		private function addLetters(e:KeyboardEvent):void{
			//user just pressed a key
			//trace(e.keyCode);	//number from the key pressed
			//trace( e.charCode);   //number from the character set of the key pressed
			//e.ctrlKey
			//e.shiftKey
			//e.altKey
			//trace( String.fromCharCode(e.charCode) );
			var L:MovieClip = new MovieClip();
			var t:TextField = new TextField();
			t.embedFonts = true;
			//t.defaultTextFormat = tf;	//should be used before adding text
			t.text = String.fromCharCode(e.charCode);
			t.setTextFormat(tf);	//must occur after adding text
			L.addChild(t);
			
			L.x = Math.random() * this.stage.stageWidth;
			L.y = Math.random() * this.stage.stageHeight;
			L.scaleX = L.scaleY = Math.random();
			L.rotation = Math.random() * 180;	//only works if we use the library font
			
			L.addEventListener(Event.ENTER_FRAME, spinner);
			this.stage.addChild(L);
		}
		
		private function spinner(e:Event):void{
			//spin the letter off the screen
			e.target.rotation += 5;
			e.target.scaleX = e.target.scaleY += .05;
			e.target.alpha -= 0.01;
			if(e.target.alpha <= 0){
				e.target.removeEventListener(Event.ENTER_FRAME, spinner);
				this.stage.removeChild( MovieClip(e.target) );
			}
		}
		
	}
}
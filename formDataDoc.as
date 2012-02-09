package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;		//format for the data coming back from the server
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;			//method for sending data to the server
	import flash.net.URLVariables;				//this will hold the data being sent to the server
	
	public class formDataDoc extends MovieClip {
		
		private var req:URLRequest;
		private var loader:URLLoader;
		private var page:String = "data.php";	//the php page that will handle the response
		private var dataFormat:String = URLLoaderDataFormat.VARIABLES; // or .BINARY  or .TEXT
		
		public function formDataDoc() {
trace("In formDataDoc: ");
			// constructor code
			//form_mc.fullName_txt is the field into which the user types
			//form_mc.send_mc is the button to click to send the data
			//form_mc.feedback_txt is the field which will hold the response from the server
			form_mc.send_mc.addEventListener(MouseEvent.MOUSE_DOWN, mDown);
			form_mc.send_mc.addEventListener(MouseEvent.MOUSE_UP, mUp);
			form_mc.send_mc.addEventListener(MouseEvent.CLICK, sendData);

			form_mc.fullName_txt.text = "";
			
			req = new URLRequest( page );
			req.method = URLRequestMethod.POST;		// or just "POST"
			 
			loader = new URLLoader();
			loader.dataFormat = dataFormat;
			loader.addEventListener(Event.COMPLETE, handleResponse);
		}
		
		public function mDown(ev:MouseEvent):void{
trace("In mDown: ");
			//visual effect
		}
		
		public function mUp(ev:MouseEvent):void{
trace("In mUp: ");
			//visual effect
		}
		
		public function sendData(ev:MouseEvent):void{
trace("In sendData: ");
			//gather the data from the "form" as save as a URLRequest params before sending them to the server
			var vars:URLVariables = new URLVariables();
			vars.fullname = form_mc.fullName_txt.text;
			req.data = vars;
			if (form_mc.fullName_txt.text == null || vars.fullname.length > 0) {
				loader.load(req);
			} else {
				trace("vars.fullname: ", vars.fullname);
				form_mc.feedback_txt.text = "You need to type something first!";
				//send the request to the server by requesting the page with the URLLoader
			}
		}
		
		public function handleResponse(ev:Event):void{
trace("In handleResponse: ");
			//the xml data is back from the web server
			var vars:URLVariables = new URLVariables(ev.target.data);
			trace(ev.type, ev.target)
			//	var data:xml = xml(ev.target.data);
			//	var data:json = JSON(ev.target.data);
			//write the message into the feedback field
//			form_mc.feedback_txt.text = "I'm Here...!";
			form_mc.feedback_txt.text = vars.message;
		}
	}
	
}

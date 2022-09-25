// ==UserScript==
// // @name          ParaSite
// // @namespace     http://blogs.applibase.net/pramod/code
// // @description 	 General purpose angular-web app extender
// // @exclude       
// // ==/UserScript==


console.log( "Greasemonkey script loading..." )

$ ? console.log( "Found JQuery" ) : console.log( "JQuery not found!" ) 
angular ? console.log( "Found angular" ) : console.log( "Angular not found!" )


console.log( "Checking if debugInfo is enabled..." )

// if ( !window.debug_enabled )
// {
// 	console.log( "Reloading with debug info..." )
// 	angular.reloadWithDebugInfo();
// 	console.log( "Reloaded" );
// }
// else
// {
// 	console.log( "ng-scope enabled" )
// }


window.gm  = GM

window.handle_alert = function( event )
{
	
	console.log( event )

	if ( event.key == 'M' )
	{
		if ( event.altKey == true )
		{
			console.log( "Alt Shift M" )
			try
			{
			mic_button = angular.element($("#microphone-button"))
			sc = mic_button.scope()
			console.log(sc)
			console.log(sc.handler)
			sc.handler.executeAction(event)
			}
			catch (err)
			{
			}


			req =  {
				method: "GET",

				url: "http://192.168.1.37:8080",
				onload: 
				function( response ) 
				{
					alert( response.reponseText )
				}
			}

			GM.xmlHttpRequest( req )
			console.log("Sent request")
		}
		else
		{
			console.log( "Some other m" )
		}
	}
	else
	{
		console.log( "m wa nai" )
	}
}

document.addEventListener( "keypress", window.handle_alert, true );

console.log( "Greasemonkey script loaded" )

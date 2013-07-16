DeviceAtlas APIs with client side properties


***** INTRO *****
The DeviceAtlas APIs can work in conjunction with a JavaScript property 
detection file and merge the resulting properties for use on the server side. 
The client properties are also available to other JavaScript libraries. The 
DeviceAtlas client detection file needs to be included on your web page for this 
to function.


***** CLIENT SIDE ACCESS TO PROPERTIES *****
The properties gathered from the DeviceAtlas JavaScript detection are available
to other JavaScript functions and can be accessed on the client side by using 
the "DeviceAtlas" namespace.

EXAMPLE:
--------------------------------------------

// Does the browser support Web GL ?
var supportsWebGl = DeviceAtlas.js.webGl;

--------------------------------------------

The normal DeviceAtlas property name should be used to access the client side
property.


***** SERVER SIDE ACCESS TO PROPERTIES *****
The JavaScript  detection file creates a special cookie with the detected client 
properties.

When using DeviceAtlas Enterprise APIs:
  To access the client side properties on the server the contents of this cookie
  need to be passed to the API's getProperty and getProperties () methods. 

When using DeviceAtlas Cloud APIs:
  If using this cookie is allowed in the settings, the API will use the cookie
  if it exists.

The client side properties over-ride any data file properties and also serve as 
an input into additional logic to determine other properties such iPhone models 
which are normally not detectable.

The cookie containing the properties is called "DAPROPS".


***** BASIC SERVER SIDE USAGE ***** 
1) Include the deviceatlas-X.X.min.js file on your webpage.
2) In your web application, pass the contents of the DeviceAtlas cookie
   to the DeviceAtlas API.

NOTE: the cookie contents will only be set after the first request. It is
recommended to not rely on the client side properties for the very first page.

Please see the Example code bundled with the API for more information.


***** CUSTOM CONFIGURATION *****
To customize a cookie name or other cookie parameters like a domain or a path
you can use the code bellow - just remember that this code must be used before
you include deviceatlas-X.X.min.js file.

var DeviceAtlas = {
	cookieName: 'DAPROPS', // the name of the cookie name
	cookieExpiryDays: 1, // the time the cookie expires in days
	cookieDomain: '.yourdomain.tld', // custom domain
	cookiePath: '/' // custom path
}


***** SENDING COOKIE VIA URL *****
In restricted environment where cookies are not allowed it is possible
to get a cookie content using js getPropertiesAsString() method and pass it as
an URL parameter.

NOTE: it's up to web application integration to get the value from the URL
and pass it properly to the DeviceAtlas API.

EXAMPLE:

<script type="text/javascript">

window.onload = function() {
	var img = document.createElement('img');
	img.setAttribute('id', 'ad-banner');
	img.setAttribute('src', './ads.php?DAPROPS=' + encodeURIComponent(DeviceAtlas.getPropertiesAsString()));
	document.body.appendChild(img);
}
		
</script>

© 2013 Afilias Technologies Ltd (dotMobi). All rights reserved

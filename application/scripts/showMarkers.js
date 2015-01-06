
    var customIcons = {
      restaurant: {
        icon: 'http://labs.google.com/ridefinder/images/mm_20_blue.png',
        shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
      },
      bar: {
        icon: 'http://labs.google.com/ridefinder/images/mm_20_red.png',
        shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
      },
	  	marker: {
		icon: 'http://maps.google.com/mapfiles/kml/pal3/icon33.png',
		shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
	}
    };
	

var gmarkers = [];
var markerArray = [];
function initialize() {

  var mapOptions = {
       zoom: 13,
       mapTypeId: google.maps.MapTypeId.ROADMAP,
       center: new google.maps.LatLng(21.0256, 105.844)
     };

  var map = new google.maps.Map(document.getElementById("map"),mapOptions);
	displayAllMarkers(map);
	var icon = customIcons["marker"] || {};
    google.maps.event.addListener(map, "click", function(event) {
        var marker = new google.maps.Marker({
          position: event.latLng,
		  icon:icon.icon,
		  draggable: true,
          map: map
        });
		var infowindow;
		var html = "<table>" +
				"<input type='text' id='name1' style='visibility: hidden' value='" + name +"'/>" +
                 "<tr><td>Name:</td> <td><input type='text' id='name'/> </td> </tr>" +
                 "<tr><td>Comment:</td> <td><textarea id='comment' rows='3' cols='16'></textarea></td> </tr>" +
                 "<tr><td>Radius:</td> <td><input type='text' id='radius' maxlength='6' onkeypress='return isNumberKey(event)'/> m</td></tr>" +
				 "<tr><td>Status:</td> <td><input type='text' disabled='disabled' id='tag' value='insert'/></td> </tr>" +
                 "<tr><td></td><td><input type='button' value='Save & Close' onclick='saveData("+ event.latLng.lat()+","+event.latLng.lng() +")'/></td></tr>";
	  
		infowindow = new google.maps.InfoWindow({
			content: html
		});
        infowindow.open(map, marker);
        google.maps.event.addListener(infowindow, 'closeclick', function()
		{
			marker.setMap(null);
		});
		google.maps.event.addListener(marker, 'dblclick', function()
		{
			marker.setMap(null);
		});
		google.maps.event.addListener(map, "click", function(event) {		
		marker.setMap(null);
		});
    });
  var geocoder = new google.maps.Geocoder();  

     $(function() {
         $("#searchbox").autocomplete({
         
           source: function(request, response) {

          if (geocoder == null){
           geocoder = new google.maps.Geocoder();
          }
             geocoder.geocode( {'address': request.term }, function(results, status) {
               if (status == google.maps.GeocoderStatus.OK) {

                  var searchLoc = results[0].geometry.location;
               var lat = results[0].geometry.location.lat();
                  var lng = results[0].geometry.location.lng();
                  var latlng = new google.maps.LatLng(lat, lng);
                  var bounds = results[0].geometry.bounds;

                  geocoder.geocode({'latLng': latlng}, function(results1, status1) {
                      if (status1 == google.maps.GeocoderStatus.OK) {
                        if (results1[1]) {
                         response($.map(results1, function(loc) {
                        return {
                            label  : loc.formatted_address,
                            value  : loc.formatted_address,
                            bounds   : loc.geometry.bounds
                          }
                        }));
                        }
                      }
                    });
            }
              });
           },
           select: function(event,ui){
      var pos = ui.item.position;
      var lct = ui.item.locType;
      var bounds = ui.item.bounds;

      if (bounds){
       map.fitBounds(bounds);
      }
           }
         });
     });   
 }



	function displayParameter(){
		downloadUrl("Business/Marker/genParameter.php", function(data) {
			var xml = data.responseXML;
			var textHtml = "";
			var parameter = xml.documentElement.getElementsByTagName("parameter");
			for(var i = 0; i < parameter.length; i++){
				var id = parameter[i].getAttribute("id");
				var imei = parameter[i].getAttribute("imei");
				var duration = parameter[i].getAttribute("time_duration");
				textHtml = duration;
			}
			document.getElementById("time").value = textHtml;
		});
	}
	function updateParameter(){
		var time = document.getElementById("time").value;
		var tag = "updateParameter"
			var url = "Common/DatabaseCommon/phpsqlinfo_addrow.php?timeDuration=" + time + "&tag=" + tag;
      downloadUrl(url, function(data, responseCode) {
        if (responseCode == 200) {
		 alert("Parameter updated.");
		 document.location.reload(true);
        }
      });

	}
	function displayAllMarkers(map){
	  var side_bar_html = '';
	  var markers;
      // Change this depending on the name of your PHP file
	  var url = 'http://localhost:50/cubetboard-master/application/controllers/phpsqlajax_genxmlMarkers.php';
      downloadUrl(url, function(data) {
        var xml = data.responseXML;
         markers = xml.documentElement.getElementsByTagName("marker");
        for (var i = 0; i < markers.length; i++) {
          var id = markers[i].getAttribute("id");
          var name = markers[i].getAttribute("Name");
          var comment = markers[i].getAttribute("Comment");
		  var radius = markers[i].getAttribute("Radius");
          var point = new google.maps.LatLng(
              parseFloat(markers[i].getAttribute("Latitude")),
              parseFloat(markers[i].getAttribute("Longitude")));
		  var createdAt = markers[i].getAttribute("createdAt");
		  var icon = customIcons["marker"] || {};
		  markerArray.push(name);
		  var marker = new google.maps.Marker({
            map: map,
			icon:icon.icon,
            position: point
          });
		  var circle = {
            strokeColor: '#FF0000',
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: '#FF0000',
            fillOpacity: 0.35,
            map: map,
            center: point,
            radius: radius*11/11
          };
		  markerCircle = new google.maps.Circle(circle);
		  var html = "";
			html += '<table>';
			html += '<input type="text" id="name1" style="visibility: hidden" value="' + name +'"/>' ;
			html += '<tr><td>Name:</td> <td><input type="text" id="name" value="' + name +'"/></td> </tr>' ;
			html += '<tr><td>Comment:</td> <td><textarea id="comment" rows="3" cols="16">'+comment+'</textarea></td> </tr>' ;
			html += '<tr><td>Radius:</td> <td><input type="text" id="radius" maxlength="6" onkeypress="return isNumberKey(event)" value="' + radius + '"/> m</td></tr>' ;
			html += '<tr><td>Status:</td> <td><input type="text" disabled="disabled" id="tag" value="update"/></td> </tr>' ;
			html += '<tr><td>Last update :</td> <td><input type="text" disabled="disabled" id="createAt" value="'+ createdAt +'"/></td> </tr>' ;
			html += '<tr><td><input type="button" value="Save & Close" onclick="saveData('+ point.lat()+','+ point.lng() +')"/></td>' ;
			html +=   '<td><input type="button" value="Delete" onclick="deleteData('+ point.lat()+','+ point.lng() +')"/></td>' ;
			html +=  '</tr>';
          //var icon = customIcons[type] || {};
          bindInfoWindow(marker, map, html);
		  gmarkers.push(marker);
		 side_bar_html += '<tr><td><a href="javascript:myclick(' + i + ')">' + name + '<\/a></td></tr>';
        }
		// put the assembled side_bar_html contents into the side_bar div
		//document.getElementById("tableDangerArea").innerHTML = side_bar_html;
	   
      });
	}
		
	  function myclick(i) {
        google.maps.event.trigger(gmarkers[i],"click");
      }
	
	  function isNumberKey(evt)
       {
          var charCode = (evt.which) ? evt.which : event.keyCode;
          if (charCode < 48 || charCode > 57){
             return false;
			 }

          return true;
       }
	
	function deleteData(lat, lng) {
      var name = document.getElementById("name").value;
      var comment = document.getElementById("comment").value;
      var radius = document.getElementById("radius").value;
	  var tag = "delete";
	 
	var url = "Common/DatabaseCommon/phpsqlinfo_addrow.php?name=" + name + "&comment=" + comment +
                "&radius=" + radius + "&tag=" + tag + "&latitude=" + lat + "&longitude=" + lng;
      downloadUrl(url, function(data, responseCode) {
        if (responseCode == 200) {
			alert("Marker Deleted.");
		  document.location.reload(true);
        }
      });

    }
	
	function saveData(lat, lng) {
	  var check = 0;
	  var tag = document.getElementById("tag").value;
	  var name = document.getElementById("name").value;
	  if(tag=="insert"){
				for(var i =0; i < markerArray.length; i++){
				var nameDB=markerArray[i];
				if(nameDB==name){
					check = 1;
				}
			}
		  if(name=="" || name == " " || name.match(/^\s*$/)){
			  alert("Please enter name");
			  check = 1;
		  }
	  }
	   if(tag=="update"){
		   var name1 = document.getElementById("name1").value;
		   var count = 0;
			for(var i =0; i < markerArray.length; i++){
			var nameDB=markerArray[i];
				if(nameDB==name){
					check = 1;
				}
			}
		  if(name==name1){
		  	check = 0;
		  }
		  if(name=="" || name == " " || name.match(/^\s*$/)){
			  alert("Please enter name");
			  check = 1;
		  }
	  }
	  if(check == 1){
		   alert("Please enter different name");
	  }
	  if(check == 0){
      var comment = document.getElementById("comment").value;
      var radius = document.getElementById("radius").value;
	var url = "Common/DatabaseCommon/phpsqlinfo_addrow.php?name=" + name + "&comment=" + comment +
                "&radius=" + radius + "&tag=" + tag + "&latitude=" + lat + "&longitude=" + lng + "&name1=" + name1;
      downloadUrl(url, function(data, responseCode) {
        if (responseCode == 200) {
		  alert("Marker added or update.");
		  document.location.reload(true);
        }
      });
	  }
    }
	
    function bindInfoWindow(marker, map, html) {
	  var infoWindow = new google.maps.InfoWindow;
      google.maps.event.addListener(marker, 'click', function() {
        infoWindow.setContent(html);
        infoWindow.open(map, marker);
      });
    }

	
    function downloadUrl(url, callback) {
      var request = window.ActiveXObject ?
          new ActiveXObject('Microsoft.XMLHTTP') :
          new XMLHttpRequest;

      request.onreadystatechange = function() {
        if (request.readyState == 4) {
          request.onreadystatechange = doNothing;
          callback(request, request.status);
		  
        }
      };
	  
	  
      request.open('GET', url, true);
      request.send(null);
    }
	


    function doNothing() {}

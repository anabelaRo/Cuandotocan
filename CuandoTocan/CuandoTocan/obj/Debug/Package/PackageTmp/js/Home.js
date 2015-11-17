//Slider:
jssor_1_slider_init = function() {
    var jssor_1_SlideshowTransitions = [
        {$Duration:1200,$Opacity:2}
    ];
            
    var jssor_1_options = {
        $AutoPlay: true,
        $SlideshowOptions: {
        $Class: $JssorSlideshowRunner$,
        $Transitions: jssor_1_SlideshowTransitions,
        $TransitionsOrder: 1
        },
        $ArrowNavigatorOptions: {
        $Class: $JssorArrowNavigator$
        },
        $BulletNavigatorOptions: {
        $Class: $JssorBulletNavigator$
        }
    };
            
    var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);
            
    //responsive code begin
    //you can remove responsive code if you don't want the slider scales while window resizes
    function ScaleSlider() {
        var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
        if (refSize) {
            refSize = Math.min(refSize, 1080); //600
            jssor_1_slider.$ScaleWidth(refSize);
        }
        else {
            window.setTimeout(ScaleSlider, 30);
        }
    }
    ScaleSlider();
    $Jssor$.$AddEvent(window, "load", ScaleSlider);
    $Jssor$.$AddEvent(window, "resize", $Jssor$.$WindowResizeFilter(window, ScaleSlider));
    $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
    //responsive code end
};


// google.maps.event.addDomListener(window, 'load', init);
        
              function initMap() {
                // Basic options for a simple Google Map
                // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
                var mapOptions = {
                    // How zoomed in you want the map to start at (always required)
                    zoom: 16,

                    // The latitude and longitude to center the map (always required)
                    center: new google.maps.LatLng(-34.91375, -57.989028), // New York

                    // How you would like to style the map. 
                    // This is where you would paste any style found on Snazzy Maps.
                    styles: [{"featureType": "road","stylers": [{ "color": "#b4b4b4" }]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#a0d6d1"},{"lightness":17}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#dedede"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#dedede"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#dedede"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":16}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#f1f1f1"},{"lightness":21}]},{"elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#ffffff"},{"lightness":16}]},{"elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#333333"},{"lightness":40}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#f2f2f2"},{"lightness":19}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#fefefe"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#fefefe"},{"lightness":17},{"weight":1.2}]}]
                
                    //styles: [{"featureType":"road", "stylers":[{"color":"#b4b4b4"},{"featureType":"water","stylers":[{"color":"##d8d8d8"}]},{"featureType":"landscape","stylers":[{"color":"#f1f1f1"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#000000"}]},{"featureType":"poi","stylers":[{"color":"#d9d9d9"}]},{"elementType":"labels.text","stylers":[{"saturation": 1 },{"weight": 0.1 },{ "color": "#000000" }]}];

  


                };

                // Get the HTML DOM element that will contain your map 
                // We are using a div with id="map" seen below in the <body>
                var mapElement = document.getElementById('map_canvas');

                // Create the Google Map using our element and options defined above
                var map = new google.maps.Map(mapElement, mapOptions);
                var image = '../img/logo_min_mapa.png';
                // Let's also add a marker while we're at it
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(-34.91375, -57.989028),
                    map: map,
                    icon: image
                  
                });
            }


            //compartir

            $(function () {

    //Google +1
    $.getScript("http://apis.google.com/js/plusone.js", null, true);

    //Twitter
    $.getScript("http://platform.twitter.com/widgets.js", null, true);

    //Facebook
    $.getScript("http://connect.facebook.net/en_US/all.js#xfbml=1",  function(){
       
        $('body').append('<div id="fb-root"></div>'); 

        FB.init({ status: true, cookie: true, xfbml: true }); 
   
    }, true);
});
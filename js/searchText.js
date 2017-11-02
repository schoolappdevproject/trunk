       var cache = {};
  
  //loading autocomplete function  
        function load()
        {
              
            var schoolLocation = /** @type {!HTMLInputElement} */(
                document.getElementById('school_location_search'));
            
            if(google)
            {
              var autocompleteLocation = new google.maps.places.Autocomplete(schoolLocation);
              autocompleteLocation.addListener('place_changed', function() {
                    var place = autocompleteLocation.getPlace();
                    if (!place.geometry) {
                      window.alert("Autocomplete's returned place contains no geometry");
                      return;
                    }
                  
                    var map_location_latitude = place.geometry.location.lat();
                    var map_location_longitude = place.geometry.location.lng();  
                    console.log(map_location_latitude);
                    console.log(map_location_longitude);
              });
            }
            
                      
            $( "#school_name_search_txt" ).autocomplete({
              minLength: 2,
              source: function( request, response ) {
                var term = request.term;
                if ( term in cache ) {
                  response( cache[ term ] );
                  return;
                }

                $.getJSON( "api/search_api/search_school_name.php", request, function( data, status, xhr ) {
                  cache[ term ] = data;  
                  response(data);
                });
              },
                messages: {
                    noResults: '',
                    results: function() {}
                }
            });
        }
        
        function startSearch()
        {
                         
            var schoolLocation = document.getElementById("school_location_search").value;
            var schoolName     = document.getElementById("school_name_search_txt").value;
            
            var school_info = schoolLocation +"#" + schoolName;
            createCookie('school_info',school_info,7);

            window.location.href = "search.html";
           
        }
    
     function runScript(e) {
         console.log(e.keyCode);
        if (e.keyCode == 13) {
        startSearch();  //Fire Search event on Enter Click
            return true;
        }
     }
        
        window.onload = function() {
          load();
        };
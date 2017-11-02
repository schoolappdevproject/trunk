
datahandlerApp.service('PictureGalleryService', function($rootScope) {

    this.school_id ="";
    this.pictureGalleryImages = [];
    this.syncDataset = function()
    {
        var self = this;
        return  self.pictureGalleryImages;
    }

    this.createPictureGallery = function($scope)
    {
        var self = this ;
        var picArray = [];
         self.pictureGalleryImages.forEach(function(pic) {
                var picObject = new Object();
                picObject.src = pic.picName;
                picObject.srct = pic.picName;
                picObject.title = pic.imageClass;
                picArray.push(picObject);
         })

         var itemArray = JSON.parse(JSON.stringify(picArray));

        // console.log(itemArray);

        var myColorScheme = {
				navigationbar : {
					background : '#000',
					border : '0px dotted #555',
					color : '#ccc',
					colorHover:'#fff'
				},
				thumbnail : {
					background:'#000',
					border:'1px solid #000',
					labelBackground:'transparent',
					labelOpacity:'0.8',
					titleColor:'#fff',
					descriptionColor:'#eee'
				}
			};
			var myColorSchemeViewer = {
				background:'rgba(1, 1, 1, 0.75)',
				imageBorder:'12px solid #f8f8f8',
				imageBoxShadow:'#888 0px 0px 20px',
				barBackground:'#222',
				barBorder:'2px solid #111',
				barColor:'#eee',
				barDescriptionColor:'#aaa'
			};

            
            //$('#nanoGallery1').nanoGallery('destroy');


   		jQuery("#nanoGallery1").nanoGallery({thumbnailWidth:"200",thumbnailHeight:"200",
			    items: itemArray,
				thumbnailHoverEffect:[{name:'imageScaleIn80'},{'name':'descriptionAppear','delay':300},{'name':'borderDarker'}],				
				thumbnailLabel:{display:true,position:'overImageOnBottom'},
                viewerDisplayLogo:true,
                imageTransition: 'fade' ,
                fnViewerInfo:myViewerInfo,
                galleryDisplayMode :'pagination',
                galleryMaxRows: 4,
                locationHash: false,
                thumbnailGutterWidth: 10,
                thumbnailGutterHeight: 10,
                viewerToolbar: { standard:'minimizeButton , previousButton, pageCounter ,nextButton,playPauseButton,fullscreenButton,infoButton,linkOriginalButton,closeButton,label,custom1' },
                fnImgToolbarCustInit: function(elementName) { return('<div>build</div>'); },
                fnImgToolbarCustDisplay: function($elements, item, data) {
                $elements.eq(0).html('photo ID: '+item.GetID() +'<a href="http://google.fr">Test</a>');
                },
                fnImgToolbarCustClick: function(elementName, $element, item, data) {
                alert(elementName);
                },
                debugMode:true
			});
      
    }

    this.startPictureGallery = function(school_id)
    {
        var self = this;
         self.pictureGalleryImages = [];
        self.school_id = school_id;
         
                var formData = {
                    school_id           : self.school_id
                };

                console.log(formData);

                  // process the formf
                $.ajax({
                    type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                    url         : 'api/image_upload/getImageNames.php', // the url where we want to POST
                    data        : formData, // our data object
                    dataType    : 'json', // what type of data do we expect back from the server
                    encode          : true
                })
                    // using the done promise callback
                .done(function(data) {
                        
                        if(data)
                        {
                            var i = 1;
                            data.forEach(function(pic) {
                                
                                var picture = new Object();
                                picture.picName = pic;
                                picture.thumbId = "thumb_"+i
                                picture.imageClass = "image_"+i;
                                picture.rel = i;

                                if(i ==1)
                                {
                                    picture.style   = "display:inline";                                    
                                }
                                else 
                                {
                                    picture.style   = "display:none";
                                }
                                i = i+1;

                                self.pictureGalleryImages.push(picture);

                            }, this);
                            console.log(self.pictureGalleryImages); 
                            $rootScope.$broadcast('eventLoadPictureGallery');  
                        }
                      
                    // here we will handle errors and validation messages
                }).fail(function( xhr, status, errorThrown ) {
                        console.log( "Query Failed" );
                        console.log( "Error: " + errorThrown );
                        console.log( "Status: " + status );
                        console.dir( xhr );
                        return false;
                });

    }   
   this.savePictureImage = function(image_data,ext)
      {
            var self = this;
             console.log('image file to save '+ self.school_id+' '+ext);
         
                var formData = {
                    school_id           : self.school_id,
                    data                : image_data,
                    ext                 : ext
                 };

                console.log(formData);

                  // process the formf
                $.ajax({
                    type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                    url         : 'api/image_upload/picturegallery_upload.php', // the url where we want to POST
                    data        : formData, // our data object
                    dataType    : 'json', // what type of data do we expect back from the server
                    encode          : true
                })
                    // using the done promise callback
                .done(function(data) {
                        if(data['code'] == '0')
                        {
                                console.log('Image uploaded successfully '+self.school_id);
                                self.startPictureGallery(self.school_id);
                               
                        }
                        else 
                        {
                                console.log('Image upload failed '+self.school_id);
                        }
                      
                    // here we will handle errors and validation messages
                }).fail(function( xhr, status, errorThrown ) {
                        console.log( "Query Failed" );
                        console.log( "Error: " + errorThrown );
                        console.log( "Status: " + status );
                        console.dir( xhr );
                        return false;
                });

      }
      
    this.readPictureFileURL = function(input) {

        var self = this;
        if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                  
                    var ext = input.value.split('.').pop();
                    self.savePictureImage(e.target.result,ext);
                     
                }
                reader.readAsDataURL(input.files[0]);
        
            }
        }

    this.pictureUpload = function(pic)          
    {
        var self = this;
        if(self.checkPictureFileAttach(pic))
            {
                self.readPictureFileURL(pic);
            }
    }
		
    this.checkPictureFileAttach = function(sender) {
        var validExts = new Array(".png", ".gif",".jpg",".jpeg");
        var fileExt = sender.value;
        fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
        if (validExts.indexOf(fileExt) < 0) {
          alert("Invalid file selected, valid files are of " +
                   validExts.toString() + " types.");
          return false;
            }
            else return true;
    }



 });





   


  
      

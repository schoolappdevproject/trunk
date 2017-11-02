/*!
 * jQuery simple gallery Plugin 1.1.0
 *
 * http://fernandomoreiraweb.com/
 *
 * Copyright 2013 Fernando Moreira
 * Released under the MIT license:
 *   http://mit.fernandomoreiraweb.com/
 */
;(function($, window, document, undefined) {

    $.fn.simplegallery = function(options) {

        var defaults = {
            'galltime': 300,
            'gallcontent': '.content',
            'gallthumbnail': '.thumbnailg',
            'gallthumb': '.thumb'
        };

        console.log("simple gallery created :.........")

        var settings = $.extend({}, defaults, options);

        console.log(settings);

        return this.each(function() {

            console.log("Thumb event for each picture")


            $(settings.gallthumb).click(function() {

                $(settings.gallcontent).find('img').stop(true,true).fadeOut(settings.galltime).hide();

                var img_attr = $(this).find('img').attr("id"),
                    image_id = img_attr.replace('thumb_', '');

                console.log("Click event "+img_attr+" "+image_id);


                $('.image_' + image_id + '').stop(true,true).fadeIn(settings.galltime);
                return false;

            });

        });

    };

})(jQuery, window, document);
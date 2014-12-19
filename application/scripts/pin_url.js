$(document).ready(function () { // When the dom is ready
    $('#ajax_flag').val(0); // Initialize value to zero i.e  input tag with id='ajax_flag' will have a new attribute 'value=0'
    $('#findImage').live("click", function (){
             $('.hideAll').hide();
             $('#error_link').html('');
             $('#error_image').html('');
             $('#error_description').html('');
             $('#ajax_flag').val(0); 
             
            var content = $('#link').val(); 
            if(!content){
                $('#error_link').html('Please enter a url');
            }
            else{
            var url = content.match(/https?:\/\/([-\w\.]+)+(:\d+)?(\/([\w/_\-\.]*(\?\S+)?)?)?/);
            $('#error_link').html('Invalid url');
            // regular expression that will allow us to extract url from the textarea
            if (url.length > 0 && $('#ajax_flag').val() == 0) { // If there's atleast one url entered in the textarea
                //ajax_flag ensure that if a url is found and user press spacebar,ajax will trigger only once
                $('#ajax_flag').val(1);
                $('#findImage').addClass('disabled');
                $('#findImage').removeAttr('id');
                $('#error_link').html('');
                $(".imageContainer").html("<img style='float:right;' src='" + baseUrl + "application/assets/images/ajax-loader.gif'>"); // Add an Ajax loading image similar to facebook
                $.ajax({
                    url:baseUrl + "pins/pinsFromUrl?url=" + url[0],
                    type :"GET",
                    dataType :"json",
                    success : function (response) { // Ajax call using get passing the url extracted from the textarea
                    obj = eval(response);
                    
                    if(obj.content){
                    $('.hideAll').show();
                    $("#description").val(obj.description);
                    $(".imageContainer").html(obj.content);
                    $('img#1').fadeIn(); // Add a fading effect with the first image thumbnail extracted from the external website
                    $('#current_img').val(1);
                    $('#current_img_src').val( $("img#1").attr("src"));
                    $('.disabled').attr('id', 'findImage');
                    $('#findImage').removeClass("disabled");
                    
                    }
                    else{
                     $('.hideAll').hide();
                     $('#error_image').html("sorry, we didn't find any images in the url")
                     $('.disabled').attr('id', 'findImage');
                     $('#findImage').removeClass("disabled");
                     $(".imageContainer").html('');
                     $('#ajax_flag').val(0);
                    
                    }
                   
                    
                   }
                });

                 return false;
                 
            }
            }  

    });

   
    ///////////////////////////////////////////////////////////////////////	 Next image
    $('#next').live("click", function () {
    // when user click on next button
        var firstimage = $('#current_img').val(); // get the numeric value of the current image
        if (firstimage <= $('#total_images').val() - 1) // as long as last image has not been reached
        {
            $('img#' + firstimage).hide(); // hide the current image to be able to display the next image
            firstimage = parseInt(firstimage) + parseInt(1); // Increment image no so that next image no. can be displayed
            $('#current_img').val(firstimage); // Incremented in input tag
            $('#current_img_src').val( $("img#" + firstimage).attr("src"));
            $('img#' + firstimage).show(); // show second image
        }
        $('#totalimg').html(firstimage + ' of ' + $('#total_images').val()); // Update the current image no display value
    });
    ///////////////////////////////////////////////////////////////////////	 Next image
    ///////////////////////////////////////////////////////////////////////	 prev image
    $('#prev').live("click", function () { // When user clicks on Previous Button
        //Same logic as for Next Button
        var firstimage = $('#current_img').val();


        if (firstimage >= 2) {
            $('img#' + firstimage).hide();
            firstimage = parseInt(firstimage) - parseInt(1);
            $('#current_img').val(firstimage);
            $('#current_img_src').val( $("img#" + firstimage).attr("src"));
            $('img#' + firstimage).show();
        }
        $('#totalimg').html(firstimage + ' of ' + $('#total_images').val());
    });
    ///////////////////////////////////////////////////////////////////////	 prev image

});
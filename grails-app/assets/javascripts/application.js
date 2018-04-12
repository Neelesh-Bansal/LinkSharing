// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require bootstrap
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}



$(document).ready(function () {
    $(".topicdelete").click(function (e) {
        var id = $(this).attr('id');
        $.ajax({
            type: "GET",
            url: "/topic/delete",
            data: {id: id},
            contentType: "application/json",
            success: function (response) {
                if(response.success){
                    $("#topic-"+id).remove();
                    alert(response.success)
                } else{
                    alert(response.error)
                }
            }, error: function (e) {
                alert("Error");
            }
        });

    });

});
$(".delete").click(function(){
  // Create a confirm box in javascript to ensure the user wants to delete the item
  var c = confirm("Are you sure you want to delete this blog?");
  if(c  == true)
  {
    // Create a AJAX(Remote requests) request to delete the item in real time.
    // Pass in CSRF token to the post request.
    var blog_id = $(this).data("id");
    $.post( "delete_item.jsp", { id: blog_id, csrf: $("#csrf").val() })
      .done(function( data ) {
        $("#blog_" + blog_id).fadeOut(1000, function() { $(this).remove(); });
    });
  }
});

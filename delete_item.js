$(".delete").click(function(){
  var c = confirm("Are you sure you want to delete this blog?");
  if(c  == true)
  {
    var blog_id = $(this).data("id");
    $.post( "delete_item.jsp", { id: blog_id })
      .done(function( data ) {
        $("#blog_" + blog_id).fadeOut(1000, function() { $(this).remove(); });
    });
  }
});

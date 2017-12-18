<%@include file="db.jsp" %>
<%@include file="current_user.jsp" %>

<%
	String user = (String) session.getAttribute( "user" );
	String username = (String) session.getAttribute( "username" );
	if (null == user) {
		response.sendRedirect("login_form.jsp");
	}
	//Check user
	Statement st = con.createStatement();
	ResultSet results = st.executeQuery("SELECT title, content, created_at, id, user_id from blog ORDER BY created_at DESC");
%>
<jsp:include page="navbar.jsp"/>



<body style="background-color: #e9ebee;">
	<div class="container">
	  <div class="row">
			<div class="col-xs-12">
				<!-- Form to create blog -->
				<div class="blog-post feed-item">
					<form  method="post" action="blog_action.jsp">
						<%
							// Create CSRF token here...
							String csrf = "" + System.currentTimeMillis() + Math.random() * 10000000;
							session.setAttribute("csrf", csrf);
						%>
						<jsp:include page="error.jsp"/>
						<input type="hidden" name="csrftoken" value=<% out.print(csrf); %>
						<!-- Adding required true to the input fields -->
						<input class="form-control" name="blogtitle" size=100 required="true" placeholder="Blog title"/>
						<br>
						<textarea class="form-control" name="blogcontent" rows="2" cols="100" required="true" placeholder="What's on your mind? To blog of course!"></textarea>
						<br>
						<input class="btn btn-primary" type="submit" value="Add Blog"/>
					</form>
				</div>

				<!-- Blog Feed -->
				<%
					while ( results.next() ) {
						String blog_id = results.getString(4);
						out.print("<div id='blog_" + blog_id + "' class='feed-item'><h5><a href='blog_item.jsp?id=" + blog_id + "'>" + results.getString(1) + "</a></h5>");
						out.print(results.getString(2));
						if( results.getString(5).equals(user_id) || is_admin){
							out.print("<hr>");
							out.print("<i class='delete fa fa-trash' data-id='" + results.getString(4) + "'></i>");
						}
						out.print("</div>");
					}
				%>
				<hr>
			</div>
		</div>

	</div>

<jsp:include page="footer.jsp"/>
<script src="delete_item.js"></script>

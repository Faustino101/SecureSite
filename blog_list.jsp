<%@include file="db.jsp" %><%

	String user = (String) session.getAttribute( "user" );
	String username = (String) session.getAttribute( "username" );
	if (null == user) {
		response.sendRedirect("login_form.jsp");
	}
	//Check user
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT title, content, created_at from blog ORDER BY created_at DESC");
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
					while ( rs.next() ) {
						out.print("<div class='feed-item'><h5>" + rs.getString(1) + "</h5>");
						out.print(rs.getString(2) + "</div>");
					}
				%>
				<hr>
			</div>
		</div>

	</div>
<%

//Correct

/*

String sqlStr = "SELECT count(*) FROM login WHERE user=? and pass = sha2(?, 256)";

PreparedStatement stmt = con.prepareStatement(sqlStr);

stmt.setString(1,name);

stmt.setString(2,pwd);

ResultSet rs = stmt.executeQuery();

rs.next();

if ( rs.getInt(1) == 1 ) isAuth=true;

*/



//SQL injection attack

// a ' OR '1'='1' --



%>



<jsp:include page="footer.jsp"/>

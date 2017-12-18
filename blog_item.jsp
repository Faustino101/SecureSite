<%@include file="db.jsp" %>
<%
	String user = (String) session.getAttribute( "user" );
	String username = (String) session.getAttribute( "username" );
	if (null == user) {
		response.sendRedirect("login_form.jsp");
	}
  // Prepare statements for select statement to prevent SQL injection
  String id = (String) request.getParameter("id");

  String sqlStr = "SELECT * FROM blog WHERE id=?";
  PreparedStatement stmt = con.prepareStatement(sqlStr);
  stmt.setString(1,id);
  ResultSet rs = stmt.executeQuery();
%>

<jsp:include page="navbar.jsp"/>

<body style="background-color: #e9ebee;">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <%

          while ( rs.next() ) {
            out.print("<div class='feed-item'><h5>" + rs.getString(1) + "</h5>");
            out.print(rs.getString(2) + "</div>");
          }
        %>
      </div>
    </div>
  </div>
</body>

<jsp:include page="footer.jsp"/>

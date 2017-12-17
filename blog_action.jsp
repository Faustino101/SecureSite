<%@include file="db.jsp" %>

<%
// Get the title and content from the Form in blog_list
String title = request.getParameter("blogtitle");
String content = request.getParameter("blogcontent");
// Get the randomly generated CSRF token from the HTML FORM
String formCsrf = request.getParameter("csrftoken");

// Get the CSRF from the Cookies
String sessionCsrf = sessions.getAttribute("csrf");

// Ensure CSRF cookie matches with the CSRF in the HTML form
// and esnure that title and content are not blank.
if(title.length() == 0 || content.length() == 0 || sessionCsrf != formCsrf){
  // Title/content are blank or CSRF did not match... Someone is being malicious!
  response.sendRedirect("blog_list.jsp");
} else {
  // Prepare statements to prevent SQL injection
  String sqlStr = "insert into blog(title, content) values (?, ?)";
  PreparedStatement stmt = con.prepareStatement(sqlStr);
  stmt.setString(1, title);
  stmt.setString(2, content);
  stmt.executeUpdate();
  response.sendRedirect("blog_list.jsp");
}

%>

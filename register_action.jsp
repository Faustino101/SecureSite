<%@include file="db.jsp" %><%
//get form input
String fullname = request.getParameter( "fullname" );
String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );
// Get the randomly generated CSRF token from the HTML FORM
String formCsrf = request.getParameter("csrftoken").toString();
// Get the CSRF from the Cookies
String sessionCsrf = (String) session.getAttribute("csrf").toString();

// Adding if else statement to ensure we get a good password and no blank values
if( fullname.length() < 1 || user.length() < 1 || pass.length() < 8 || !formCsrf.equals(sessionCsrf)){
  // Password, fullname or user was not secure, will not execture SQL and return to reguster form
  response.sendRedirect("register_form.jsp");
} else {
  // Adding user to login table

  String sqlStr = "insert into login(fullname, user, pass) values (?, ?, sha2(?, 256))";
  PreparedStatement stmt = con.prepareStatement(sqlStr);
  stmt.setString(1, fullname);
  stmt.setString(2, user);
  stmt.setString(3, pass);
  stmt.executeUpdate();
  response.sendRedirect("login_form.jsp");
}

%>





<%
//Correct
/*
String sqlStr = "insert into login(fullname,user, pass) values (?,? sha2(?, 256))";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,fullname);
stmt.setString(2,user);
stmt.setString(3,pass);
ResultSet rs = stmt.execute();
*/
//SQL injection attack
// a' OR 1=1 --
%>

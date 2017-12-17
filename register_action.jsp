<%@include file="db.jsp" %><%
//get form input
String fullname = request.getParameter( "fullname" );
String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );

// Adding if else statement to ensure we get a good password and no blank values
if( fullname.length() < 1 || user.length() < 1 || pass.length() < 8 ){
  // Password, fullname or user was not secure, will not execture SQL and return to reguster form
  response.sendRedirect("register_form.jsp");
} else {
  // Adding user to login table
  String sqlStr = "insert into login(fullname,user, pass) values ('" + fullname + "', '" + user + "', sha2('"+ pass + "', 256))";
  Statement stmt = con.createStatement();
  stmt.execute(sqlStr);
  response.sendRedirect("login_form.html");
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

<%@include file="db.jsp" %><%

//Check user
String user = request.getParameter( "user" );
String pass = request.getParameter( "pass" );

// Prepare statements for select statement to prevent SQL injection
String sqlStr = "SELECT count(*) FROM login WHERE user=? and pass = sha2(?, 256)";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,user);
stmt.setString(2,pass);
ResultSet rs = stmt.executeQuery();
rs.next();

if ( rs.getInt(1) == 1 ){
	session.setAttribute( "user", user );
	session.setAttribute( "username", rs.getString(1) );
	session.setMaxInactiveInterval(60*20);
	response.sendRedirect("blog_list.jsp");
} else {
	session.setAttribute("error", "Invalid credentials!");
	response.sendRedirect("login_form.jsp");
}
//Statement stmt = con.createStatement();
//ResultSet rs = stmt.executeQuery(sqlStr);
%>



<%
//Correct
/*
String sqlStr = "SELECT count(*) FROM login WHERE user=? and pass = sha2(?, 256)";
PreparedStatement stmt = con.prepareStatement(sqlStr);
stmt.setString(1,user);
stmt.setString(2,pass);
ResultSet rs = stmt.executeQuery();
rs.next();
if ( rs.getInt(1) == 1 ) isAuth=true;
*/

//SQL injection attack
// a ' OR '1'='1' --

%>

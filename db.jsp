<%@ page import = "java.sql.*, java.util.*, java.io.*, com.mysql.*" %><%
Connection con=null;
try {
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/secure_website", "richard", "faustinosecure123!");
}
catch(Exception e) {
	out.print("Try again ");
	out.print(e);
	return;
}
%>

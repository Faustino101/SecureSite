<%@include file="db.jsp" %>

<%
String title = request.getParameter("blogtitle");
String content = request.getParameter("blogcontent");

String sqlStr = "insert into blog(title, content) values (?, ?)";
PreparedStatement stmt = con.prepareStatement(sqlStr);

stmt.setString(1, title);
stmt.setString(2, content);
stmt.executeUpdate();

  response.sendRedirect("blog_list.jsp");

%>
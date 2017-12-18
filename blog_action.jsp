<%@include file="db.jsp" %>
<%@include file="current_user.jsp" %>

<%
// Get the title and content from the Form in blog_list
String title = request.getParameter("blogtitle");
String content = request.getParameter("blogcontent");
// Get the randomly generated CSRF token from the HTML FORM
String formCsrf = request.getParameter("csrftoken").toString();
// Get the CSRF from the Cookies
String sessionCsrf = (String) session.getAttribute("csrf").toString();

//  PREVENT XSS - Do more, but for now allow HTML for blog post and make sure scripts do not work...
title = title.replace("<script","");
content = content.replace("<script","");

// Ensure CSRF cookie matches with the CSRF in the HTML form
// and esnure that title and content are not blank.
if(user_id == null || title.length() == 0 || content.length() == 0 || sessionCsrf == null || !sessionCsrf.equals(formCsrf) ){
  // Title/content are blank or CSRF did not match... Someone is being malicious!
  session.setAttribute("error","Blog posting did not work... Hmm we are looking into this now");
  response.sendRedirect("blog_list.jsp");
} else {
  // Prepare statements to prevent SQL injection
  sqlStr = "insert into blog(title, content, user_id) values (?, ?, ?)";
  stmt = con.prepareStatement(sqlStr);
  stmt.setString(1, title);
  stmt.setString(2, content);
  stmt.setString(3, user_id);
  stmt.executeUpdate();
  response.sendRedirect("blog_list.jsp");
}
%>

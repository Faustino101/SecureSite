<%@include file="db.jsp" %>
<%@include file="current_user.jsp" %>
<%
  String id = (String) request.getParameter("id");
  String formCsrf = request.getParameter("csrf").toString();
  // Get the CSRF from the Cookies
  String sessionCsrf = (String) session.getAttribute("csrf").toString();

  // Ensure user can delete
  sqlStr = "SELECT user_id FROM blog WHERE id=?";
  stmt = con.prepareStatement(sqlStr);
  stmt.setString(1,id);
  rs = stmt.executeQuery();
  rs.next();
  String blog_user_id = rs.getString(1);
  if( ( blog_user_id.equals(user_id) && formCsrf.equals(sessionCsrf) ) || is_admin ){
    // User can delete
    sqlStr = "DELETE FROM blog WHERE id=?";
    stmt = con.prepareStatement(sqlStr);
    stmt.setString(1,id);
    stmt.executeUpdate();
    out.print("Executed statement");
  } else {
    out.print("Did not execute");
  }
%>

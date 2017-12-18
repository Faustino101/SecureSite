<%@include file="db.jsp" %>
<%@include file="current_user.jsp" %>
<%
  String id = (String) request.getParameter("id");

  // Ensure user can delete
  sqlStr = "SELECT user_id FROM blog WHERE id=?";
  stmt = con.prepareStatement(sqlStr);
  stmt.setString(1,id);
  rs = stmt.executeQuery();
  if( (rs.next() && rs.getString(1) == user_id) || is_admin ){
    // User can delete
    sqlStr = "DELETE FROM blog WHERE id=?";
    stmt = con.prepareStatement(sqlStr);
    stmt.setString(1,id);
    stmt.executeUpdate();
  }
%>

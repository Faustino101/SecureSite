<%
  // Small utility function to get the current user logged in, will not save the ID as a cookie
  // Alternative to saving ID's/sensitive data in cookies/sessions.
  String user_id = null;
  boolean is_admin = false;
  String sess_user = (String) session.getAttribute( "user" );
  String sqlStr = "SELECT id, admin FROM login where user=?";
  PreparedStatement stmt = con.prepareStatement(sqlStr);
  stmt.setString(1,sess_user);
  ResultSet rs = stmt.executeQuery();
  if ( rs.next() ){
    user_id = rs.getString(1);
    is_admin = rs.getBoolean(2);
  }
%>

<%
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

<%
  boolean logged_in = false;
  String user = (String) session.getAttribute("user");
  String username = (String) session.getAttribute("username");
  String error = (String) session.getAttribute("error");
  if( user != null ){
    logged_in = true;
  }

%>

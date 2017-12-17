<%
  // Display an error if it exists then destroy it
  String err = (String) session.getAttribute("error");
  if (err != null){
    out.print("<p style='color:red'>" + err + "</p>");
    session.setAttribute("error", null);
  }
%>

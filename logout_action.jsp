<%
  session.setAttribute("user", null);
  session.setAttribute("username", null);
  response.sendRedirect("login_form.jsp");
%>

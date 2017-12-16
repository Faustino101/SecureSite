<h1>Welcome to my JSP page</h1>


<%
out.print("Hello, World!");
%>

<%
//Headings of various size
for (int i=1; i<7; i++) {
	out.print("<H" + i + ">This is heading " + i + "</H" + i + ">");
}
%>

<div id="d2" style="color:red" >
Red colored test
</div>

<table border=1>
<%
//Generate table
for (int i=1; i<7; i++) {
	out.print("<tr>");
	for (int j=1; j<10; j++) {
		out.print("<td>Row=" + i + ", col=" + j + "</td>");
	}
	out.print("</tr>");
}
%>
</table>
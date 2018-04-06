<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
}    
%>
<h1>Hello <% out.print(session.getAttribute("user")); %></h1>
<a herf="lonout.jsp">Log Out</a>


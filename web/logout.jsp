<%-- 
    Document   : logout
    Created on : 25/04/2018, 00:38:38
    Author     : Amanda
--%>


<%
  session.setAttribute("login","false");
  session.removeAttribute("id");
  response.sendRedirect("index.jsp");

%>

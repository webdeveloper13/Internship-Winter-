<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

     <%
        session.invalidate();
        response.sendRedirect("index.jsp");
     %>
    </body>
</html>

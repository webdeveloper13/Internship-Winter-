<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Title</title>
     <link href="styles.css" rel="stylesheet" />
    </head>
    <body>
        <h4>
            <%
            String  tid = request.getParameter("tid");
            String msg = ebook.TitleUtil.deleteTitle(tid);
            if ( msg == null)
             out.println("Title has been deleted successfully!");
            else
             out.println("Error -->" + msg);
            %>
        </h4>
        <p></p>
        <a href="mytitles.jsp">My Titles </a>
     </body>
</html>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="ebook.*" %>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Title</title>
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>
        <h4>
            <%
            String  title = request.getParameter("title");
            String  scode = request.getParameter("scode");
            Author a = (Author) session.getAttribute("author");
            String msg = TitleUtil.addTitle(a.getAid(), scode,title);
            if ( msg == null)
             out.println("Title has been added successfully!");
            else
             out.println("Error -->" + msg);
            %>
        </h4>
    
    </body>
</html>

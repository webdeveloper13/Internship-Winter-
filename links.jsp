<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <style>
             body {font:700 12pt verdana;color:yellow}
             a { color:white}
        </style>
    </head>
    <body bgcolor="black">
     User : ${sessionScope.author.aname}
     <p/> 
        <a href="mytitles.jsp" target="details">My Titles</a>
        <p></p>
        <a href="addtitle.jsp" target="details">Add Title </a>
      
        <p></p>       
        <a href="logout.jsp" target="_top">Logout</a>
    </body>
</html>

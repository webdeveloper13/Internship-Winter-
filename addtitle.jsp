<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Title</title>
                <link href="styles.css" rel="stylesheet" />
    </head>
    <body>

    <h2>Add Title</h2>
    
        <form action="addtitlefinal.jsp" method="post">
            <table>
                <tr>
                    <td>Select Subject 
                    <td> <ebook:subjects />
                </tr>
                <tr>
                    <td>Enter Title
                    <td><input type="text" size="30" name="title" />
                </tr>
            </table>
            <p/>
            <input type=submit value="Add Title">
        </form>                    
    </body>
</html>

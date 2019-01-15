<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="ebook.*"%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>

    <h1 style="background-color: maroon">E-Book Publishing</h1>
    <table width="100%" height="600px">
        <tr valign="top">
            <td style="background-color:blanchedalmond" width="25%">
                <h4>Author Login </h4>
                <form action="index.jsp" method="post">
                    Email Address
                    <br/>
                    <input type=text name="email" style="width:150px">
                    <br/>
                    Password
                    <br/>
                    <input type=password name="pwd" style="width:150px">
                    <p/>
                    <input type=submit value="Login">
                    <%
                      String email = request.getParameter("email");
                      if ( email != null)
                      {
                       String pwd = request.getParameter("pwd");
                       Author a = AuthorUtil.login(email,pwd);
                       if ( a != null)
                          out.println("Invalid Login");
                       else {
                            session.setAttribute("author",a);
                            response.sendRedirect("home.html");
                       }
                     } 

                    %>
                </form>
                <p></p>
                
            </td>
            
                <td style="background-color:black">
                <i> This website contains titles published by individuals.</i>  
                <p> <font color="red"></font></p>
             <i><font color="white">In order to publish a title, you have to register as an author 
             and then add titles. Each title contains a set of chapters, where each
             chapter is a .PDF file.</font></i>
             <p></p>
             <i><font color="white">You can read the feedback provided by other readers before
                 you download and read any title.<//font></i>
             <h3><font color="white">Subjects Available</font> </h3>
             The following are the title available on different subjects.
             <p/>
            
             <p/>
                <a href="search.jsp">Search For Titles </a>
                
                  <img src="C:\Users\MAHE\Desktop\internship\internship\book2.jpg" height="350" width="700" > 
                
                 
                 
                
            </td>
            <td>
            <center> <img src="C:\Users\MAHE\Desktop\internship\internship\books.jpg" height="300" width="200" > </center>    
                  <img src="C:\Users\MAHE\Desktop\internship\internship\book1.jpg" height="300" width="300" align="left">
                  
            </td>
        </tr>
    </table>    
                
               
    
    
    </body>
</html>

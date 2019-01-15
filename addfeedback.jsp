<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="java.sql.*,ebook.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>
           <%
            String tid = request.getParameter("tid");
            String feedback = request.getParameter("feedback");
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(" insert into feedback values( sq_fid.nextval,?,?,sysdate)");
            ps.setString(1,tid);
            ps.setString(2,feedback);
            if ( ps.executeUpdate() == 1)
               out.println("Feedback added successfully!");
             else
               out.println("Feedback could not be added!");
            DBUtil.close(ps);
            DBUtil.close(con);
         %>
         
         <a href="javascript:history.back()">Back</a>
         <a href="index.jsp">Home Page</a>
   </body>
</html>


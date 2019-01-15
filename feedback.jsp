<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="java.sql.*,ebook.*"%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link href="styles.css" rel="stylesheet" />
    </head>
    <body>

    <h2>Feedback Form</h2>
            <form action="addfeedback.jsp" method="post">
                Feedback
                <p/>
                <input type="hidden" name="tid" value="${param.tid}">
                <textarea name="feedback" rows="3" cols="70"></textarea>
                <br/>
                <input type=submit value="Add Feedback">
            </form>
            <h3>Feedback </h3>
            <table  border=1 cellspacing=2  width="100%">
            <tr>
                <th>Date</th>
                <th>Feedback</th>
            </tr>
            <%
            String tid = request.getParameter("tid");
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement("select to_char(df,'dd-mm-yy') df, feedback from feedback where tid  = ?");
            ps.setString(1,tid);
            ResultSet rs = ps.executeQuery();
            while ( rs.next()) {
            %>                
            <tr>
                <td><%=rs.getString("df") %> </td>
                <td><pre><%=rs.getString("feedback") %></pre> </td>
            </tr>
           <%
            } // while
            rs.close();
            DBUtil.close(ps);
            DBUtil.close(con);
           %>
        </table>
   </body>
</html>

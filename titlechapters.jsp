<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="java.sql.*,ebook.*"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chapters </title>
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>
    <h2>Chapters </h1>
    <p/>
           <table  border=1 cellspacing=2  width="100%">
            <tr>
                <th>Ch. No. </th>
                <th>Title </th>
                <th>Addedon</th>
                <th>&nbsp;</th>
            </tr>
            <%
            String tid = request.getParameter("tid");
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from chapters where tid = ?");
            ps.setString(1,tid);
            ResultSet rs = ps.executeQuery();
            while ( rs.next()) {
            %>                
            <tr>
                <td><%=rs.getString("cno") %> </td>
                <td><%=rs.getString("title") %> </td>
                <td><%=rs.getString("addedon") %> </td>
                <td>
                    <a href=chapters/<%=tid%>-<%=rs.getString("cno")%>.pdf>Download</a>
               </td>
            </tr>
           <%
            } 
            rs.close();
            DBUtil.close(ps);
            DBUtil.close(con);
           %>
        </table>

    </body>
</html>

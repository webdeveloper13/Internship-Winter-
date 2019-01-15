<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="java.sql.*,ebook.*"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Titles</title>
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>
        <h2>My Titles </h2>
        <table  border=1 cellspacing=2>
            <tr>
                <th>Subject</th>
                <th>Title </th>
                <th>Added On </th>
                <th>&nbsp;</th>
            </tr>
            <%
            Author a = (Author) session.getAttribute("author");
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement("select tid,sname,title, to_char(addedon,'dd-mm-yy') addedon from  titles t, subjects s where t.scode = s.scode and t.aid = ?");
            ps.setString(1, a.getAid());
            ResultSet rs = ps.executeQuery();
            while ( rs.next()) {
            %>                
            <tr>
                <td><%=rs.getString("sname") %> </td>
                <td><%=rs.getString("title") %> </td>
                <td><%=rs.getString("addedon") %> </td>
                <td>
                    <a href=chapters.jsp?tid=<%=rs.getString("tid")%>>Chapters</a> 
                    <a href=deletetitle.jsp?tid=<%=rs.getString("tid")%>>Delete</a> 
                </td>
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

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="java.sql.*,ebook.*"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Titles Of A Subject </title>
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>
    <h2>Titles of Subject </h1>
    <p/>
           <table  border=1 cellspacing=2  width="100%">
            <tr>
                <th>Title </th>
                <th>Added On </th>
                <th>Author</th>
                <th>&nbsp;</th>
            </tr>
            <%
            String scode = request.getParameter("scode");
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement("select tid,aname,title, to_char(addedon,'dd-mm-yy') addedon from  titles t, authors a where t.aid = a.aid and scode = ?");
            ps.setString(1,scode);
            ResultSet rs = ps.executeQuery();
            while ( rs.next()) {
            %>                
            <tr>
                <td><%=rs.getString("title") %> </td>
                <td><%=rs.getString("addedon") %> </td>
                <td><%=rs.getString("aname") %> </td>
                <td>
                    <a href=titlechapters.jsp?tid=<%=rs.getString("tid")%>>Chapters</a> 
                    &nbsp;
                    <a href=feedback.jsp?tid=<%=rs.getString("tid")%>>Feedback</a> 
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

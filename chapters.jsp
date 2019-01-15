<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="java.sql.*,ebook.*"%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chapters</title>
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>
        <h2>My Titles </h2>
        <table  border=1 cellspacing=2  width="100%">
            <tr>
                <th>Ch. NO.</th>
                <th>Title</th>
                <th>AddedOn </th>
                <th>&nbsp;</th>
            </tr>
            <%
            String tid = request.getParameter("tid");
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement("select  * from chapters where tid = ?");
            ps.setString(1, tid);
            ResultSet rs = ps.executeQuery();
            while ( rs.next()) {
            %>                
            <tr>
                <td><%=rs.getString("cno") %> </td>
                <td><%=rs.getString("title") %> </td>
                <td><%=rs.getString("addedon") %> </td>
                <td>
                    <a href=deletechapter.jsp?tid=<%=tid%>&cno=<%=rs.getString("cno")%>>Delete</a>
                </td>
            </tr>
           <%
            } // while
            rs.close();
            DBUtil.close(ps);
            DBUtil.close(con);
           %>
        </table>
        
        <h4>Add New Chapter </h4>
        <form action=addchapter.jsp method=post  enctype="multipart/form-data">
        <table>
        <tr>
            <td>Title</td>
            <td>
                <input type=hidden size=10 name=tid value="${param.tid}">
                <input type=text size=30 name=title>
            </td>
        </tr>
        <tr>
            <td>
            Select File 
            </td>
            <td>
                <input type="file" name="file1">
            </td>
        </tr>
        </table>                
        <p>
        <input type=submit value="Add Chapter">
      </form>
    </body>
</html>

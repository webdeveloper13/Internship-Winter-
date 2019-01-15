<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ebook.*" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Titles</title>
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>
    <h2>Search Titles</h2>
        <form action="search.jsp" method="post">
            <table>
                <tr>
                    <td>Title
                    <td><input type=text size=20 name=title value="${param.title}">
                </tr>
                
                <tr>
                    <td>Author
                    <td><input type=text size=20 name=author  value="${param.author}">
                </tr>
                
                <tr>
                    <td>Added Date
                    <td><input type=text size=10 name=fromdate  value="${param.fromdate}"> (dd-mon-yy)
                    To  <input type=text size=10 name=todate  value="${param.todate}"> (dd-mon-yy)
                </tr>
            </table>
            <p/>
            <input type=submit value="Search">
            <a href="index.jsp">Home Page</a>
        </form>   
        <%
         
         String title = request.getParameter("title");
         if ( title == null)
             return;
             
         String author = request.getParameter("author");
         String fromdate = request.getParameter("fromdate");
         String todate = request.getParameter("todate");
         
         String query = "select  tid,title,aname,to_char(addedon,'dd-mm-yy') addedon, sname from titles t, subjects s, authors a where t.aid = a.aid and t.scode = s.scode ";
         
         if ( title.length() > 0 )
         query += " and title like '%" + title + "%'";
         if ( author.length() > 0 )
         query += " and aname like '%" + author + "%'";
         
         if ( fromdate.length() > 0 )
         query += " and addedon >= '" + fromdate + "'";
         
         if ( todate.length() > 0 )
         query += "and  addedon <= '" + todate + "'";
        %>
        <table  border=1 cellspacing=2  width="100%">
            <tr>
                <th>Subject</th>
                <th>Title </th>
                <th>Author </th>
                <th>Added On </th>
                <th>&nbsp;</th>
            </tr>
            <%
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while ( rs.next()) {
            %>                
            <tr>
                <td><%=rs.getString("sname") %> </td>
                <td><%=rs.getString("title") %> </td>
                <td><%=rs.getString("aname") %> </td>
                <td><%=rs.getString("addedon") %> </td>
                <td>
                    <a href=titlechapters.jsp?tid=<%=rs.getString("tid")%>>Chapters</a> 
                    <a href=feedback.jsp?tid=<%=rs.getString("tid")%>>Feedback</a> 
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



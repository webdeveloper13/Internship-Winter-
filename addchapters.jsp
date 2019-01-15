<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="java.sql.*,ebook.*,org.apache.commons.fileupload.servlet.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.*,java.util.*,java.io.*"%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Chapter</title>
        <link href="styles.css" rel="stylesheet" />
    </head>
    <body>
        <h4>
            <%
            DiskFileUpload upload = new DiskFileUpload();
           
            List items = upload.parseRequest(request);
            
            String tid = ((FileItem) items.get(0)).getString();
            String title = ((FileItem) items.get(1)).getString();
            
           
            FileItem  file = (FileItem) items.get(2);
            
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement("select  nvl(max(cno),0) + 1 from chapters where tid = ?");
            ps.setString(1, tid);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String chno = rs.getString(1);
            rs.close();
            
            File outfile = new File(application.getRealPath("/chapters") + "/" +  tid + "-" + chno +  ".pdf");
            file.write(outfile); 
            
           
            
            ps = con.prepareStatement("insert into chapters values(?,?,?,sysdate)");
            ps.setString(1,tid);
            ps.setString(2,chno);
            ps.setString(3, title);
            ps.executeUpdate();
            ps.close();
            con.close();
            
            out.println("Chapter Added Successfully");
            
            %>
        </h4>
    </body>
</html>

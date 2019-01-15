package ebook;

import java.io.IOException;
import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import java.sql.*;

public class SubjectsTable extends SimpleTagSupport {

   
    public void doTag() throws JspException {
        JspWriter out=getJspContext().getOut();
        Connection con =null;
        PreparedStatement ps =null;
        try {
            con = DBUtil.getConnection();
            ps = con.prepareStatement("select  s.scode, sname, count(*) notitles from subjects s, titles t where s.scode = t.scode group by s.scode,sname");
            ResultSet rs = ps.executeQuery();
            out.println("<table border=1 cellspacing=5><tr><th>Subject Name <th>No. Titles <th>&nbsp</tr>");
            while ( rs.next()) {
                out.println("<tr><td>" + rs.getString("sname") + "<td>" + rs.getString("notitles") + "<td><a href=titles.jsp?scode=" + rs.getString("scode") + ">Titles</a></tr>");
            }
            out.println("</table>");
            rs.close();
        } catch(IOException ex) {
            System.out.println(ex.getMessage());
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            DBUtil.close(ps);
            DBUtil.close(con);
       }
    } 
 } 


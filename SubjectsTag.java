
package ebook;
import java.sql.*;

import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;

public class SubjectsTag extends SimpleTagSupport {
    
    public void doTag() throws JspException {
        JspWriter out=getJspContext().getOut();
        Connection con =null;
        PreparedStatement ps =null;
        try {
            con = DBUtil.getConnection();
            ps = con.prepareStatement("select scode,sname from subjects order by sname");
            ResultSet rs = ps.executeQuery();
            out.println("<select name=scode>");
            while ( rs.next()) {
                out.println("<option value=" + rs.getString("scode") + ">" +  rs.getString("sname") + "</option>");
            }
            out.println("</select>");
            rs.close();
        } catch(Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            DBUtil.close(ps);
            DBUtil.close(con);
       }
    } 
}

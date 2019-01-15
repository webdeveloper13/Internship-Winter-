package ebook;
import java.sql.*;
public class TitleUtil {
    
  public static String addTitle(String aid, String scode, String title) {
        Connection con =null;
        PreparedStatement ps =null;
        try
        {
            con = DBUtil.getConnection();
            ps = con.prepareStatement("select nvl(max(tid),0) + 1 from titles");
            ResultSet rs = ps.executeQuery();
            rs.next();
            String tid = rs.getString(1);
            rs.close();
            ps = con.prepareStatement("insert into titles values (?,?,?,sysdate,?)");
            ps.setString(1,tid);
            ps.setString(2,aid);
            ps.setString(3,title);
            ps.setString(4,scode);
            if ( ps.executeUpdate() == 1)            
              return null;
            else
                return "Title could not be added";
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return ex.getMessage();
        }
        finally
        {
            DBUtil.close(ps);
            DBUtil.close(con);
       }
    
  }
  
  
  
  public static String deleteTitle(String tid) {
        Connection con =null;
        CallableStatement cs =null;
        try
        {
            con = DBUtil.getConnection();
            cs = con.prepareCall("{ call deletetitle(?) }");
            cs.setString(1,tid);
            cs.execute();
            return null;
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return ex.getMessage();
        }
        finally
        {
            DBUtil.close(cs);
            DBUtil.close(con);
       }
  } 
    
}

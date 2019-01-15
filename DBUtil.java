
package ebook;
import java.sql.*;
public class DBUtil {
    public static Connection getConnection()
    {
      try
      {
          Class.forName("oracle.jdbc.driver.OracleDriver");
          Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ebook","ebook");
          return con;
      }
      catch(ClassNotFoundException ex)
      {
          System.out.println(ex.getMessage());
          return null;
      } catch (Exception ex) {
          System.out.println(ex.getMessage());
          return null;
        }
   }
    
   public static void close(Connection con)
   {
       try
       {
           con.close();
       }
       catch(Exception ex) {}
   }
   
   public static void close(Statement st)
   {
       try
       {
           st.close();
       }
       catch(Exception ex) {}
   }    

    
}

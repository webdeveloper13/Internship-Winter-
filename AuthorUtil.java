
package ebook;

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.mail.*;
import javax.activation.*;
import javax.mail.internet.*;

public class AuthorUtil {
    public static Author login(String email,String pwd)
    {
        Connection con =null;
        PreparedStatement ps =null;
        try
        {
            con = DBUtil.getConnection();
            ps = con.prepareStatement("select aid,aname from authors where email=? and pwd = ?");
            ps.setString(1,email);
            ps.setString(2,pwd);
            ResultSet rs = ps.executeQuery();
            if ( rs.next()) { 
                Author a = new Author();
                a.setAid( rs.getString("aid"));
                a.setAname(rs.getString("aname"));
                a.setEmail(email);
                return a;
            }                 
            else
                return null;
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return null;
        }
        finally
        {
            DBUtil.close(ps);
            DBUtil.close(con);
       }
    } 
 
  public static String getHintQuestion(String email) {
        Connection con =null;
        PreparedStatement ps =null;
        try
        {
            con = DBUtil.getConnection();
            ps = con.prepareStatement("select  hintq from authors where email = ?");
            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();
            if ( rs.next()) { 
               return rs.getString(1);
            }                 
            else
                return null;
           }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return null;
        }
        finally
        {
            DBUtil.close(ps);
            DBUtil.close(con);
       }
   } 
 

   
}  

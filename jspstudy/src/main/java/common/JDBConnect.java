package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;



public class JDBConnect {
   public Connection con;
   public Statement stmt;
   public PreparedStatement psmt;
   public ResultSet rs;
   
   public JDBConnect() {
      try {
         Class.forName("oracle.jdbc.OracleDriver");
         String url="jdbc:oracle:thin:@localhost:1521:xe";
         String id="kim";
         String pw="1234";
         con=DriverManager.getConnection(url,id,pw);
         System.out.println("디비 연결(기본)");
      }catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   public JDBConnect(String driver, String url,String id,String pw) {
      try {
         Class.forName(driver);
         con=DriverManager.getConnection(url,id,pw);
         System.out.println("디비 연결(기본)");
      }catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   public JDBConnect(ServletContext application) {
      try {
         String driver=application.getInitParameter("OracleDriver");
         String url=application.getInitParameter("OracleUrl");
         String id=application.getInitParameter("OracleId");
         String pw=application.getInitParameter("OraclePw");
         
         Class.forName(driver);
         con=DriverManager.getConnection(url,id,pw);
         System.out.println("디비 연결(기본)");
      }catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   
   public void close() {
       try {
          if (con != null)con.close();
          if (rs!=null)rs.close();
          if (con != null)con.close();
          if(psmt!=null)psmt.close();
          System.out.println("데이터베이스 연결해제");
          
          }catch(SQLException e) {
        	  e.printStackTrace();
          }
   }
}
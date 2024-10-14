package database;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;

 public class DBConnect {
     public static Connection connectDB() {

         //SQLite 데이터베이스 파일 위치
        //  String dbFilePath = "C:/pj/workspace/PublicWifiLocator/src/wifiInfo.db";
         String url = "jdbc:mariadb://localhost:3306/zerobasesbj";
         String dbid = "zerobasesbj";
         String dbpw = "zerobase";

         Connection connection = null;

         try {
             Class.forName("org.mariadb.jdbc.Driver");  //JDBC 드라이버 로드
             connection = DriverManager.getConnection(url, dbid, dbpw);
         } catch (ClassNotFoundException | SQLException e) {
             e.printStackTrace();
         }

        return connection;
     }

     public static void close(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) {

         try {
             if (resultSet != null && ! resultSet.isClosed()) {
                 resultSet.close();
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }

         try {
             if (preparedStatement != null && ! preparedStatement.isClosed()) {
                 preparedStatement.close();
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }

         try {
             if (connection != null && ! connection.isClosed()) {
                 connection.close();
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }
     }
     
     // 테이블이 존재하는지 확인하는 메서드
     public static boolean checkTableExists(Connection connection, String tableName) {
         boolean exists = false;
         try (PreparedStatement stmt = connection.prepareStatement(
                 "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'zerobasesbj' AND table_name = ?")) {
             stmt.setString(1, tableName);
             try (ResultSet rs = stmt.executeQuery()) {
                 if (rs.next()) {
                     exists = rs.getInt(1) > 0;
                 }
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }
         return exists;
     }

     // 파일에서 SQL을 읽어와 실행하는 메서드
     public static void executeSqlFromFile(Connection connection, String filePath) {
         StringBuilder sql = new StringBuilder();
         try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
             String line;
             while ((line = reader.readLine()) != null) {
                 sql.append(line);
             }
             try (Statement stmt = connection.createStatement()) {
                 stmt.execute(sql.toString());
                 System.out.println("테이블이 성공적으로 생성되었습니다.");
             }
         } catch (IOException | SQLException e) {
             e.printStackTrace();
         }
     }
}

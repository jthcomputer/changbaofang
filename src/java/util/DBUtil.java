package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    public  Connection getConnection(){//得到数据库连接
        Connection conn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://47.95.141.31:3306/hotel?useUnicode=true&characterEncoding=utf8", "root", "root");
            System.out.print("判断成功建立连接"+conn);
            return conn;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }


}

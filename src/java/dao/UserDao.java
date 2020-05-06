package dao;

import entity.User;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    DBUtil util = new DBUtil();

    public boolean checkUser(String userid, String password) {
        String sql = "select * from hotel.user where user_id=? and user_password=?";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1,userid);
            pstmt.setString(2,password);
            ResultSet rs =pstmt.executeQuery();
            if(rs.next()){
                connection.close();

                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    public User getUser(String userid) {
        User user = new User();
        String sql = "select * from hotel.user where user_id=?";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt =connection.prepareStatement(sql);
            pstmt.setString(1,userid);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next())
            {
                user.setUserid(rs.getString(1));
                user.setUsername(rs.getString(2));
                user.setpassword(rs.getString(3));
                user.setUsertype(rs.getString(4));
            }
            connection.close();;
            return  user;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addUser(String userid, String username, String password, String usertype) {

        String sql = "insert into hotel.user (user_id,user_name,user_password,user_type) VALUES(?,?,?,?)";
        Connection connection=util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1,userid);
            pstmt.setString(2,username);
            pstmt.setString(3,password);
            pstmt.setString(4,usertype);

            if (pstmt.executeUpdate()>0)
            {
                connection.close();
                return true;
            }


            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateUser(String userid, String username, String password, String userphone, String useridcard) {
        String sql = "update hotel.user set user_name=?,user_password=?,user_phone=?,user_idcard=? where user_id=?";
        Connection connection=util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1,userid);
            pstmt.setString(2,username);
            pstmt.setString(3,password);
            pstmt.setString(4,userphone);
            pstmt.setString(5,useridcard);
            if (pstmt.executeUpdate()>0)
            {
                connection.close();
                return true;
            }


            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }
}

package dao;


import entity.SellOrder;
import entity.Sell;
import entity.User;
import util.DBUtil;

import javax.xml.crypto.Data;
import java.sql.*;
import java.util.ArrayList;

public class SellOrderDao {
    DBUtil util = new DBUtil();

    public ArrayList<SellOrder> getAllSellOrder() {
        ArrayList<SellOrder> sellorderArrayList = new ArrayList<>();
        String sql = "select * from hotel.sellorder ";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt =connection.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                SellOrder sellorder= new SellOrder();
                sellorder.setSellOrder_id(rs.getInt(1));
                sellorder.setSellOrder_userid(rs.getString(2));
                sellorder.setSellOrder_sellid(rs.getString(3));

                sellorder.setSellOrder_status(rs.getString(4));

                sellorder.setSellOrder_price(rs.getInt(5));

                sellorderArrayList.add(sellorder);
            }
            connection.close();
            return sellorderArrayList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addSellOrder(int sellorder_id,String sellorder_userid, String sellorder_sellid,String sellorder_status,int sellorder_price) {
        String sql = "insert into hotel.sellorder (sellorder_id,sellorder_userid,sellorder_sellid,sellorder_status,sellorder_price) VALUES(?,?,?,?,?)";
        Connection connection =util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,sellorder_id);
            pstmt.setString(2,sellorder_userid);
            pstmt.setString(3,sellorder_sellid);
            pstmt.setString(4,sellorder_status);
            pstmt.setInt(5,sellorder_price);


            if(pstmt.executeUpdate()>0){
                connection.close();

                return true;
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    public boolean deleteSellOrder(int sellorder_id) {
        String sql="delete from hotel.sellorder where sellorder_id=?";
        Connection connection = util.getConnection();
        try{
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,sellorder_id);
            if(pstmt.executeUpdate()>0){
                connection.close();

                return true;
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public boolean updateSellOrder_status(int sellorder_id, String sellorder_status) {
        String sql ="update hotel.sellorder set sellorder_status=? where sellorder_id=?";
        Connection connection =util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1,sellorder_status);
            pstmt.setInt(2,sellorder_id);

            if(pstmt.executeUpdate()>0){
                connection.close();

                return true;
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public SellOrder getSellOrder(int sellorder_id) {
        SellOrder sellorder = new SellOrder();
        String sql = "select * from hotel.sellorder where sellorder_id=?";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt =connection.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(sellorder_id));

            ResultSet rs = pstmt.executeQuery();
            while (rs.next())
            {
                sellorder.setSellOrder_id(rs.getInt(1));
                sellorder.setSellOrder_userid(rs.getString(2));
                sellorder.setSellOrder_sellid(rs.getString(3));

                sellorder.setSellOrder_status(rs.getString(4));

                sellorder.setSellOrder_price(rs.getInt(5));
            }
            connection.close();;
            return  sellorder;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean updateSellOrder_price(int sellorder_id, int sellorder_price) {
        String sql ="update hotel.sellorder set sellorder_price=? where sellorder_id=?";
        Connection connection =util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setInt(1,sellorder_price);
            pstmt.setInt(2,sellorder_id);

            if(pstmt.executeUpdate()>0){
                connection.close();

                return true;
            }

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public SellOrder getUserSellOrder(String sellorder_userid) {
        SellOrder sellorder1 = new SellOrder();
        String sql = "select * from hotel.sellorder where sellorder_userid=?";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt =connection.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(sellorder_userid));

            ResultSet rs = pstmt.executeQuery();
            while (rs.next())
            {
                sellorder1.setSellOrder_id(rs.getInt(1));
                sellorder1.setSellOrder_userid(rs.getString(2));
                sellorder1.setSellOrder_sellid(rs.getString(3));

                sellorder1.setSellOrder_status(rs.getString(4));

                sellorder1.setSellOrder_price(rs.getInt(5));
            }
            connection.close();;
            return  sellorder1;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
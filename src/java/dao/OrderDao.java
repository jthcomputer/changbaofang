package dao;


import entity.Order;
import entity.Hotel;
import entity.User;
import util.DBUtil;

import javax.xml.crypto.Data;
import java.sql.*;
import java.util.ArrayList;

public class OrderDao {
    DBUtil util = new DBUtil();

    public ArrayList<Order> getAllOrder() {
        ArrayList<Order> orderArrayList = new ArrayList<>();
        String sql = "select * from hotel.order ";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt =connection.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Order order= new Order();
                order.setOrder_id(rs.getInt(1));
                order.setOrder_userid(rs.getString(2));
                order.setOrder_hotelid(rs.getString(3));
                Timestamp check=rs.getTimestamp(4);
                order.setOrder_checktime((Data) check);
                Timestamp leave=rs.getTimestamp(5);
                order.setOrder_leavetime((Data) leave);
                order.setOrder_status(rs.getString(6));
                order.setOrder_evaluate(rs.getString(7));
                order.setOrder_price(rs.getInt(8));

                orderArrayList.add(order);
            }
            connection.close();
            return orderArrayList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addOrder(int order_id,String order_userid, String order_hotelid, String order_checktime, String order_leavetime, String order_status, String order_evaluate, int order_price) {
        String sql = "insert into hotel.order (order_id,order_userid,order_hotelid,order_checktime,order_leavetime,order_status,order_evaluate,order_price) VALUES(?,?,?,?,?,?,?,?)";
        Connection connection =util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,order_id);
            pstmt.setString(2,order_userid);
            pstmt.setString(3,order_hotelid);
            pstmt.setString(4,order_checktime);
            pstmt.setString(5,order_leavetime);
            pstmt.setString(6,order_status);
            pstmt.setString(7,order_evaluate);
            pstmt.setInt(8,order_price);


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

    public boolean deleteOrder(int order_id) {
        String sql="delete from hotel.order where order_id=?";
        Connection connection = util.getConnection();
        try{
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,order_id);
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

    public boolean addOrder_evaluate(int order_id,String order_userid, String order_hotelid, String order_checktime, String order_leavetime, String order_status, String order_evaluate, int order_price) {
        String sql="update hotel.order set order_userid=?,order_hotelid=?,order_checktime=?,order_leavetime=?,order_status=?,order_evaluate=?,order_price=? where order_id=?";
        Connection connection =util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1,order_userid);
            pstmt.setString(2,order_hotelid);
            pstmt.setString(3,order_checktime);
            pstmt.setString(4,order_leavetime);
            pstmt.setString(5,order_status);
            pstmt.setString(6,order_evaluate);
            pstmt.setInt(7,order_price);

            pstmt.setInt(8,order_id);


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

    public boolean updateOrder_status(int order_id, String order_status) {
        String sql ="update hotel.order set order_status=? where order_id=?";
        Connection connection =util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1,order_status);
            pstmt.setInt(2,order_id);

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

    public Order getOrder(int order_id) {
        Order order = new Order();
        String sql = "select * from hotel.order where order_id=?";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt =connection.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(order_id));

            ResultSet rs = pstmt.executeQuery();
            while (rs.next())
            {
                order.setOrder_id(rs.getInt(1));
                order.setOrder_userid(rs.getString(2));
                order.setOrder_hotelid(rs.getString(3));
                Timestamp check=rs.getTimestamp(4);
                order.setOrder_checktime((Data) check);
                Timestamp leave=rs.getTimestamp(5);
                order.setOrder_leavetime((Data) leave);
                order.setOrder_status(rs.getString(6));
                order.setOrder_evaluate(rs.getString(7));
                order.setOrder_price(rs.getInt(8));
            }
            connection.close();;
            return  order;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean updateOrder_price(int order_id, int order_price) {
        String sql ="update hotel.order set order_price=? where order_id=?";
        Connection connection =util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setInt(1,order_price);
            pstmt.setInt(2,order_id);

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
    public Order getUserOrder(String order_userid) {
        Order order1 = new Order();
        String sql = "select * from hotel.order where order_userid=?";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt =connection.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(order_userid));

            ResultSet rs = pstmt.executeQuery();
            while (rs.next())
            {
                order1.setOrder_id(rs.getInt(1));
                order1.setOrder_userid(rs.getString(2));
                order1.setOrder_hotelid(rs.getString(3));
                Timestamp check=rs.getTimestamp(4);
                order1.setOrder_checktime((Data) check);
                Timestamp leave=rs.getTimestamp(5);
                order1.setOrder_leavetime((Data) leave);
                order1.setOrder_status(rs.getString(6));
                order1.setOrder_evaluate(rs.getString(7));
                order1.setOrder_price(rs.getInt(8));
            }
            connection.close();;
            return  order1;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}

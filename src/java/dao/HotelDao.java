package dao;

import entity.Hotel;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class HotelDao {
    DBUtil util = new DBUtil();


    public ArrayList<Hotel> getAllHotel(){
        ArrayList<Hotel> hotelArrayList = new ArrayList<>();
        String sql = "select * from hotel.hotel ";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt =connection.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next())
            {
                Hotel hotel=new Hotel();
                hotel.setHotelid(rs.getInt(1));
                hotel.setHotelname(rs.getString(2));
                hotel.setHotelcity(rs.getString(3));
                hotel.setHoteltype(rs.getString(4));
                hotel.setHotelstar(rs.getString(5));
                hotel.setHotelstatus(rs.getString(6));
                hotel.setHotellocal(rs.getString(7));
                hotel.setHotelindex(rs.getString(8));
                hotel.setHotelcall(rs.getString(9));
                hotel.setHotelroomnum(rs.getInt(10));
                hotel.setHotelprice(rs.getInt(11));
                hotel.setHotelpic(rs.getString(12));
                hotelArrayList.add(hotel);
            }
            connection.close();;
            return  hotelArrayList;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Hotel getOneHotel(int hotelid){
        Hotel hotel = new Hotel();
        String sql = "select * from hotel.hotel where hotel_id=?";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt =connection.prepareStatement(sql);
            pstmt.setInt(1,hotelid);
            ResultSet rs= pstmt.executeQuery();
            while (rs.next())
            {
                hotel.setHotelid(rs.getInt(1));
                hotel.setHotelname(rs.getString(2));
                hotel.setHotelcity(rs.getString(3));
                hotel.setHoteltype(rs.getString(4));
                hotel.setHotelstar(rs.getString(5));
                hotel.setHotelstatus(rs.getString(6));
                hotel.setHotellocal(rs.getString(7));
                hotel.setHotelindex(rs.getString(8));
                hotel.setHotelcall(rs.getString(9));
                hotel.setHotelroomnum(rs.getInt(10));
                hotel.setHotelprice(rs.getInt(11));
                hotel.setHotelpic(rs.getString(12));
            }
            connection.close();;
            return  hotel;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }





    public boolean deleteHotel(int hotelid){

        String sql="delete from hotel.hotel where hotel_id=?";
        Connection connection = util.getConnection();
        try{
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,hotelid);
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

    public boolean addHotel(int hotelid,String hotelname,String hotelcity,String hoteltype,
                            String hotelstar,String hotelstatus,String hotellocal,String hotelindex,
                            String hotelcall,int hotelroomnum,int hotelprice){
        String sql = "insert into hotel.hotel (hotel_id,hotel_name,hotel_city,hotel_type,hotel_star,hotel_status,hotel_local,hotel_index,hotel_call,hotel_roomnum,hotel_price) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        Connection connection =util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,hotelid);
            pstmt.setString(2,hotelname);
            pstmt.setString(3,hotelcity);
            pstmt.setString(4,hoteltype);
            pstmt.setString(5,hotelstar);
            pstmt.setString(6,hotelstatus);
            pstmt.setString(7,hotellocal);
            pstmt.setString(8,hotelindex);
            pstmt.setString(9,hotelcall);
            pstmt.setInt(10,hotelroomnum);
            pstmt.setInt(11,hotelprice);

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

    public boolean updateHotel(int hotelid,String hotelname,String hotelcity,String hoteltype,String hotelstar,String hotellocal,String hotelindex,String hotelcall,int hotelroomnum,int hotelprice){
        String sql = "update hotel.hotel set hotel_name=?,hotel_city=?,hotel_type=?,hotel_star=?,hotel_local=?,hotel_index=?,hotel_call=? hotel_roomnum=?,hotel_price=? where hotel_id=? ";
        Connection connection =util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1,hotelname);
            pstmt.setString(2,hotelcity);
            pstmt.setString(3,hoteltype);
            pstmt.setString(4,hotelstar);
            pstmt.setString(5,hotellocal);
            pstmt.setString(6,hotelindex);
            pstmt.setString(7,hotelcall);
            pstmt.setInt(8,hotelroomnum);
            pstmt.setInt(9,hotelprice);

            pstmt.setInt(10,hotelid);
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
}

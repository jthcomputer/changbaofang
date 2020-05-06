package dao;

import entity.Sell;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SellDao {
    DBUtil util = new DBUtil();


    public ArrayList<Sell> getAllSell(){
        ArrayList<Sell> hotelArrayList = new ArrayList<>();
        String sql = "select * from hotel.Sell ";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt =connection.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next())
            {
                Sell Sell=new Sell();
                Sell.setSellid(rs.getInt(1));
                Sell.setSellname(rs.getString(2));
                Sell.setSellcity(rs.getString(3));
                Sell.setSellstatus(rs.getString(4));
                Sell.setSellindex(rs.getString(5));
                Sell.setSellcall(rs.getString(6));
                Sell.setSellroomnum(rs.getInt(7));
                Sell.setSellprice(rs.getInt(8));
                Sell.setSellpic(rs.getString(9));
                hotelArrayList.add(Sell);
            }
            connection.close();;
            return  hotelArrayList;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Sell getOneSell(int Sellid){
        Sell Sell = new Sell();
        String sql = "select * from hotel.Sell where Sell_id=?";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt =connection.prepareStatement(sql);
            pstmt.setInt(1,Sellid);
            ResultSet rs= pstmt.executeQuery();
            while (rs.next())
            {
                Sell.setSellid(rs.getInt(1));
                Sell.setSellname(rs.getString(2));
                Sell.setSellcity(rs.getString(3));
                Sell.setSellstatus(rs.getString(4));
                Sell.setSellindex(rs.getString(5));
                Sell.setSellcall(rs.getString(6));
                Sell.setSellroomnum(rs.getInt(7));
                Sell.setSellprice(rs.getInt(8));
                Sell.setSellpic(rs.getString(9));
            }
            connection.close();;
            return  Sell;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }





    public boolean deleteSell(int Sellid){

        String sql="delete from hotel.Sell where Sell_id=?";
        Connection connection = util.getConnection();
        try{
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,Sellid);
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

    public boolean addSell(int Sellid,String Sellname,String Sellcity,String Sellstatus,String Sellindex,
                            String Sellcall,int Sellroomnum,int Sellprice){
        String sql = "insert into hotel.Sell (Sell_id,Sell_name,Sell_city,Sell_status,Sell_index,Sell_call,Sell_roomnum,Sell_price) VALUES(?,?,?,?,?,?,?,?)";
        Connection connection =util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,Sellid);
            pstmt.setString(2,Sellname);
            pstmt.setString(3,Sellcity);
            pstmt.setString(4,Sellstatus);
            pstmt.setString(5,Sellindex);
            pstmt.setString(6,Sellcall);
            pstmt.setInt(7,Sellroomnum);
            pstmt.setInt(8,Sellprice);

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

    public boolean updateSell(int Sellid,String Sellname,String Sellcity,String Selllocal,String Sellindex,String Sellcall,int Sellroomnum,int Sellprice){
        String sql = "update hotel.Sell set Sell_name=?,Sell_city=?,Sell_local=?,Sell_index=?,Sell_call=? Sell_roomnum=?,Sell_price=? where Sell_id=? ";
        Connection connection =util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);

            pstmt.setString(1,Sellname);
            pstmt.setString(2,Sellcity);
            pstmt.setString(3,Selllocal);
            pstmt.setString(4,Sellindex);
            pstmt.setString(5,Sellcall);
            pstmt.setInt(6,Sellroomnum);
            pstmt.setInt(7,Sellprice);
            pstmt.setInt(8,Sellid);
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

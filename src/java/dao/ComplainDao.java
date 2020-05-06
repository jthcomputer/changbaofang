package dao;

import entity.Complain;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ComplainDao {
    DBUtil util = new DBUtil();

    public ArrayList<Complain> getAllComplain(){
        ArrayList<Complain> complainArrayList = new ArrayList<>();
        String sql = "select * from hotel.complain ";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt =connection.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                Complain complain= new Complain();
                complain.setComplainid(rs.getInt(1));
                complain.setComplainhotelid(rs.getInt(2));
                complain.setComplainuserid(rs.getString(3));
                complain.setComplaintitle(rs.getString(4));
                complain.setComplaincontent(rs.getString(5));
                complain.setComplainreply(rs.getString(6));
                complain.setComplainstatus(rs.getString(7));
                complainArrayList.add(complain);
            }
            connection.close();
            return complainArrayList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Complain getOneComplain(int complainid){
        Complain complain = new Complain();
        String sql = "select * from hotel.complain where complain_id=?";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt =connection.prepareStatement(sql);
            pstmt.setInt(1,complainid);
            ResultSet rs= pstmt.executeQuery();
            while (rs.next()){
                complain.setComplainid(rs.getInt(1));
                complain.setComplainhotelid(rs.getInt(2));
                complain.setComplainuserid(rs.getString(3));
                complain.setComplaintitle(rs.getString(4));
                complain.setComplaincontent(rs.getString(5));
                complain.setComplainreply(rs.getString(6));
                complain.setComplainstatus(rs.getString(7));
            }
            connection.close();;
            return  complain;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean deleteComplain(int complainid){
        String sql="delete from hotel.complain where complain_id=?";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,complainid);
            if(pstmt.executeUpdate()>0){
                connection.close();

                return true;
            }

            connection.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateComplainStatus(int complainid,String complainstatus){
        String sql="update from hotel.complain set complain_status=? where complain_id=?";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1,complainstatus);
            pstmt.setInt(2,complainid);
            if(pstmt.executeUpdate()>0){
                connection.close();

                return true;
            }

            connection.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addComplainReply(int complainid,String complainreply){
        String sql="update from hotel.complain set complain_reply=? where complain_id=?";
        Connection connection = util.getConnection();
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1,complainreply);
            pstmt.setInt(2,complainid);
            if(pstmt.executeUpdate()>0){
                connection.close();

                return true;
            }

            connection.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

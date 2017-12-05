package db.dao;

import db.PoolManager;
import db.dto.Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {
    PoolManager manager = PoolManager.getInstance();

    public List selectAll(){
        ArrayList list = new ArrayList();
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sql = "select * from room order by room_no desc";

        con = manager.getConnection();
        try {
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Room dto = new Room();
                dto.setRoom_num(rs.getInt("room_no"));
                dto.setTitle(rs.getString("title"));
                dto.setOwner(rs.getString("owner"));
                dto.setPassword(rs.getString("password"));
                dto.setMember(rs.getInt("member"));
                dto.setDate(rs.getString("date"));
                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            manager.freeConnection(con,pstmt,rs);
        }
        return list;
    }
    public String newRoom(String title,String owner,String password){
        String roomNO="";
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sql="insert into room(title,owner,password) values(?,?,?)";
        String sql2 = "select last_insert_id() as room_no from room where title=? and owner=?";

        int result=0;
        try {
            con = manager.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, owner);
            pstmt.setString(3, password);

            result = pstmt.executeUpdate();
            if(result==1){
                pstmt = con.prepareStatement(sql2);
                pstmt.setString(1, title);
                pstmt.setString(2,owner);
                rs = pstmt.executeQuery();
                if(rs.next()){
                    roomNO=Integer.toString(rs.getInt("room_no"));
                    System.out.println(" #success room: "+roomNO);
                }
            }else{
                roomNO = Integer.toString(result);
            }


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            manager.freeConnection(con,pstmt);
        }
        return roomNO;
    }

}

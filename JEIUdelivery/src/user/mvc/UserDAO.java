package user.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import user.comm.JdbcConnectUtil;

public class UserDAO {
    private Connection con;

    public UserDAO() {
        con = JdbcConnectUtil.getConnection();
    }

    public UserDTO loginCheck(String userID, String userPW) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        UserDTO user = null;
        try {
            String strQuery = "SELECT * FROM users WHERE id = ? AND pw = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, userID);
            pstmt.setString(2, userPW);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new UserDTO();
                user.setUserID(rs.getString("id"));
                user.setUserPW(rs.getString("pw"));
                user.setUserFname(rs.getString("Fname"));
                user.setUserLname(rs.getString("Lname"));
                
                System.out.println("유저 아이디: " + userID);
            } else {
                // 로그 확인
                System.out.println("User not found: " + userID);
            }
            
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, rs);
        }
        return user;
    }

    public boolean memberInsert(UserDTO mDTO) {
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            String strQuery = "INSERT INTO users (id, pw, Fname, Lname, Tel, Email, Birth, Gender, Major, SchoolNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mDTO.getUserID());
            pstmt.setString(2, mDTO.getUserPW());
            pstmt.setString(3, mDTO.getUserFname());
            pstmt.setString(4, mDTO.getUserLname());
            pstmt.setString(5, mDTO.getUserTel());
            pstmt.setString(6, mDTO.getUserEmail());
            pstmt.setString(7, mDTO.getUserBirth());
            pstmt.setString(8, mDTO.getUserGender());
            pstmt.setString(9, mDTO.getUserMajor());
            pstmt.setString(10, mDTO.getUserSnumber());

            int count = pstmt.executeUpdate();
            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, null);
        }
        return flag;
    }
}

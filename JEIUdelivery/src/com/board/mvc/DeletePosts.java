package com.board.mvc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Timer;
import java.util.TimerTask;

public class DeletePosts {
    public static void main(String[] args) {
        Timer timer = new Timer();
        timer.schedule(new DeletePostsTask(), 0, 60000); // 1분마다 실행
    }
}

class DeletePostsTask extends TimerTask {
    @Override
    public void run() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/boarddb", "root", "1234");
            // 삭제 시간이 지난 글 삭제
            String sql = "DELETE FROM posts WHERE TIMESTAMPDIFF(MINUTE, created_at, NOW()) >= timer";
            pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

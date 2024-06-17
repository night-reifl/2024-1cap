package com.board.controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Timer;
import java.util.TimerTask;

@WebListener
public class DeletePostsListener implements ServletContextListener {

    private Timer timer;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        timer = new Timer();
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/capdb", "root", "1234");

                    String sql = "UPDATE posts SET isExpired = TRUE WHERE timer <= NOW()";
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    
                    int rowsUpdated = pstmt.executeUpdate();
                    System.out.println("Updated " + rowsUpdated + " expired posts.");
                    
                    pstmt.close();
                    conn.close();
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
            }
        }, 0, 60 * 1000); // 1분 실행
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (timer != null) {
            timer.cancel();
        }
    }
}



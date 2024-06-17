package com.store.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import user.comm.JdbcConnectUtil;

public class MenuDAO {

private Connection con;
	
	public MenuDAO() {
		con = JdbcConnectUtil.getConnection();
	}
	
	public List<MenuDTO> getMenu(int storeIndex) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MenuDTO> menus = new ArrayList<>();
        
		try {
			String sql = "SELECT menu, price FROM menus WHERE storeId = ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, storeIndex);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                MenuDTO menu = new MenuDTO();
                menu.setMenu(rs.getString("menu"));
                menu.setPrice(rs.getInt("price"));
                menus.add(menu);
            } 
                // 로그 확인
            
            
        } catch (Exception ex) {
        	System.out.println("Store not found");
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, rs);
        }
		return menus;
		
	}
	
	
}

package com.store.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import user.comm.JdbcConnectUtil;

public class StoreDAO {
private Connection con;
	
	public StoreDAO() {
		con = JdbcConnectUtil.getConnection();
	}
	//가게 데이터 가져오기
	public List<StoreDTO> getStore() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StoreDTO> stores = new ArrayList<>();
        
		try {
			String sql = "SELECT indexNum, Name FROM Store";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                StoreDTO store = new StoreDTO();
                store.setIndexNum(rs.getInt("indexNum"));
                store.setName(rs.getString("Name"));
                stores.add(store);
            } 
                // 로그 확인
            
            
        } catch (Exception ex) {
        	System.out.println("Store not found");
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, rs);
        }
		return stores;
		
	}
	
}

package com.board.mvc;

import java.sql.*;
import user.comm.JdbcConnectUtil;
import java.util.List;
import java.util.ArrayList;


public class PostDAO {
	private Connection con;
	
	public PostDAO() {
		con = JdbcConnectUtil.getConnection();
	}
	
	// 글 쓰기
	public int WritePost(PostDTO pDTO) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
        int indexNum = -1;
        
		try {
			String sql = "INSERT INTO posts (storeName, timer, delivery, bankName, account, delitype, maxPeople,date,id,author,storeIndex,isExpired, payed) VALUES (?,?,?,?,?, ?, ?, ?, ?,?, ?, ?,?)";
			pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, pDTO.getStoreName());
            pstmt.setTime(2, pDTO.getTimer());
            pstmt.setString(3, pDTO.getDelivery());
            pstmt.setString(4, pDTO.getBankName());
            pstmt.setString(5, pDTO.getAccount());
            pstmt.setString(6, pDTO.getDelitype());
            pstmt.setString(7, pDTO.getMaxPeople());
            pstmt.setTimestamp(8, new java.sql.Timestamp(System.currentTimeMillis()));
            pstmt.setString(9, pDTO.getId());
            pstmt.setString(10, pDTO.getName());
            pstmt.setInt(11, pDTO.getStoreIndex());
            pstmt.setBoolean(12, false);
            pstmt.setBoolean(13, false);
            System.out.println("2"+pDTO.getName());

            pstmt.executeUpdate();
            
            rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                indexNum = rs.getInt(1);
            }
            
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, null);
        }
		
		return indexNum;
	}
	
	// 글 읽어오기
	public PostDTO ViewPost(int indexNum) {
		PreparedStatement pstmt = null;
        ResultSet rs = null;
		PostDTO pDTO=null;
		
		try {
			String sql = "SELECT * FROM posts WHERE indexNum = ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, indexNum);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                pDTO = new PostDTO();
                pDTO.setStoreName(rs.getString("storeName"));
                pDTO.setTimer(rs.getTime("timer"));
                pDTO.setDelivery(rs.getString("delivery"));
                pDTO.setBankName(rs.getString("bankName"));
                pDTO.setAccount(rs.getString("account"));
                pDTO.setDelitype(rs.getString("delitype"));
                pDTO.setMaxPeople(rs.getString("maxPeople"));
                pDTO.setDate(rs.getTimestamp("date"));
                pDTO.setId(rs.getString("id"));
                pDTO.setName(rs.getNString("author"));
                pDTO.setStoreIndex(rs.getInt("storeIndex"));
                
                System.out.println(pDTO.getId());
                System.out.println("3"+pDTO.getName());
                
            } else {
                // 로그 확인
                System.out.println("Post not found");
            }
            
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, rs);
        }
		
		return pDTO;
		
		
	}
	
	
	
	
	
	// 글 리스트 읽어오기
	public List<PostDTO> ListPost() {
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<PostDTO> pDTOList = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM posts WHERE isExpired = 0 ORDER BY timer";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                PostDTO pDTO = new PostDTO();
                pDTO.setStoreName(rs.getString("storeName"));
                pDTO.setTimer(rs.getTime("timer"));
                pDTO.setDelivery(rs.getString("delivery"));
                pDTO.setBankName(rs.getString("bankName"));
                pDTO.setAccount(rs.getString("account"));
                pDTO.setDelitype(rs.getString("delitype"));
                pDTO.setMaxPeople(rs.getString("maxPeople"));
                pDTO.setDate(rs.getTimestamp("date"));
                pDTO.setIndexNum(rs.getInt("indexNum"));
                pDTO.setId(rs.getString("id"));
                pDTO.setName(rs.getNString("author"));
                pDTO.setStoreIndex(rs.getInt("storeIndex"));

                pDTOList.add(pDTO);
            }
                
            
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, rs);
        }
		
		return pDTOList;
	}
	
	//글 개수 읽어오기
	public int CountPost() {
		int countPost=0;
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
			String sql = "SELECT COUNT(*) AS count FROM posts WHERE isExpired = 0";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                countPost = rs.getInt("count");
            }
                
            
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, rs);
        }
        
		return countPost;
		
	}
	
	// 글 수정하기
	public void ModifyPost(PostDTO pDTO, int indexNum) {
		PreparedStatement pstmt = null;
		
		
		// 댓글 있으면 삭제하기
		try {
			String sql = "UPDATE posts SET  timer = ?, delivery = ?, bankName = ?, account = ?, delitype = ?, maxPeople = ?, date = ? WHERE `indexNum` = ?";
			pstmt = con.prepareStatement(sql);
            pstmt.setTime(1, pDTO.getTimer());
            pstmt.setString(2, pDTO.getDelivery());
            pstmt.setString(3, pDTO.getBankName());
            pstmt.setString(4, pDTO.getAccount());
            pstmt.setString(5, pDTO.getDelitype());
            pstmt.setString(6, pDTO.getMaxPeople());
            pstmt.setTimestamp(7, new java.sql.Timestamp(System.currentTimeMillis()));
			pstmt.setInt(8, indexNum);
			
			pstmt.executeUpdate();
			
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, null);
        }

		
	}
	
	//글 삭제
	public void DeletePost(int indexNum) {
		PreparedStatement pstmt = null;		
		try {
			String sql = "DELETE FROM posts WHERE indexNum = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, indexNum);
	        pstmt.executeUpdate();
	        
	        // 새로운 PreparedStatement 객체 생성
	        pstmt = con.prepareStatement("DELETE FROM comment WHERE boardIndex = ?");
	        pstmt.setInt(1, indexNum);
	        pstmt.executeUpdate();
	        
		}catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, null);
        }
	}
            
	
    
	
	// is=true중에서 댓글 작성자 있으면 해당하는 메뉴 금액 + 배달비 1/n하고 결제하기
	
	//주문창 만들기
	public List<PostDTO> ViewOrders(String userId) {
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<PostDTO> pDTOList = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM posts WHERE isExpired > 0 AND id = ?  ORDER BY date ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                PostDTO pDTO = new PostDTO();
                pDTO.setStoreName(rs.getString("storeName"));
                pDTO.setTimer(rs.getTime("timer"));
                pDTO.setDelivery(rs.getString("delivery"));
                pDTO.setBankName(rs.getString("bankName"));
                pDTO.setAccount(rs.getString("account"));
                pDTO.setDelitype(rs.getString("delitype"));
                pDTO.setMaxPeople(rs.getString("maxPeople"));
                pDTO.setDate(rs.getTimestamp("date"));
                pDTO.setIndexNum(rs.getInt("indexNum"));
                pDTO.setId(rs.getString("id"));
                pDTO.setName(rs.getNString("author"));
                pDTO.setStoreIndex(rs.getInt("storeIndex"));

                pDTOList.add(pDTO);
            }
                
            
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, rs);
        }
		
		return pDTOList;
	}
		
	
}

package com.board.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import user.comm.JdbcConnectUtil;

public class CommentDAO {
private Connection con;
	
	public CommentDAO() {
		con = JdbcConnectUtil.getConnection();
	}
	// 계산서 가져오기
	public List<CommentDTO> GetComment(String userId) {
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<CommentDTO> cDTOList = new ArrayList<>();
		
		try {
			String sql = "select c.*, p.* from comment c join posts p on c.boardIndex = p.indexNum WHERE c.userId = ? AND c.payed < 1 AND p.isExpired = TRUE ORDER BY c.date ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
            	CommentDTO cDTO = new CommentDTO();
            	cDTO.setDate(rs.getTimestamp("date"));
            	cDTO.setBoardIndex(rs.getInt("boardIndex"));
            	cDTO.setAuthor(rs.getString("author"));
            	cDTO.setUserId(rs.getString("userId"));
            	cDTO.setMenu(rs.getString("menu"));
            	cDTO.setPrice(rs.getInt("price"));
            	cDTO.setStoreName(rs.getString("storeName"));
            	cDTO.setIndex(rs.getInt("indexCom"));

                cDTOList.add(cDTO);
            }
                
            
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, rs);
        }
		return cDTOList;
	}
	
	//댓글 리스트 가져오기
	public List<CommentDTO> ListComment(int boardIndex) {
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<CommentDTO> cDTOList = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM comment WHERE boardIndex = ? ORDER BY date";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, boardIndex);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
            	CommentDTO cDTO = new CommentDTO();
            	cDTO.setDate(rs.getTimestamp("date"));
            	cDTO.setBoardIndex(rs.getInt("boardIndex"));
            	cDTO.setAuthor(rs.getString("author"));
            	cDTO.setUserId(rs.getString("userId"));
            	cDTO.setMenu(rs.getString("menu"));
            	cDTO.setPrice(rs.getInt("price"));

                cDTOList.add(cDTO);
            }
                
            
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, rs);
        }
		
		return cDTOList;
	}
	
	//댓글 저장하기
	public void WriteComment(CommentDTO cDTO) {
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO comment (boardIndex, author, userId, menu, price, date, payed) VALUES (?,?, ?, ?, ?, ?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cDTO.getBoardIndex());
            pstmt.setString(2, cDTO.getAuthor());
            pstmt.setString(3, cDTO.getUserId());
            pstmt.setString(4, cDTO.getMenu());
            pstmt.setInt(5, cDTO.getPrice());
            pstmt.setTimestamp(6, new java.sql.Timestamp(System.currentTimeMillis()));
            pstmt.setBoolean(7, false);
            System.out.println("2"+cDTO);
            pstmt.executeUpdate();
            
            
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, null);
        }
		
		
	}
	
	public void DeleteComment(int indexNum) {
		PreparedStatement pstmt = null;		
		try {
			String sql = "DELETE FROM comment WHERE boardIndex = ?";
			pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, indexNum);
	        pstmt.executeUpdate();
		}catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, null);
        }
	}
	
	public int GetCost(int indexNum, String delivery) {
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        int cost= 0;
		int deli = Integer.parseInt(delivery);

		try {
			String sql = "SELECT SUM(price) as cost FROM comment WHERE boardIndex = ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, indexNum);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                cost = rs.getInt("cost");
               
            } else {
                // 로그 확인
                System.out.println("Post not found");
            }
            
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, rs);
        }
		
		cost += deli;
		return cost;
	}
	
	public int GetPay(int indexNum, String delivery, String userId){
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        int pay= 0;
		int deli = Integer.parseInt(delivery);
		int people =0;

		try {
			String sql = "SELECT price FROM comment WHERE boardIndex = ? and userId = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, indexNum);
	        pstmt.setString(2, userId);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            pay = rs.getInt("price");
	        } else {
	            // 로그 확인
	            System.out.println("Post not found");
	        }

	        // 리소스 정리
	        rs.close();
	        pstmt.close();

	        // 두 번째 쿼리: 주어진 boardIndex에 대한 사람 수 세기
	        pstmt = con.prepareStatement("SELECT COUNT(*) as people FROM comment WHERE boardIndex = ?");
	        pstmt.setInt(1, indexNum);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            people = rs.getInt("people");
	        } else {
	            // 로그 확인
	            System.out.println("No people found for the given boardIndex");
	        }
            
            
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, rs);
        }
		if (people > 0) {
	        pay += deli / people;
	    } else {
	        System.out.println("People count is zero, cannot divide by zero");
	    }
		return pay;
	}
	
	public void UpdatePayed(int indexNum) {
		PreparedStatement pstmt = null;
		System.out.println("들어옴: " );
		try {
			String sql = "UPDATE comment SET  payed = TRUE  WHERE indexCom = ?";
			pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, indexNum);
    
			pstmt.executeUpdate();
			
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, null);
        }
	}
	
	public boolean Payed(int boardIndex) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean payed = false;
		int count =1;
		try {
			String sql = "SELECT COUNT(payed) as count from comment WHERE boardIndex = ? AND payed <= 0 ";
			pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, boardIndex);
            rs = pstmt.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt("count");
	        } else {
	            // 로그 확인
	            System.out.println("Post not found");
	        }
			
        } catch (Exception ex) {
            System.out.println("Exception:!!!! " + ex);
        } finally {
            JdbcConnectUtil.close(null, pstmt, null);
        }
		
		if(count == 0) {
			payed = true;
		}
		
		return payed;
	}
	

}

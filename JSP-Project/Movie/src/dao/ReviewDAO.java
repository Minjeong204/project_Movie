package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.JdbcUtil;
import vo.ReviewVO;

public class ReviewDAO {
	
	private ReviewDAO() {
	}

	private static ReviewDAO instance = new ReviewDAO();

	public static ReviewDAO getInstance() {
		return instance;
	}
	
	//리뷰 목록 불러오기
	public ArrayList<ReviewVO> reviewList(int movieNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		try {
			conn = JdbcUtil.getConnection();
			String query = "select * from reviews where movieNo=? order by num desc";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, movieNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String id = rs.getString("id");
				String content = rs.getString("content");
				String score = rs.getString("score");
				Date writedate = rs.getDate("writedate");
				ReviewVO reviewVO = new ReviewVO(num, id, content, movieNo, score, writedate);
				list.add(reviewVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//DB 객체 반환
			JdbcUtil.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public void insertReview(String txt, String id, int movieNo,String score) {	
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement("INSERT INTO reviews VALUES(?, ?, ?, ?, ?, sysdate)");
			pstmt.setInt(1, maxReviewNum(movieNo)+1);
			pstmt.setString(2, id);
			pstmt.setString(3, txt);
			pstmt.setInt(4,movieNo);
			pstmt.setString(5,score);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt, conn);
		}		
	}
	
	public int avgReviewNum(int movieNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int score_avg=0;
		try {
			conn = JdbcUtil.getConnection();
			String query = "select round(avg(score),0) from  reviews where movieNo=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, movieNo);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				score_avg = rs.getInt(1);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs, pstmt, conn);
		}
		return score_avg;
	}
	public int maxReviewNum(int movieNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num=0;
		try {
			conn = JdbcUtil.getConnection();
			String query = "select max(num) from  reviews where movieNo=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, movieNo);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				num = rs.getInt(1);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs, pstmt, conn);
		}
		return num;
	}
	
	public void deleteReview(int num,int movieNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement("delete from reviews where movieNo = ? And num=?");
			pstmt.setInt(1, movieNo);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt, conn);
		}
	}
}




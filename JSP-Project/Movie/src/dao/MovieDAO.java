package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.JdbcUtil;
import vo.MovieVO;

public class MovieDAO {
	private static MovieDAO instance = new MovieDAO();

	private MovieDAO() {
	}

	public static MovieDAO getInstance() {
		return instance;
	}

	// 영화 가져오는 메서드 카테고리가 0이면 모든 영화를 불러오고 카테고리가 1, 2면 각 카테고리에 맞는 영화만 불러와집니다.
    // 불러와진 영화들을 리스트에 저장하여 return 합니다.
	public ArrayList<MovieVO> selectCategory(int category) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<MovieVO> movieList = new ArrayList<MovieVO>();
		try {

			conn = JdbcUtil.getConnection();

			String sql = "SELECT * FROM movie ORDER BY movieNo";

			if (category != 0) {
				sql = "SELECT * FROM movie WHERE category = " + category + " ORDER BY movieNo";
			}

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieVO vo = new MovieVO();

				vo.setMovieNo(rs.getInt("movieNo"));
				vo.setMovieName(rs.getString("movieName"));
				vo.setCategory(rs.getInt("category"));
				vo.setRuntime(rs.getInt("runtime"));
				vo.setImg(rs.getString("img"));
				vo.setInfo(rs.getString("info"));

				movieList.add(vo);
			}

		} catch (Exception e) {
			System.out.println("selectCategory() 오류");
			e.printStackTrace();

		} finally {
			// DB 객체 반환
			JdbcUtil.close(rs, pstmt, conn);
		}
		return movieList;
	}
	// 선택한 영화의 정보를 받아온다.
	public MovieVO movieInfo(int movieNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		MovieVO movieInfo = new MovieVO();

		try {
			conn = JdbcUtil.getConnection();

			pstmt = conn.prepareStatement("SELECT * FROM movie WHERE movieNo = ?");

			pstmt.setInt(1, movieNo);
			rs = pstmt.executeQuery();

			if(rs.next()) {				
				movieInfo.setMovieNo(rs.getInt("movieNo"));
				movieInfo.setMovieName(rs.getString("movieName"));
				movieInfo.setCategory(rs.getInt("category"));
				movieInfo.setRuntime(rs.getInt("runtime"));
				movieInfo.setImg(rs.getString("img"));
				movieInfo.setInfo(rs.getString("info"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs, pstmt, conn);
		}

		return movieInfo;
	}
	public int updateLike(int movieNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("업데이트완");
		
		MovieVO movieInfo = new MovieVO();
		
		int like_=0;
		
		try {
			conn = JdbcUtil.getConnection();
			
			pstmt = conn.prepareStatement("update movie set like_ = like_+1 WHERE movieNo = ?");
			
			pstmt.setInt(1, movieNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {				
				like_ = rs.getInt(like_);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs, pstmt, conn);
		}
		
		return like_;
	}
}

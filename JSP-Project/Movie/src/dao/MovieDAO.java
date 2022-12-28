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
	// 선택한 영화의 상영 시간에 대한 정보를 반환해주는 함수
	/*
	 * public ArrayList<ScheduleVO> scheduleAList(int movieNo) { Connection conn =
	 * null; PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * ArrayList<ScheduleVO> list = new ArrayList<ScheduleVO>();
	 * 
	 * try { conn = JdbcUtil.getConnection(); pstmt =
	 * conn.prepareStatement("SELECT m.movieName, m.category, m.img, " +
	 * "m.info, m.runtime, m.movieNo, s.schNo, s.roomNo, s.runDay, r.seatcnt " +
	 * "FROM movie m, schedule s, dayroom r " +
	 * "WHERE m.movieNo = s.movieNo AND r.schNo = s.schNo AND m.movieNo = ?");
	 * 
	 * pstmt.setInt(1, movieNo);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) { ScheduleVO vo = new ScheduleVO();
	 * 
	 * vo.setMovieName(rs.getString("movieName"));
	 * vo.setCategory(Integer.parseInt(rs.getString("category")));
	 * vo.setImg(rs.getString("img")); vo.setInfo(rs.getString("info"));
	 * vo.setSchNo(rs.getInt("schNo")); vo.setMovieNo(rs.getInt("movieNo"));
	 * vo.setRunDay(rs.getTimestamp("runDay")); vo.setRuntime(rs.getInt("runtime"));
	 * vo.setRoomNo(rs.getInt("roomNo")); vo.setSeatCnt(rs.getInt("seatCnt"));
	 * 
	 * 
	 * list.add(vo); } } catch (Exception e) { e.printStackTrace(); } finally {
	 * JdbcUtil.close(rs, pstmt, conn); }
	 * 
	 * return list; }
	 * 
	 * public ArrayList<TicketVO> ticketAllList() { Connection conn = null;
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * ArrayList<TicketVO> list = new ArrayList<TicketVO>();
	 * 
	 * try { conn = JdbcUtil.getConnection();
	 * 
	 * pstmt = conn.prepareStatement("SELECT * FROM ticket");
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) { TicketVO vo = new TicketVO();
	 * 
	 * vo.setTicketNo(rs.getInt("ticketNo"));
	 * vo.setMovieName(rs.getString("movieName"));
	 * vo.setBookDate(rs.getTimestamp("bookDate")); vo.setSchNo(rs.getInt("schNo"));
	 * vo.setRoomNo(rs.getInt("roomNo")); vo.setSeatNo(rs.getInt("seatNo"));
	 * vo.setId(rs.getString("id"));
	 * 
	 * list.add(vo); } } catch (Exception e) { e.printStackTrace(); } finally {
	 * JdbcUtil.close(rs, pstmt, conn); }
	 * 
	 * return list; }
	 * 
	 * public ArrayList<TicketVO> ticketMyList(String id) { Connection conn = null;
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * ArrayList<TicketVO> list = new ArrayList<TicketVO>();
	 * 
	 * try { conn = JdbcUtil.getConnection(); // 가져온 id에 대한 예매 정보를 받아온다. pstmt =
	 * conn.prepareStatement("SELECT * FROM ticket WHERE id = ? order by ticketNo");
	 * pstmt.setString(1, id);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) { TicketVO vo = new TicketVO();
	 * 
	 * vo.setTicketNo(rs.getInt("ticketNo"));
	 * vo.setMovieName(rs.getString("movieName"));
	 * vo.setBookDate(rs.getTimestamp("bookDate")); vo.setSchNo(rs.getInt("schNo"));
	 * vo.setRoomNo(rs.getInt("roomNo")); vo.setSeatNo(rs.getInt("seatNo"));
	 * vo.setId(rs.getString("id"));
	 * 
	 * list.add(vo); } } catch (Exception e) { e.printStackTrace(); } finally {
	 * JdbcUtil.close(rs, pstmt, conn); }
	 * 
	 * return list; } //이미 예매가 됬다면 예매가 된 좌석을 예매하지 못하게 하기 위해 스케줄번호에 따른 예매정보를 받아온다.
	 * public ArrayList<TicketVO> ticketList(int schNo) { Connection conn = null;
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * ArrayList<TicketVO> list = new ArrayList<TicketVO>();
	 * 
	 * try { conn = JdbcUtil.getConnection();
	 * 
	 * pstmt = conn.prepareStatement("SELECT * FROM ticket WHERE schNo = ?");
	 * 
	 * pstmt.setInt(1, schNo);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) { TicketVO vo = new TicketVO();
	 * 
	 * vo.setTicketNo(rs.getInt("ticketNo"));
	 * vo.setMovieName(rs.getString("movieName"));
	 * vo.setBookDate(rs.getTimestamp("bookDate")); vo.setSchNo(rs.getInt("schNo"));
	 * vo.setRoomNo(rs.getInt("roomNo")); vo.setSeatNo(rs.getInt("seatNo"));
	 * vo.setId(rs.getString("id"));
	 * 
	 * list.add(vo); } } catch (Exception e) { e.printStackTrace(); } finally {
	 * JdbcUtil.close(rs, pstmt, conn); }
	 * 
	 * return list; }
	 * 
	 * public TicketVO setTicketInfo(int schNo, int roomNo) { Connection conn =
	 * null; PreparedStatement pstmt = null; ResultSet rs = null; TicketVO ticket =
	 * new TicketVO(); try { conn = JdbcUtil.getConnection(); pstmt = conn.
	 * prepareStatement("SELECT movieName, runDay FROM schedule WHERE schNo = ? AND roomNo = ?"
	 * ); pstmt.setInt(1, schNo); pstmt.setInt(2, roomNo); rs =
	 * pstmt.executeQuery(); if(rs.next()) {
	 * ticket.setMovieName(rs.getString("movieName"));
	 * ticket.setBookDate(rs.getTimestamp("runDay")); } } catch (Exception e) {
	 * e.printStackTrace(); } return ticket; }
	 * 
	 * public int ticketBuy(TicketVO vo) { Connection conn = null; PreparedStatement
	 * pstmt = null; ResultSet rs = null;
	 * 
	 * int status = 0;
	 * 
	 * try { conn = JdbcUtil.getConnection(); //티켓정보를 받아와서 ticket 테이블에 인서트 해준다.
	 * pstmt =
	 * conn.prepareStatement("INSERT INTO ticket VALUES(?, ?, ?, ?, ?, ?, ?)");
	 * //"티켓 정보 인서트" pstmt.setInt(1, ticketMaxNo() + 1); // 티켓번호가 겹치지 않게 하기위해 최대번호에
	 * +1해준 번호를 인서트 pstmt.setString(2, vo.getMovieName()); pstmt.setTimestamp(3,
	 * vo.getBookDate()); pstmt.setInt(4, vo.getSchNo()); pstmt.setInt(5,
	 * vo.getRoomNo()); pstmt.setInt(6, vo.getSeatNo()); pstmt.setString(7,
	 * vo.getId());
	 * 
	 * status = pstmt.executeUpdate();
	 * 
	 * //pstmt.executeUpdate() 함수가 잘 실행됬다면 dayroom 테이블에 예매된 좌석의 숫자를 카운팅 해준다.
	 * if(status > 0) { pstmt = conn.
	 * prepareStatement("UPDATE dayroom SET seatCnt = seatCnt + 1 WHERE schNo = ?");
	 * pstmt.setInt(1, vo.getSchNo());
	 * 
	 * status = pstmt.executeUpdate(); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { JdbcUtil.close(rs,
	 * pstmt, conn); } return status; }
	 * 
	 * public int ticketMaxNo() { Connection conn = null; PreparedStatement pstmt =
	 * null; ResultSet rs = null;
	 * 
	 * int status = 0;
	 * 
	 * try { conn = JdbcUtil.getConnection(); pstmt =
	 * conn.prepareStatement("select MAX(ticketno) from ticket");
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) { status = rs.getInt(1); } } catch (Exception e) {
	 * e.printStackTrace(); } finally { JdbcUtil.close(rs, pstmt, conn); } return
	 * status; }
	 * 
	 * public void cancelTicket(String id, int ticketNo,int schNo) { Connection conn
	 * = null; PreparedStatement pstmt = null; try { conn =
	 * JdbcUtil.getConnection(); //해당 id에 있는 티켓번호에 있는 예매(티켓)정보를 삭제 pstmt =
	 * conn.prepareStatement("delete from ticket where ticketNo = ? And id=?");
	 * pstmt.setInt(1, ticketNo); pstmt.setString(2, id); int pos =
	 * pstmt.executeUpdate();
	 * 
	 * if(pos > 0) { //pstmt.executeUpdate() 함수가 잘 실행 되었다면 예매된 좌석을 -1 해준다. pstmt =
	 * conn.
	 * prepareStatement("UPDATE dayroom SET seatCnt = seatCnt - 1 WHERE schNo = ?");
	 * pstmt.setInt(1, schNo); pstmt.executeUpdate(); //삭제한 티켓 번호보다 큰 티켓 번호들을 1 씩
	 * 뺴줘서 티켓번호를 갱신한다. for(int i = ticketNo+1;i<=ticketMaxNo();i++) { pstmt = conn.
	 * prepareStatement("UPDATE ticket SET ticketNo = ticketNo - 1 WHERE ticketNo = ?"
	 * ); pstmt.setInt(1, i); pstmt.executeUpdate(); } }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }finally { JdbcUtil.close(pstmt,
	 * conn); } }
	 */
}

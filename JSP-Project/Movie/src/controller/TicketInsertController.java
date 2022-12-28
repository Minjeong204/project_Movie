//package controller;
//
//import java.io.IOException;
//import java.rmi.ServerException;
//import java.sql.Date;
//import java.util.ArrayList;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import dao.MemberDAO;
//import dao.MovieDAO;
//import vo.MemberVO;
//import vo.TicketVO;
//
//public class TicketInsertController implements Controller {
//
//	@Override
//	public void execute(HttpServletRequest req, HttpServletResponse resp)
//			throws ServerException, IOException, ServletException {
//		// 파파미터 추출
//		int schNo = Integer.parseInt(req.getParameter("schNo"));
//		int roomNo = Integer.parseInt(req.getParameter("roomNo"));
//		String seatNo = req.getParameter("seatNo");
//		String user = req.getParameter("user");
//		//좌석 번호를 문자열로 받아왔기에 "," 을 기준으로 배열로 나눠준다. 
//		String arr[] = seatNo.split(",");
//
//		//좌석 번호를 for문으로 Ticket 테이블에 insert해준다
//		for(int i = 0; i < arr.length; i++) {
//			// VO객체에 데이터 바인딩
//			MovieDAO instance = MovieDAO.getInstance();
//			//상영시간과 영화 이름을 가져오지 못했기에 따로 함수로 특정 지정
//			TicketVO vo = instance.setTicketInfo(schNo,roomNo);
//			vo.setSchNo(schNo);
//			vo.setSeatNo(Integer.parseInt(arr[i]));
//			vo.setRoomNo(roomNo);
//			vo.setId(user);
//			// 티켓정보를 받아서 Ticket 테이블에 insert해준다.
//			int n = instance.ticketBuy(vo);
//			
//			if(n > 0) {
//				if(i == arr.length -1) {
//					req.setAttribute("buyTicket", 1);
//					req.getRequestDispatcher("/view/buyTicket.jsp").forward(req, resp);	
//				}
//			}else {
//				req.setAttribute("error", "예매 실패입니다.");
//				req.getRequestDispatcher("/").forward(req, resp);
//			}
//		}
//	}
//
//}

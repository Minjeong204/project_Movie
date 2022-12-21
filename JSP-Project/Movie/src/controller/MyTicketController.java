package controller;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDAO;
import vo.TicketVO;

public class MyTicketController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException, ServletException {

		String id = req.getParameter("user");
		
		if (id != null) {
			MovieDAO instance = MovieDAO.getInstance();
			//예매(티켓) 정보를 담는 리스트 선언
			ArrayList<TicketVO> myTicket = new ArrayList<TicketVO>();
			
			//id가 관리자(admin) 일때 는 모든 예매 정보를  
			if(id.equals("admin")) {
				myTicket = instance.ticketAllList();
			//아니면 id의 정보를 가지고 예매 정보를 받아온다.
			}else {
				myTicket = instance.ticketMyList(id);
			}
			//예매목록 화면에 필요한 값 세팅
			req.setAttribute("myUser", id);
			req.setAttribute("myTicket", myTicket);
			req.getRequestDispatcher("/view/myTickets.jsp").forward(req, resp);	
		}	
		
	}

}

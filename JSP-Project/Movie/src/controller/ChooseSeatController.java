package controller;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDAO;
import vo.TicketVO;

public class ChooseSeatController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException, ServletException {
		int schNo = 0;
		int roomNo = Integer.parseInt(req.getParameter("roomNo"));
		if (req.getParameter("schNo") != null) {
			schNo = Integer.parseInt(req.getParameter("schNo"));
			
			MovieDAO instance = MovieDAO.getInstance();
			//이미 예매된 좌석을 가리기 위해 예매 정보를 받아온다.
			ArrayList<TicketVO> ticketList = instance.ticketList(schNo);
			
			//chooseSeat.jsp에 필요한 값을 세팅
			req.setAttribute("ticketList", ticketList);
			req.setAttribute("schNo", schNo);
			req.setAttribute("roomNo", roomNo);
			req.getRequestDispatcher("/view/chooseSeat.jsp").forward(req, resp);
		} else {
			String referer = req.getHeader("Referer");
			resp.sendRedirect(referer);
		}
	}

}

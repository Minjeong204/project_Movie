<<<<<<< HEAD
package controller;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDAO;

public class DeleteMyTicketController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServerException, IOException, ServletException {
		//삭제 버튼 클릭 하면서 쿼리스트링으로 받아온 값 
		String id = req.getParameter("user");
		int ticketNo = Integer.parseInt(req.getParameter("ticketNo"));
		int schNo = Integer.parseInt(req.getParameter("schNo"));
		if(ticketNo != 0) {
			//해당 id와 티켓 번호 스케줄 번호를 가지고 예매한 티켓을 취소 시킨다.
			MovieDAO instance = MovieDAO.getInstance();
			instance.cancelTicket(id,ticketNo,schNo);
		}
		//취소 시키고 다시 예매목록으로
		req.getRequestDispatcher("/view/myTickets.jsp").forward(req, resp);
	}

}
=======
/*
 * package controller;
 * 
 * import java.io.IOException; import java.rmi.ServerException;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import dao.MovieDAO;
 * 
 * public class DeleteMyTicketController implements Controller{
 * 
 * @Override public void execute(HttpServletRequest req, HttpServletResponse
 * resp) throws ServerException, IOException, ServletException { //삭제 버튼 클릭 하면서
 * 쿼리스트링으로 받아온 값 String id = req.getParameter("user"); int ticketNo =
 * Integer.parseInt(req.getParameter("ticketNo")); int schNo =
 * Integer.parseInt(req.getParameter("schNo")); if(ticketNo != 0) { //해당 id와 티켓
 * 번호 스케줄 번호를 가지고 예매한 티켓을 취소 시킨다. MovieDAO instance = MovieDAO.getInstance();
 * instance.cancelTicket(id,ticketNo,schNo); } //취소 시키고 다시 예매목록으로
 * req.getRequestDispatcher("/view/myTickets.jsp").forward(req, resp); }
 * 
 * }
 */
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70

package controller;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;
import vo.ReviewVO;

public class ReviewInsertController  implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServerException, IOException, ServletException {
		String id = req.getParameter("userId");
		String txt = req.getParameter("txt");
		int movieNo = Integer.parseInt(req.getParameter("movieNo"));
<<<<<<< HEAD
		
		ReviewDAO instance = ReviewDAO.getInstance();
		instance.insertReview(txt, id, movieNo);
=======
		String score = req.getParameter("score");
		
		
		ReviewDAO instance = ReviewDAO.getInstance();
		instance.insertReview(txt, id, movieNo, score);
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
		
		String dis = "/reviewList.do?movieNo=" + movieNo;
		req.getRequestDispatcher(dis).forward(req, resp);
	}

}

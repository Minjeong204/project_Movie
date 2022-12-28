<<<<<<< HEAD
=======

>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
package controller;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDAO;
import dao.ReviewDAO;
import vo.MovieVO;
import vo.ReviewVO;
<<<<<<< HEAD
import vo.ScheduleVO;
=======
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70

public class ReviewListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException, ServletException {		
<<<<<<< HEAD
		
=======
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
	
	if (req.getParameter("movieNo") != null) {
		int movieNo = Integer.parseInt(req.getParameter("movieNo"));
		/* int pageNo = Integer.parseInt(req.getParameter("pageNo")); */
		
		MovieDAO instance = MovieDAO.getInstance();
		ReviewDAO instance1 = ReviewDAO.getInstance();
		MovieVO movieInfo = instance.movieInfo(movieNo);
		ArrayList<ReviewVO> reviewList = instance1.reviewList(movieNo);
		int num = instance1.maxReviewNum(movieNo);
<<<<<<< HEAD
=======
		int score_avg = instance1.avgReviewNum(movieNo);
		

>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
		
		
		if(reviewList != null) {
			req.setAttribute("mn", movieNo);
			req.setAttribute("num", num);
			req.setAttribute("movieInfo", movieInfo);
			req.setAttribute("list", reviewList);
<<<<<<< HEAD
			req.getRequestDispatcher("/view/reviewList.jsp").forward(req, resp);
=======
			req.setAttribute("score_avg", score_avg);
			req.getRequestDispatcher("/view/reviewList.jsp").forward(req, resp);
			
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
		}
	}
}
}

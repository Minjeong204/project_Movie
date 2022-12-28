package controller;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;

import javax.servlet.ServletException;
<<<<<<< HEAD
=======
import javax.servlet.ServletRequest;
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDAO;
<<<<<<< HEAD
import dao.ReviewDAO;
import vo.MovieVO;
import vo.ReviewVO;

public class ReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException, ServletException {
		
	int category = 0;
		
=======
import vo.MovieVO;

public class ReviewController implements Controller {
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException, ServletException {
	int category = 0;
	
>>>>>>> 271c4ebc2215e7e9646ae9ff5b791bccf6166c70
		if (req.getParameter("movieNo") != null) {
			category = Integer.parseInt(req.getParameter("movieNo"));
		}
		
		MovieDAO instance = MovieDAO.getInstance();
		ArrayList<MovieVO> movieList = instance.selectCategory(category);

		req.setAttribute("movieList", movieList);
		req.getRequestDispatcher("/view/review.jsp").forward(req, resp);
		
	}

}

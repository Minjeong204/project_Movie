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

public class ReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException, ServletException {
		
	int category = 0;
		
		if (req.getParameter("movieNo") != null) {
			category = Integer.parseInt(req.getParameter("movieNo"));
		}
		
		MovieDAO instance = MovieDAO.getInstance();
		ArrayList<MovieVO> movieList = instance.selectCategory(category);

		req.setAttribute("movieList", movieList);
		req.getRequestDispatcher("/view/review.jsp").forward(req, resp);
		
	}

}

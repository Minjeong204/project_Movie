package controller;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDAO;
import vo.MovieVO;

public class MovieInfoController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException, ServletException {		
		if (req.getParameter("movieNo") != null) {
			int movieNo = Integer.parseInt(req.getParameter("movieNo"));
			
			MovieDAO instance = MovieDAO.getInstance();
			//선택한 영화의 정보를 받아옴
			MovieVO movieInfo = instance.movieInfo(movieNo);
			
			int like_ = instance.updateLike(movieNo);
			
			if(movieInfo != null) {
				req.setAttribute("movieInfo", movieInfo);
				req.setAttribute("like_", like_);
				req.getRequestDispatcher("/view/movieInfo.jsp").forward(req, resp);	
			}
		}		
	}

}

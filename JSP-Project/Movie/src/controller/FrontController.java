package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "front", urlPatterns = { "*.do" })
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String charset = null;
	HashMap<String, Controller> list = null;
       
    public FrontController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		// url과 sub controller 멥핑
		charset = config.getInitParameter("charset");
		
		list = new HashMap<String, Controller>();
		list.put("/movieList.do", new MovieListController());
		list.put("/registerController.do", new RegisterController());
		list.put("/loginController.do", new LoginController());
		list.put("/movieInfo.do", new MovieInfoController());
		list.put("/review.do", new ReviewController());
		list.put("/reviewInsert.do", new ReviewInsertController());
		list.put("/reviewList.do", new ReviewListController());
		list.put("/deleteReview.do", new DeleteReviewController());
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(charset);
		String url = request.getRequestURI(); //ex) /dev/memberSearch.do
		String contextPath = request.getContextPath(); // ex) /dev
		String path = url.substring(contextPath.length()); //ex) memberSearch.do
		
		Controller subController = list.get(path);
		subController.execute(request, response);
	}
}

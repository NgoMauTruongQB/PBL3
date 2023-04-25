package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.AdoptionDAO;
import database.IntroductionDAO;
import model.Adoption;
import model.Introduction;

@WebServlet("/introduction_controller")
public class introduction_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public introduction_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mod = request.getParameter("mod");
		if (mod.equals("delete")) {
			delete(request, response);
		}
		if (mod.equals("update")) {
			update(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String url = "";
		
		IntroductionDAO introductionDAO = new IntroductionDAO();
		Introduction introduction = new Introduction();
		introduction.setIntroductionID(id);
		introduction = introductionDAO.selectById(introduction);
		introduction.setState(1);
		introductionDAO.update(introduction);
		url = "/introduction_manage.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");		
		IntroductionDAO introductionDAO = new IntroductionDAO();
		Introduction introduction = new Introduction();
		introduction.setIntroductionID(id);
		introductionDAO.delete(introduction);
		response.sendRedirect("introduction_manage.jsp");
	}

}

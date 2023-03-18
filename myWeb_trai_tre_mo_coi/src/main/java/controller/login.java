package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.UserDAO;
import model.User;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//		
//		User u = new User();
//		u.setUsername(username);
//		u.setPassword(password);
//		
//		UserDAO userDAO = new UserDAO();
//		User user = userDAO.selectByUsernameAndPassword(u);
//		String url = "";
//		if(user != null) {
//			HttpSession session = request.getSession();
//			session.setAttribute("user", user);
//			url = "/index.jsp";
//		}
//		else {
//			request.setAttribute("error", "Tài khoản không tồn tại!");
//			url = "/login.jsp";
//		}
//		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
//		rd.forward(request, response);
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		User u = new User();
		u.setUsername(username);
		u.setPassword(password);
		
		UserDAO userDAO = new UserDAO();
		User user = userDAO.selectByUsernameAndPassword(u);
		String url = "";
		if(user != null) {
			if (user.getRole().equals("admin")) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				url = "/admin_page.jsp";
			}
			else 
			{
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				url = "/index.jsp";
			}
		}
		else {
			request.setAttribute("error", "Tài khoản không tồn tại!");
			url = "/login.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
		
	}
}

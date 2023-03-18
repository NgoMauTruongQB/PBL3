package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.UserDAO;
import model.User;

/**
 * Servlet implementation class register
 */

@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public register() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String email = request.getParameter("email");
		
		request.setAttribute("username", username);
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		
		String url = "";
		String error = "";
		
		UserDAO userDAO = new UserDAO();
		if (userDAO.checkUsername(username)) {
			error += "Username đã tồn tại!";
		}
		
		request.setAttribute("error",error);
		if(error.length() > 0) {
			url = "/signUp.jsp";
		}
		else {
			String id = "U" + System.currentTimeMillis();
			User user = new User(id, username, email, password, name, "user", 1);
			userDAO.insert(user);
			url = "/login.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

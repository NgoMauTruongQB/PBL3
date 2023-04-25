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

@WebServlet("/user_controller")
public class user_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public user_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mod = request.getParameter("mod");
		if(mod.equals("addUser")) {
			addUser(request, response);
		} else if (mod.equals("deleteUser")) {
			deleteUser(request, response);
		} else if (mod.equals("updateUser")) {
			updateUser(request, response);
		} else if (mod.equals("getInfo")) {
			getInfo(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void getInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		User user = new User();
		user.setId(id);
		UserDAO userDao = new UserDAO();
		User u = userDao.selectById(user);
		String url = "";
		request.setAttribute("uName", u.getFullname());
		request.setAttribute("uUsername", u.getUsername());
		request.setAttribute("uPassword", u.getPassword());
		request.setAttribute("uEmail", u.getEmail());
		request.setAttribute("uState", u.getState());
		request.setAttribute("uRole", u.getRole());
		request.setAttribute("userId", u.getId());
		String mod = request.getParameter("mod");
		url = "/userUpdate.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("iUsername");
		String name = request.getParameter("iName");
		String password = request.getParameter("iPassword");
		String email = request.getParameter("iEmail");
		String role = request.getParameter("iRole");
		
		request.setAttribute("username", username);
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		request.setAttribute("password", password);
		
		String url = "";
		String error = "";
		
		UserDAO userDAO = new UserDAO();
		if(userDAO.checkUsername(username)) {
			error += "Đã tồn tại!";
		}
		
		request.setAttribute("error", error);
		if(error.length() > 0) {
			url = "/user_manage.jsp";
		}
		else {
	        long time = System.currentTimeMillis();
	        String id = "U" + String.valueOf(time).substring(0, 8);
	        User user = new User(id, username, email, password, name, role, 1);
	        userDAO.insert(user);
	        url = "/user_manage.jsp";
	        request.setAttribute("username", "");
			request.setAttribute("name", "");
			request.setAttribute("email", "");
			request.setAttribute("password", "");
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");	
		UserDAO userDAO = new UserDAO();
		User u = new User();
		u.setId(id);
		userDAO.delete(u);
		response.sendRedirect("user_manage.jsp");
	}
	
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("uUsername");
		String name = request.getParameter("uName");
		String password = request.getParameter("uPassword");
		String email = request.getParameter("uEmail");
		String role = request.getParameter("uRole");
		String stateTmp = request.getParameter("uState");
		String id = request.getParameter("userId");
		int state = Integer.parseInt(stateTmp);
		String error = "";
		String url = "";
		UserDAO userDAO = new UserDAO();
		
		if(userDAO.checkUsernameDiferentId(username, id)) {
			error += "Đã tồn tại!";
			System.out.println("Đã tồn tại");
		}
		
		request.setAttribute("uError", error);
		if(error.length() > 0) {
			request.setAttribute("uName", name);
			request.setAttribute("uUsername", username);
			request.setAttribute("uPassword", password);
			request.setAttribute("uEmail", email);
			request.setAttribute("uState", state);
			request.setAttribute("uRole", role);
			request.setAttribute("userId", id);
			url = "/userUpdate.jsp";
		} else {
			User user = new User(id, username, email, password, name, role, state);
			userDAO.update(user);
			url = "/user_manage.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
}

package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.StaffDAO;
import model.Staff;
import util.Email;

@WebServlet("/sendMail_controller")
public class sendMail_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public sendMail_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mod = request.getParameter("mod");
		if (mod.equals("allStaff")) {
			sendAllStaff(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void sendAllStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tilte = request.getParameter("titleEmail");
		String content = request.getParameter("contentEmail");
		
		String url = "";
		StaffDAO staffDAO = new StaffDAO();
		ArrayList<Staff> list = staffDAO.selectAll();
		for(Staff st : list) {
			Email.SendEmailStaff(st.getEmail(), tilte, tilte, content);
		}
		url = "/admin_page.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}

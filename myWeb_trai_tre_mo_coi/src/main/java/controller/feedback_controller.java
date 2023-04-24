package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.FeedbackDAO;
import database.StaffDAO;
import model.Feedback;
import model.Staff;


@WebServlet("/feedback_controller")
public class feedback_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public feedback_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		
		FeedbackDAO fbDao = new FeedbackDAO();
		ArrayList<Feedback> list = fbDao.getInfomationStaff(id);
		
		Staff staff = new Staff();
		staff.setStaffID(id);
		StaffDAO stDao = new StaffDAO();
		Staff st = stDao.selectById(staff);
		
		double rating = 0;
		int count = 0;
		for (Feedback feedback : list) {
			rating += feedback.getRating();
			count++;
		}
		rating = (double) rating / count;
		
		String url = "";
		request.setAttribute("name", st.getFullname());
		request.setAttribute("gender", st.getGender());
		request.setAttribute("date", st.getDate_of_birth());
		request.setAttribute("phone", st.getPhone());
		request.setAttribute("email", st.getEmail());
		request.setAttribute("positon", st.getPosition());
		request.setAttribute("state", st.getState());
		request.setAttribute("rating", rating);
		request.setAttribute("photo", st.getPhoto());
		request.setAttribute("count", count);
		url = "/feedbackView.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}

package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Random;
import java.util.ArrayList;
import java.util.Calendar;

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
import model.User;

@WebServlet("/feed_back")
public class feed_back extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public feed_back() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name1");
		String ratingString = request.getParameter("rating");
		String  comment = request.getParameter("comment");
		String url="";
		StaffDAO std= new StaffDAO();
		FeedbackDAO feedbackDAO= new FeedbackDAO();	
		boolean check;
		Object obj = request.getSession().getAttribute("user");
		User user=null;
		if(obj!=null) 
			user= (User)obj;
		if(user!=null) {
		if(std.selectID(name)!= null) { 
			int rating = Integer.parseInt(ratingString);
			LocalDate localDate = LocalDate.now(); // Lấy ngày hiện tại
	        Date currentDate = Date.valueOf(localDate);
			 Random rand = new Random();
	         int ranNum = rand.nextInt(100)+1;
	    
	        String s=Integer.toString(ranNum);
			String id ="FB"+s;

			Staff st = new Staff();
			st = std.selectID(name);
			Feedback fb = new Feedback(id ,currentDate ,st,comment,rating);
		
			
			feedbackDAO.insert(fb);
			if(fb!=null) check = true; else check= false;
			if (check) {
			    request.setAttribute("SuccessFeedback", true);
			} else {
			    request.setAttribute("SuccessFeedback", false);
			}
			 url = "/index.jsp";
			
			
			
		}
		else {
			request.setAttribute("error", "Tên nhân viên không tồn tại!");
			url = "/index.jsp";
		}
		}else {
			request.setAttribute("errorF", "Bạn chưa đăng nhập!");
			url="/index.jsp";
		}
		RequestDispatcher rd1 = getServletContext().getRequestDispatcher(url);
		rd1.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	
		doGet(request, response);
	}

}
package controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.AdopterDAO;
import database.Adopter_user_DAO;
import database.UserDAO;
import model.Adopter;
import model.Adopter_user;
import model.User;

/**
 * Servlet implementation class adopter_signup
 */
@WebServlet("/adopter_signup")
public class adopter_signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adopter_signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String phone= request.getParameter("phone");
		String adr= request.getParameter("address");
		String cccd= request.getParameter("cccd");
		String url="";
		
		UserDAO usd=new UserDAO();
		boolean check;
		Object obj = request.getSession().getAttribute("user");
		User user=null;
		if(obj!=null) 
			user= (User)obj;
		if(user!=null) {
		if(phone != null && cccd != null && adr!= null) {
		
				if(user!=null) {
					 Random rand = new Random();
			         int ranNum = rand.nextInt(100)+1;
			        String s=Integer.toString(ranNum);
					String id ="NN"+s;
					String userId=user.getId();
					User us1=new User();
					us1 = usd.selectById(userId);
					String us2=us1.getFullname();
					
					
					Adopter_user_DAO ad_us_DAO= new Adopter_user_DAO();
					Adopter_user ad_us= new Adopter_user();
					ad_us=ad_us_DAO.selectByIdUser(user);
					if(ad_us==null) {
						AdopterDAO adt=new AdopterDAO();
						Adopter ad= new Adopter(id,us2,phone,adr,cccd,null);
					adt.insert(ad);
					ad_us_DAO.addAdopterUser(ad, user);
					
					/*
					 * HttpSession session = request.getSession(); session.setAttribute("adopter",
					 * us1);
					 */
					if(ad!=null) check = true; else check= false;
					if (check) {
						request.setAttribute("Success", true);
					    
					} else {
						request.setAttribute("Success", false);
					}
					 url = "/adopter_signup.jsp";
					}
					else {
						request.setAttribute("error", "Bạn đã dăng kí thành người nhận nuôi!");
						url="/adopter_signup.jsp";
					}
				} 
				else {request.setAttribute("error", "Bạn đã dăng kí thành người nhận nuôi!");
					url="/adopter_signup.jsp";
				}
					
				

		}	
		}else {
			request.setAttribute("error", "Bạn không thể đăng kí thành người nhận nuôi khi chưa đăng nhập hoặc đăng kí tài khoản người dùng!");
			url="/adopter_signup.jsp";
		}
		
		RequestDispatcher rd1 = getServletContext().getRequestDispatcher(url);
		rd1.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

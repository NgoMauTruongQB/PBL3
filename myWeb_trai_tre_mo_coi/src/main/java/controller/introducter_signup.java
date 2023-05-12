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
import database.IntroducterDAO;
import database.Introducter_user_DAO;
import database.UserDAO;
import model.Adopter;
import model.Introducter;
import model.Introducter_user;
import model.User;

@WebServlet("/introducter_signup")
public class introducter_signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public introducter_signup() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String phone= request.getParameter("phone");
		String adr= request.getParameter("address");
		String note= request.getParameter("note");
		String url="";
		IntroducterDAO inDAO=new IntroducterDAO();
		UserDAO usd=new UserDAO();
		Object obj = request.getSession().getAttribute("user");
		User user=null;
		if(obj!=null) 
			user= (User)obj;
		boolean check;
		if(user!=null) {
		if(phone != null && adr!= null) {
		
				if(user!=null) {
					 Random rand = new Random();
			         int ranNum = rand.nextInt(100)+1;
			        String s=Integer.toString(ranNum);
					String id ="GT"+s;
					String userId=user.getId();
					User us1=new User();
					us1 = usd.selectById(userId);
					String us2=us1.getFullname();
					Introducter in= new Introducter(id,us2,phone,adr,note);
					
					Introducter_user_DAO in_us_DAO= new Introducter_user_DAO();
					Introducter_user in_us= new Introducter_user();
					in_us=in_us_DAO.selectByIdUser(user);
			
					
					if(in_us==null) {
						inDAO.insert(in);
						in_us_DAO.addIntroducterUser(in,user);
					url = "/index.jsp";
					if(in!=null) check = true; else check= false;
					if (check) {
					    request.setAttribute("Success", true);
					} else {
					    request.setAttribute("Success", false);
					}
					 url = "/index.jsp";}else {
						 request.setAttribute("error", "Bạn đã đăng kí thành người giới thiệu!");
							url="/introducter_signup.jsp";
					 }
					 
				} 
				else {
					url="/success.jsp";
				}

		}
		}else {
			request.setAttribute("error", "Bạn không thể đăng kí thành người giới thiệu khi chưa đăng nhập hoặc đăng kí tài khoản người dùng!");
			url="/introducter_signup.jsp";
		}
		RequestDispatcher rd1 = getServletContext().getRequestDispatcher(url);
		rd1.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
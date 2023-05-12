
package controller;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.ChildrenDAO;
import database.IntroducterDAO;
import database.Introducter_user_DAO;
import database.IntroductionDAO;
import database.UserDAO;
import model.Children;
import model.Introducter_user;
import model.Introduction;
import model.User;

@WebServlet("/introduction")
public class introduction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public introduction() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String note = null;
		String name_children= request.getParameter("children_name");
		note = request.getParameter("note");
		
		UserDAO usDAO= new UserDAO();
		Object obj = request.getSession().getAttribute("user");
		User user=null;
		user= (User)obj;
		String url="";
		
		boolean check;
		if(user!=null) {
			ChildrenDAO chDAO= new ChildrenDAO();
			Children ch= new Children();
			ch = chDAO.selectById(name_children);
			Introducter_user_DAO in_us_DAO = new Introducter_user_DAO();
			Introducter_user in_us = new Introducter_user();
			in_us= in_us_DAO.selectByIdUser(user);
			if(in_us== null) {
				request.setAttribute("error", "Bạn chưa đăng kí trở thành người giới thiệu!");
				url="/introduction.jsp";
			}else {
			 LocalDate localDate = LocalDate.now(); // Lấy ngày hiện tại
		        Date currentDate = Date.valueOf(localDate);
		        Random rand = new Random();
		         int ranNum = rand.nextInt(1000)+1;
		        String s=Integer.toString(ranNum);
				String id ="IN"+s;
				IntroductionDAO inDAO= new IntroductionDAO();
				Introduction in = new Introduction(id,ch,in_us.getIntroducter(),0,currentDate,note);
				inDAO.insert(in);
				if(in!=null) check = true; else check= false;
				if (check) {
				    request.setAttribute("SuccessIntroduction", true);
				} else {
				    request.setAttribute("SuccessIntroduction", false);
				}
				url="/introduction.jsp";	
			}
		}else {
			request.setAttribute("error", "Bạn chưa đăng nhập!");
			url="/introduction.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
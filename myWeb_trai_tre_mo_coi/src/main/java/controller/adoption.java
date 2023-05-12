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

import database.AdopterDAO;
import database.Adopter_user_DAO;
import database.AdoptionDAO;
import database.ChildrenDAO;
import database.UserDAO;
import model.Adopter;
import model.Adopter_user;
import model.Adoption;
import model.Children;
import model.User;


@WebServlet("/adoption")
public class adoption extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public adoption() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String note = null;
		String name_children= request.getParameter("children_name");
		 note = request.getParameter("note");
		Object obj = request.getSession().getAttribute("user");
		User user=null;
		user= (User)obj;
		String url="";
		boolean check;
		if(user!=null) {
			ChildrenDAO chDAO= new ChildrenDAO();
			Children ch= new Children();
			ch = chDAO.selectById(name_children);
			UserDAO usDAO= new UserDAO();
			AdopterDAO adopterDAO= new AdopterDAO();
			Adopter adopter = new Adopter();
			Adopter_user_DAO ad_us_DAO= new Adopter_user_DAO();
			Adopter_user ad_us= new Adopter_user();
			ad_us= ad_us_DAO.selectByIdUser(user);
			AdoptionDAO adoptionDAO = new AdoptionDAO ();
		if(ad_us==null ) {
			 request.setAttribute("error", "Bạn chưa đăng kí trở thành người nhận nuôi!");
				url="/adoption.jsp";
			
		}
		else {
			 LocalDate localDate = LocalDate.now(); // Lấy ngày hiện tại
		        Date currentDate = Date.valueOf(localDate);
			adopter= adopterDAO.selectById(ad_us.getAdopter());
			 Random rand = new Random();
	         int ranNum = rand.nextInt(1000)+1;
	        String s=Integer.toString(ranNum);
			String id ="A"+s;
			Adoption ad= new Adoption(id, ad_us.getAdopter(),ch,0,currentDate,note);
			adoptionDAO.insert(ad);
			if(ad!=null) check = true; else check= false;
			if (check) {
			    request.setAttribute("SuccessAdoption", true);
			} else {
			    request.setAttribute("SuccessAdoption", false);
			}
			 url = "/adoption.jsp";
		}
		}
		else {
			request.setAttribute("error", "Bạn chưa đăng nhâp!");
			url="/adoption.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
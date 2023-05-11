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

import database.Charity_activitiesDAO;
import database.DonationDAO;
import database.UserDAO;
import model.Charity_activities;
import model.Donation;
import model.User;

@WebServlet("/verifyDonation_controller")
public class verifyDonation_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public verifyDonation_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mod = request.getParameter("mod");
		if (mod.equals("edit")) {
			edit(request, response);
		}
		if (mod.equals("delete")) {
			delete(request, response);
		}
		if (mod.equals("insert")) {
			insert(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
		String url = "";
		
		DonationDAO donationDAO = new DonationDAO();
		Donation donation = new Donation();
		donation.setDonationID(id);
		donation = donationDAO.selectById(donation);
		donation.setState(1);
		donationDAO.update(donation);
		url = "/verifyDonations.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");		
		DonationDAO donationDAO = new DonationDAO();
		Donation donation = new Donation();
		donation.setDonationID(id);
		donationDAO.delete(donation);
		response.sendRedirect("verifyDonations.jsp");
	}
	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		 String phonenumber= request.getParameter("phone");
		String money= request.getParameter("money");
		String event=request.getParameter("charity_activities");
		String url="";
		DonationDAO dn= new DonationDAO();
		UserDAO usd=new UserDAO();
		Charity_activitiesDAO chr = new Charity_activitiesDAO();
		boolean check ;
		if(phonenumber != null && !phonenumber.isEmpty() && money != null && !money.isEmpty()){
			Double money1=Double.parseDouble(money);
		if(money1>1000) {
			
			Object obj = request.getSession().getAttribute("user");
			User user=null;
			if(obj!=null) 
				user= (User)obj;
				if(user!=null) {
					 LocalDate localDate = LocalDate.now(); 
				        Date currentDate = Date.valueOf(localDate);
					//Date currentDate = new Date(0);
					 Random rand = new Random();
			         int ranNum = rand.nextInt(1000)+1;
			        String s=Integer.toString(ranNum);
					String id ="DN"+s;
					String userId=user.getId();
					User us1=new User();
					us1 = usd.selectById(userId);
					Charity_activities ch=new Charity_activities();
					ch=chr.selectById(event);
					Donation dnt= new Donation(id,money1,0,phonenumber,currentDate,ch,us1);		
					dn.insert(dnt);
					if(dnt!=null) check = true; else check= false;
					if (check) {
					    request.setAttribute("SuccessDonation", true);
					} else {
					    request.setAttribute("SuccessDonation", false);
					}
					 url = "/donation.jsp";
					
							}
				else { 
					request.setAttribute("error", "Bạn chưa đăng nhập!");
					url="/donation.jsp";
										}
			
						}
		else {
			request.setAttribute("error", "Hãy nhập số tiền phù hợp!");
			url="/donation.jsp";
		}
		}else {
			request.setAttribute("error", "Hãy nhập thông tin đầy đủ!");
			url="/donation.jsp";
		}
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
		}
	}

package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.AdopterDAO;
import database.UserDAO;
import model.Adopter;
import model.User;

@WebServlet("/adopter_controller")
public class adopter_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public adopter_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mod = request.getParameter("mod");
		if(mod.equals("addAdopter")) {
			addAdopter(request, response);
		} else if (mod.equals("updateAdopter")) {
			updateAdopter(request, response);
		} else if (mod.equals("deleteAdopter")) {
			deleteAdopter(request, response);
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
		Adopter ad = new Adopter();
		ad.setAdopterID(id);
		AdopterDAO adopterDAO = new AdopterDAO();
		Adopter adopter = adopterDAO.selectById(ad);
		String url = "";
		request.setAttribute("uName", adopter.getName());
		request.setAttribute("uCmnd", adopter.getCmnd());
		request.setAttribute("uPhone", adopter.getPhoneNumber());
		request.setAttribute("uAddress", adopter.getAddress());
		request.setAttribute("uNote", adopter.getNote());
		request.setAttribute("uId", adopter.getAdopterID());
		url = "/adopterUpdate.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void addAdopter(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("iName");
		String cmnd = request.getParameter("iCmnd");
		String phone = request.getParameter("iPhone");
		String add = request.getParameter("iAddress");
		String note = request.getParameter("iNote");
		
		request.setAttribute("name", name);
		request.setAttribute("cmnd", cmnd);
		request.setAttribute("phone", phone);
		request.setAttribute("address", add);
		request.setAttribute("note", note);
		
		String url = "";
		String error = "";
		
		AdopterDAO adopterDAO = new AdopterDAO();
		if(adopterDAO.checkCmnd(cmnd)) {
			error += "CMND/CCCD đã tồn tại!";
		}
		
		request.setAttribute("error", error);
		if(error.length() > 0) {
			url = "/adopter_manage.jsp";
		}
		else {
			long time = System.currentTimeMillis();
			String id = "NN" + String.valueOf(time).substring(0,8);
			Adopter adopter = new Adopter(id, name, phone, add, cmnd, note);
			adopterDAO.insert(adopter);
			url = "/adopter_manage.jsp";
			request.setAttribute("name", "");
			request.setAttribute("cmnd", "");
			request.setAttribute("phone", "");
			request.setAttribute("address", "");
			request.setAttribute("note", "");
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void updateAdopter(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("uId");
		String name = request.getParameter("uName");
		String cmnd = request.getParameter("uCmnd");
		System.out.println(cmnd);
		System.out.println(id);
		String phone = request.getParameter("uPhone");
		String add = request.getParameter("uAddress");
		String note = request.getParameter("uNote");
		String error = "";
		String url = "";
		AdopterDAO adopterDAO = new AdopterDAO();
		
		if(adopterDAO.checkCmndDiferentId(cmnd, id)) {
			error += "Đã tồn tại!";
			System.out.println(error);
		}
		
		request.setAttribute("uError", error);
		if(error.length() > 0) {
			request.setAttribute("uName", name);
			request.setAttribute("uCmnd", cmnd);
			request.setAttribute("uPhone", phone);
			request.setAttribute("uAddress", add);
			request.setAttribute("uNote", note);
			request.setAttribute("userId", id);
			url = "/adopterUpdate.jsp";
		} else {
			Adopter ad = new Adopter(id, name, phone, add, cmnd, note);
			adopterDAO.update(ad);
			url = "/adopter_manage.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void deleteAdopter(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");	
		AdopterDAO adopterDao = new AdopterDAO();
		Adopter ad = new Adopter();
		ad.setAdopterID(id);
		adopterDao.delete(ad);
		response.sendRedirect("adopter_manage.jsp");
	}
	
	

}

package controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import database.IntroducterDAO;
import database.IntroductionDAO;
import model.Introducter;
import model.Introduction;

@WebServlet("/introducter_controller")
public class introducter_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public introducter_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mod = request.getParameter("mod");
		if(mod.equals("add")) {
			addIntroducter(request, response);
		} else if (mod.equals("delete")) {
			deleteIntroducter(request, response);
		} else if (mod.equals("update")) {
			updateIntroducter(request, response);
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
		Introducter intr = new Introducter();
		intr.setIntroducterID(id);
		IntroducterDAO introducterDAO = new IntroducterDAO();
		Introducter introducter = introducterDAO.selectById(intr);
		
		String url="";
		request.setAttribute("uName", introducter.getName());
		request.setAttribute("uPhone", introducter.getPhoneNumber());
		request.setAttribute("uAddress", introducter.getAddress());
		request.setAttribute("uNote", introducter.getNote());
		request.setAttribute("uId", introducter.getIntroducterID());
		url = "/introducterUpdate.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void addIntroducter(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("iName");
		String phone = request.getParameter("iPhone");
		String add = request.getParameter("iAddress");
		String note = request.getParameter("iNote");
		String url = "";
		
		IntroducterDAO introducterDAO = new IntroducterDAO();
		long time = System.currentTimeMillis();
		String id = "GT" + String.valueOf(time).substring(0,8);
		Introducter introducter = new Introducter(id, name, phone, add, note);
		introducterDAO.insert(introducter);
		url = "/introducter_manage.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void deleteIntroducter(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
		String notification = "Thành công";
		String url = "";
		int isSuccess = 0;
		IntroducterDAO introducterDAO = new IntroducterDAO();
		Introducter it = new Introducter();
		it.setIntroducterID(id);
		isSuccess = introducterDAO.delete(it);
		if(isSuccess == 0) {
			notification = "Không được phép xoá vì người giới thiệu này liên quan đến các thông tin khác.";
		}
		request.setAttribute("notification", notification);
		url = "/introducter_manage.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void updateIntroducter(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("uName");
		String phone = request.getParameter("uPhone");
		String add = request.getParameter("uAddress");
		String note = request.getParameter("uNote");
		String id = request.getParameter("uId");
		
		String url = "";
		IntroducterDAO introducterDAO = new IntroducterDAO();
		Introducter introducter = new Introducter(id, name, phone, add, note);
		introducterDAO.update(introducter);
		url = "/introducter_manage.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
}

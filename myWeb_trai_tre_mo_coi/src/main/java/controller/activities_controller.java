package controller;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import database.Charity_activitiesDAO;
import model.Charity_activities;
import model.Staff;

@MultipartConfig
@WebServlet("/activities_controller")
public class activities_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public activities_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mod = request.getParameter("mod");
		if (mod.equals("add")) {
			insertActivity(request, response);
		}
		if (mod.equals("update")) {
			updateActivity(request, response);
		}
		if (mod.equals("getInfo")) {
			getInfo(request, response);
		}
		if (mod.equals("delete")) {
			deleteActivity(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void updateActivity(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("uName");
		String purpose = request.getParameter("uPurpose");
		String dateBeginTmp = request.getParameter("uDateBegin");
		String dateEndTmp = request.getParameter("uDateEnd");
		String monneyTmp = request.getParameter("uMoney");
		String staff = request.getParameter("iStaff");	
		String id = request.getParameter("uId");
		
		String url = "";
		try {
			double monney = Double.parseDouble(monneyTmp);
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date utilDateBegin, utilDateEnd;
				utilDateBegin = format.parse(dateBeginTmp);
				java.sql.Date dateBegin = new java.sql.Date(utilDateBegin.getTime());
				utilDateEnd = format.parse(dateEndTmp);
				java.sql.Date dateEnd = new java.sql.Date(utilDateEnd.getTime());
				
				Part file = request.getPart("uPhoto");
				String image = file.getSubmittedFileName();
				String uploadPath = "D:/Study/DoAn/PBL3/myWeb_trai_tre_mo_coi/src/main/webapp/uploads/activities/" + image;
				try {
					FileOutputStream fos = new FileOutputStream(uploadPath);
					InputStream is = file.getInputStream();
					byte[] data = new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

				Staff st = new Staff();
				st.setStaffID(staff);
				Charity_activities charity_activities = new Charity_activities(id, name, dateBegin, dateEnd, monney, purpose, st, image);
				Charity_activitiesDAO charity_activitiesDAO = new Charity_activitiesDAO();
				charity_activitiesDAO.update(charity_activities);
				url = "/activities_manage.jsp";
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void insertActivity(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String name = request.getParameter("uName");
		String purpose = request.getParameter("uPurpose");
		String dateBeginTmp = request.getParameter("uDateBegin");
		String dateEndTmp = request.getParameter("uDateEnd");
		Double money = Double.parseDouble(request.getParameter("uMoney"));
		String satffId = request.getParameter("uStaff");
		
		String url = "";
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDateBegin, utilDateEnd;
			utilDateBegin = format.parse(dateBeginTmp);
			java.sql.Date dateBegin = new java.sql.Date(utilDateBegin.getTime());
			utilDateEnd = format.parse(dateEndTmp);
			java.sql.Date dateEnd = new java.sql.Date(utilDateEnd.getTime());
			
			Part file = request.getPart("file-input");
			String image = file.getSubmittedFileName();
			String uploadPath = "D:/Study/DoAn/PBL3/myWeb_trai_tre_mo_coi/src/main/webapp/uploads/activities/" + image;
			
			try {
				FileOutputStream fos = new FileOutputStream(uploadPath);
				InputStream is = file.getInputStream();
				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			long time = System.currentTimeMillis();
			String id = "HD" + String.valueOf(time).substring(0,8);
			
			Staff staff = new Staff();
			staff.setStaffID(satffId);
			Charity_activitiesDAO charity_activitiesDAO = new Charity_activitiesDAO();
			Charity_activities charity_activities = new Charity_activities(id, name, dateBegin, dateEnd, money, purpose, staff, image);
			charity_activitiesDAO.insert(charity_activities);
			url = "/activities_manage.jsp";
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void getInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Charity_activities charity_activities = new Charity_activities();
		charity_activities.setActivityID(id);
		Charity_activitiesDAO charity_activitiesDAO = new Charity_activitiesDAO();
		charity_activities = charity_activitiesDAO.selectById(charity_activities);
		request.setAttribute("id", id);
		request.setAttribute("name", charity_activities.getName_of_activity());
		request.setAttribute("date_begin", charity_activities.getDate_begin());
		request.setAttribute("date_end", charity_activities.getDate_end());
		request.setAttribute("money", charity_activities.getMoney_collected());
		request.setAttribute("purpose", charity_activities.getPurpose_of_activity());
		request.setAttribute("staffID", charity_activities.getStaff().getStaffID());
		request.setAttribute("photo", charity_activities.getPhoto());
		String url = "/activitiesUpdate.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void deleteActivity(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		Charity_activitiesDAO aDao = new Charity_activitiesDAO();
		Charity_activities activity = new Charity_activities();
		activity.setActivityID(id);
		aDao.delete(activity);
		response.sendRedirect("activities_manage.jsp");
	}

}

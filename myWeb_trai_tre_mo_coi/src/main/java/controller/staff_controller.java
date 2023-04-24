package controller;

import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.text.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.filechooser.FileNameExtensionFilter;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import database.JDBCUtil;
import database.StaffDAO;
import model.Staff;

@MultipartConfig
@WebServlet("/staff_controller")
public class staff_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public staff_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mod = request.getParameter("mod");
		if(mod.equals("addStaff")) {
			try {
				addStaff(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (mod.equals("deleteStaff")) {
			deleteStaff(request, response);
		} else if (mod.equals("updateStaff")) {
			updateStaff(request, response);
		} else if (mod.equals("getInfo")) {
			getInfo(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void addStaff(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("iName");
		String gender = request.getParameter("iGender");
		String email = request.getParameter("iEmail");
		String phone = request.getParameter("iPhone");
		String position = request.getParameter("iPosition");
		String dateTmp = request.getParameter("iDate");		
		
		String url = "";
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDate = format.parse(dateTmp);
			java.sql.Date date = new java.sql.Date(utilDate.getTime());
			Part file = request.getPart("file-input");
			String image = file.getSubmittedFileName();
			String uploadPath = "D:/Study/DoAn/PBL3/myWeb_trai_tre_mo_coi/src/main/webapp/uploads/staff/" + image;
			
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

			StaffDAO staffDao = new StaffDAO();
			long time = System.currentTimeMillis();
			String id = "ST" + String.valueOf(time).substring(0,8);
			Staff staff = new Staff(id, name, date, gender, position, 1, phone, email, image);
			staffDao.insert(staff);
			url = "/staff_manage.jsp";
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void deleteStaff(HttpServletRequest request, HttpServletResponse response) {
		try {
			String id = request.getParameter("id");
			StaffDAO staffDao = new StaffDAO();
			Staff st = new Staff();
			st.setStaffID(id);
			staffDao.delete(st);
			response.sendRedirect("staff_manage.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void getInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Staff st = new Staff();
		st.setStaffID(id);
		StaffDAO staffDAO = new StaffDAO();
		Staff staff = staffDAO.selectById(st);
		request.setAttribute("uName", staff.getFullname());
		request.setAttribute("uEmail", staff.getEmail());
		request.setAttribute("uDate", staff.getDate_of_birth());
		request.setAttribute("uGender", staff.getGender());
		request.setAttribute("uPosition", staff.getPosition());
		request.setAttribute("uState", staff.getState());
		request.setAttribute("uPhone", staff.getPhone());
		request.setAttribute("uPhoto", staff.getPhoto());
		request.setAttribute("id", id);
		String url = "/staffUpdate.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void updateStaff(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("uName");
		String gender = request.getParameter("uGender");
		String email = request.getParameter("uEmail");
		String phone = request.getParameter("uPhone");
		String position = request.getParameter("uPosition");
		String dateTmp = request.getParameter("uDate");	
		String stateTmp = request.getParameter("uState");
		String id = request.getParameter("id");
		
		String url = "";
		try {
			int state = Integer.parseInt(stateTmp);
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date utilDate;
				utilDate = format.parse(dateTmp);
				java.sql.Date date = new java.sql.Date(utilDate.getTime());
				Part file = request.getPart("uPhoto");
				String image = file.getSubmittedFileName();
				String uploadPath = "D:/Study/DoAn/PBL3/myWeb_trai_tre_mo_coi/src/main/webapp/uploads/staff/" + image;
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

				StaffDAO staffDao = new StaffDAO();
				Staff staff = new Staff(id, name, date, gender, position, state, phone, email, image);
				staffDao.update(staff);
				url = "/staff_manage.jsp";
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
}

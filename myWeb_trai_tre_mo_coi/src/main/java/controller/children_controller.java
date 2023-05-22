package controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import database.ChildrenDAO;
import database.Introducter_user_DAO;
import database.IntroductionDAO;
import database.UserDAO;
import model.Children;
import model.Introducter_user;
import model.Introduction;
import model.User;

@MultipartConfig
@WebServlet("/children_controller")
public class children_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public children_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mod = request.getParameter("mod");
		if(mod.equals("addChild")) {
			try {
				addChild(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (mod.equals("deleteChild")) {
			deleteChild(request, response);
		} else if (mod.equals("getInfo") || mod.equals("getInfoView")) {
			getInfo(request, response);
		} else if (mod.equals("updateChild")) {
			updateChild(request, response);
		}
		else if (mod.equals("introduction")) {
			try {
				introduction(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	void addChild(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("iName");
		String gender = request.getParameter("iGender");
		String dateTmp = request.getParameter("iDate");
		String health = request.getParameter("iHealth");
		String education = request.getParameter("iEducation");
		String reason = request.getParameter("iReason");
		
		String url = "";
		
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDate = format.parse(dateTmp);
			java.sql.Date date = new java.sql.Date(utilDate.getTime());
			Part file = request.getPart("file-input");
			String image = file.getSubmittedFileName();
			String uploadPath = "D:/workspace_PBL/PBL3/myWeb_trai_tre_mo_coi/src/main/webapp/uploads/children/" + image;
			
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
			
			ChildrenDAO childrenDAO = new ChildrenDAO();
			long time = System.currentTimeMillis();
			String id = "C" + String.valueOf(time).substring(0,8);
			Children children = new Children(id, name, date, gender, reason, health, education, 1, image);
			childrenDAO.insert(children);
			url = "/children_manage.jsp";
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	
	void introduction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("iName");
		String gender = request.getParameter("iGender");
		String dateTmp = request.getParameter("iDate");
		String health = request.getParameter("iHealth");
		String education = request.getParameter("iEducation");
		String reason = request.getParameter("iReason");
		
		String url = "";
		
		UserDAO usDAO= new UserDAO();
		Object obj = request.getSession().getAttribute("user");
		User user=null;
		user= (User)obj;
		
		boolean check;
		try {
			if(user!=null) {
				Introducter_user_DAO in_us_DAO = new Introducter_user_DAO();
				Introducter_user in_us = new Introducter_user();
				in_us= in_us_DAO.selectByIdUser(user);
				if(in_us== null) {
					request.setAttribute("error", "Bạn chưa đăng kí trở thành người giới thiệu!");
					url="/introduction.jsp";
				}
				else {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDate = format.parse(dateTmp);
			java.sql.Date date = new java.sql.Date(utilDate.getTime());
			Part file = request.getPart("file-input");
			String image = file.getSubmittedFileName();
			String uploadPath = "D:/workspace_PBL/PBL3/myWeb_trai_tre_mo_coi/src/main/webapp/uploads/children/" + image;
			
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
			
			ChildrenDAO childrenDAO = new ChildrenDAO();
			long time = System.currentTimeMillis();
			String id = "C" + String.valueOf(time).substring(0,8);
			Children children = new Children(id, name, date, gender, reason, health, education, 0, image);
			childrenDAO.insert(children);
			
				ChildrenDAO chDAO= new ChildrenDAO();
				Children ch= new Children();
				ch = chDAO.selectById(name);
				
				
				 	LocalDate localDate = LocalDate.now();
			        Date currentDate = Date.valueOf(localDate);
			        Random rand = new Random();
			         int ranNum = rand.nextInt(1000)+1;
			        String s=Integer.toString(ranNum);
					String id1 ="IN"+s;
					IntroductionDAO inDAO= new IntroductionDAO();
					Introduction in = new Introduction(id1,ch,in_us.getIntroducter(),0,currentDate,reason);
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
			
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void deleteChild(HttpServletRequest request, HttpServletResponse response) {
		try {
			String id = request.getParameter("id");
			ChildrenDAO childrenDAO = new ChildrenDAO();
			Children cr = new Children();
			cr.setOrphanID(id);
			childrenDAO.delete(cr);
			response.sendRedirect("children_manage.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void getInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Children cr = new Children();
		cr.setOrphanID(id);
		ChildrenDAO childrenDAO = new ChildrenDAO();
		Children child = childrenDAO.selectById(cr);
		String url = "";
		request.setAttribute("uName", child.getName());
		request.setAttribute("uGender", child.getGender());
		request.setAttribute("uDate", child.getDate_of_birth());
		request.setAttribute("uHealth", child.getHealth_status());
		request.setAttribute("uEducation", child.getEducation());
		request.setAttribute("uReason", child.getReason());
		request.setAttribute("uState", child.getState());
		request.setAttribute("uPhoto", child.getPhoto());
		request.setAttribute("id", id);
		String mod = request.getParameter("mod");
		if (mod.endsWith("getInfoView")) {
			url = "/childrenView.jsp";
		} else if (mod.equals("getInfo")) {
			url = "/childrenUpdate.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void updateChild(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("uName");
		String gender = request.getParameter("uGender");
		String dateTmp = request.getParameter("uDate");
		String health = request.getParameter("uHealth");
		String education = request.getParameter("uEducation");
		String reason = request.getParameter("uReason");
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
				String uploadPath = "D:/workspace_PBL/PBL3/myWeb_trai_tre_mo_coi/src/main/webapp/uploads/children/" + image;
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

				ChildrenDAO childrenDAO = new ChildrenDAO();
				Children children = new Children(id, name, date, gender, reason, health, education, state, image);
				childrenDAO.update(children);
				url = "/children_manage.jsp";
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

package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.EventDAO;
import model.Event;
import model.Staff;

@WebServlet("/event_controller")
public class event_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public event_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mod = request.getParameter("mod");
		if (mod.equals("insert")) {
			insertEvent(request, response);
		}
		if (mod.equals("delete")) {
			deleteEvent(request, response);
		}
		if (mod.equals("getInfo")) {
			getInfo(request, response);
		}
		if (mod.equals("update")) {
			updateEvent(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void insertEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("iName");
		String location = request.getParameter("iLocation");
		String satffId = request.getParameter("iStaff");
		String numberTmp = request.getParameter("iNumber");
		String dateBeginTmp = request.getParameter("iDateBegin");
		String dateEndTmp = request.getParameter("iDateEnd");
		String sateTmp = request.getParameter("iSate");
		String content = request.getParameter("iContent");	
		int number = Integer.parseInt(numberTmp);
		int state = Integer.parseInt(sateTmp);
		
		String url = "";
		
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDateBegin, utilDateEnd;
			utilDateBegin = format.parse(dateBeginTmp);
			java.sql.Date dateBegin = new java.sql.Date(utilDateBegin.getTime());
			utilDateEnd = format.parse(dateEndTmp);
			java.sql.Date dateEnd = new java.sql.Date(utilDateEnd.getTime());
			
			long time = System.currentTimeMillis();
			String id = "E" + String.valueOf(time).substring(0,8);
			
			Staff staff = new Staff();
			staff.setStaffID(satffId);
			EventDAO eventDAO = new EventDAO();
			Event event = new Event(id, dateBegin, dateEnd, location, name, number, state, staff, content);
			eventDAO.insert(event);
			url = "/event_manage.jsp";
		} catch (ParseException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void deleteEvent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		EventDAO eventDAO = new EventDAO();
		Event event = new Event();
		event.setEventID(id);
		eventDAO.delete(event);
		response.sendRedirect("event_manage.jsp");
	}
	
	private void getInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		EventDAO eventDAO = new EventDAO();
		Event event = new Event();
		event.setEventID(id);
		Event e = eventDAO.selectById(event);
		request.setAttribute("id", e.getEventID());
		request.setAttribute("name", e.getEvent_of_name());
		request.setAttribute("location", e.getLocation());
		request.setAttribute("staffID", e.getStaff().getStaffID());
		request.setAttribute("staffName", e.getStaff().getFullname());
		request.setAttribute("number", e.getNumber_of_children());
		request.setAttribute("dateBegin", e.getDate_begin());
		request.setAttribute("dateEnd", e.getDate_end());
		request.setAttribute("state", e.getState());
		request.setAttribute("content", e.getContent());
		String url = "";
		url = "/eventUpdate.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void updateEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("iName");
		String location = request.getParameter("iLocation");
		String satffId = request.getParameter("iStaff");
		String numberTmp = request.getParameter("iNumber");
		String dateBeginTmp = request.getParameter("iDateBegin");
		String dateEndTmp = request.getParameter("iDateEnd");
		String sateTmp = request.getParameter("iSate");
		String content = request.getParameter("iContent");
		String id = request.getParameter("uId");
		int number = Integer.parseInt(numberTmp);
		int state = Integer.parseInt(sateTmp);
		
		String url = "";
		
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDateBegin, utilDateEnd;
			utilDateBegin = format.parse(dateBeginTmp);
			java.sql.Date dateBegin = new java.sql.Date(utilDateBegin.getTime());
			utilDateEnd = format.parse(dateEndTmp);
			java.sql.Date dateEnd = new java.sql.Date(utilDateEnd.getTime());
			
			Staff staff = new Staff();
			staff.setStaffID(satffId);
			Event event = new Event(id, dateBegin, dateEnd, location, name, number, state, staff, content);
			EventDAO eventDao = new EventDAO();
			eventDao.update(event);
			
			url = "/event_manage.jsp";
		} catch (ParseException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}

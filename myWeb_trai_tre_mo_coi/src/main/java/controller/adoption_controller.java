package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.AdoptionDAO;
import model.Adoption;
import util.Email;

@WebServlet("/adoption_controller")
public class adoption_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public adoption_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mod = request.getParameter("mod");
		if (mod.equals("update")) {
			update(request, response);
		}
		if (mod.equals("delete")) {
			delete(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String url = "";
		
		AdoptionDAO adoptionDAO = new AdoptionDAO();
		Adoption adoption = new Adoption();
		adoption.setAdoptionID(id);
		adoption = adoptionDAO.selectById(adoption);
		adoption.setState(1);
		adoptionDAO.update(adoption);
		
		String adopterID = adoption.getAdopter().getAdopterID();
		String email = adoptionDAO.selectEmail(adopterID);
		String name = adoption.getAdopter().getName();
		String child = adoption.getChild().getName();
		System.out.println("Name "+ name + "child " + child + " email " + email);
		Email.SendEmailAdoption(email, "Xác nhận đơn nhận nuôi được chấp nhận", name, child);
		
		url = "/adoption_manage.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");		
		AdoptionDAO adoptionDAO = new AdoptionDAO();
		Adoption adoption = new Adoption();
		adoption.setAdoptionID(id);
		adoptionDAO.delete(adoption);
		response.sendRedirect("adoption_manage.jsp");
	}

}

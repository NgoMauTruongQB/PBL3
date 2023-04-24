package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DonationDAO;
import model.Donation;

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

}

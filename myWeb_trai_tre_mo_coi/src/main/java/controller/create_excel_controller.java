package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import database.DonationDAO;
import database.donationStatisticsDAO;
import model.Donation;
import model.DonationStatistics;
import model.Monthly_statistics;


@WebServlet("/create_excel_controller")
public class create_excel_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public create_excel_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mod = request.getParameter("mod");
		if (mod.equals("export_monthly_statistics")) {
			export_monthly_statistics(request, response);
		}
		if (mod.equals("export_donation")) {
			export_donation(request, response);
		}
		if (mod.equals("export_donation_statistics")) {
			export_donation_statistics(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void export_monthly_statistics(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");

        Workbook workbook = new XSSFWorkbook();

        Sheet sheet = workbook.createSheet("Thống kê ủng hộ hàng tháng");
        
        Row headerRow = sheet.createRow(0);
        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(true);
        style.setFont(font);
        
        Cell headerCell1 = headerRow.createCell(0);
        headerCell1.setCellValue("Tháng");
        headerCell1.setCellStyle(style);
        Cell headerCell2 = headerRow.createCell(1);
        headerCell2.setCellValue("Tổng tiền nhận được");
        headerCell2.setCellStyle(style);
        
        donationStatisticsDAO dnDao = new donationStatisticsDAO();
    	ArrayList<Monthly_statistics> list = dnDao.selectAllMonth();

        int rowNum = 1;
        for (Monthly_statistics ms : list) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(ms.getMonth() + "/" + ms.getYear());
            row.createCell(1).setCellValue(ms.getTotal());
        }
        
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=\"thong_ke_ung_ho_hang_thang.xlsx\"");
        workbook.write(response.getOutputStream());
        
        String absoluteFilePath = getServletContext().getRealPath("/uploads/excel/thong_ke_ung_ho_hang_thang.xlsx");
        File outputFile = new File(absoluteFilePath);

        FileOutputStream outputStream = new FileOutputStream(outputFile);

        workbook.write(outputStream);

        outputStream.close();
	}
	
	private void export_donation(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");

        Workbook workbook = new XSSFWorkbook();

        Sheet sheet = workbook.createSheet("Danh sách ủng hộ");
        
        Row headerRow = sheet.createRow(0);
        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(true);
        style.setFont(font);
        
        Cell headerCell1 = headerRow.createCell(0);
        headerCell1.setCellValue("Tên Hoạt động");
        headerCell1.setCellStyle(style);
        Cell headerCell2 = headerRow.createCell(1);
        headerCell2.setCellValue("Tên người ủng hộ");
        headerCell2.setCellStyle(style);
        Cell headerCell3 = headerRow.createCell(2);
        headerCell3.setCellValue("Số tiền quyên góp");
        headerCell3.setCellStyle(style);
        Cell headerCell4 = headerRow.createCell(3);
        headerCell4.setCellValue("Số điện thoại");
        headerCell4.setCellStyle(style);
        Cell headerCell5 = headerRow.createCell(4);
        headerCell5.setCellValue("Ngày thực hiện");
        headerCell5.setCellStyle(style);
        Cell headerCell6 = headerRow.createCell(5);
        headerCell6.setCellValue("Trạng thái");
        headerCell6.setCellStyle(style);
        
        DonationDAO dnDao = new DonationDAO();
   		ArrayList<Donation> list = dnDao.selectAll();
   		
        int rowNum = 1;
        for (Donation dn : list) {
        	Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(dn.getActivity().getName_of_activity());
            row.createCell(1).setCellValue(dn.getUser().getFullname());
            row.createCell(2).setCellValue(dn.getAmount_of_money());
            row.createCell(3).setCellValue(dn.getPhoneNumber());
            row.createCell(4).setCellValue(dn.getDate_of_donation());
            String state = (dn.getState() == 1) ? "Hoàn tất" : "Đang xác thực";
            row.createCell(5).setCellValue(state);
        }
        
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=\"danh_sach_ung_ho.xlsx\"");
        workbook.write(response.getOutputStream());
        
        String absoluteFilePath = getServletContext().getRealPath("/uploads/excel/danh_sach_ung_ho.xlsx");
        File outputFile = new File(absoluteFilePath);

        FileOutputStream outputStream = new FileOutputStream(outputFile);

        workbook.write(outputStream);

        outputStream.close();
	}
	
	private void export_donation_statistics(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");

        Workbook workbook = new XSSFWorkbook();

        Sheet sheet = workbook.createSheet("Tình hình gây quỹ");
        
        Row headerRow = sheet.createRow(0);
        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(true);
        style.setFont(font);
        
        Cell headerCell1 = headerRow.createCell(0);
        headerCell1.setCellValue("Tên Hoạt động");
        headerCell1.setCellStyle(style);
        Cell headerCell2 = headerRow.createCell(1);
        headerCell2.setCellValue("Số tiền cần quyên góp");
        headerCell2.setCellStyle(style);
        Cell headerCell3 = headerRow.createCell(2);
        headerCell3.setCellValue("Số tiền đã nhận được");
        headerCell3.setCellStyle(style);
        Cell headerCell4 = headerRow.createCell(3);
        headerCell4.setCellValue("Số tiền còn lại ");
        headerCell4.setCellStyle(style);
        
        donationStatisticsDAO dnDao = new donationStatisticsDAO();
    	ArrayList<DonationStatistics> list = dnDao.selectAll();

        int rowNum = 1;
        for (DonationStatistics dn : list) {
        	Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(dn.getName());
            row.createCell(1).setCellValue(dn.getMoney_collected());
            row.createCell(2).setCellValue(dn.getAmount_of_money());
            double s = dn.getMoney_collected() - dn.getAmount_of_money();
            row.createCell(3).setCellValue(s);
        }
        
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=\"thong_ke_tinh_hinh_gay_quy.xlsx\"");
        workbook.write(response.getOutputStream());
        
        String absoluteFilePath = getServletContext().getRealPath("/uploads/excel/thong_ke_tinh_hinh_gay_quy.xlsx");
        File outputFile = new File(absoluteFilePath);

        FileOutputStream outputStream = new FileOutputStream(outputFile);

        workbook.write(outputStream);

        outputStream.close();
	}

}

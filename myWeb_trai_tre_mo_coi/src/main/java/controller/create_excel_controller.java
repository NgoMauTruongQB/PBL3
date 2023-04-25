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
import model.Donation;

import java.io.IOException;


@WebServlet("/create_excel_controller")
public class create_excel_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public create_excel_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// tạo workbook mới
        Workbook workbook = new XSSFWorkbook();
        
        // tạo sheet mới
        Sheet sheet = workbook.createSheet("Danh sách ủng hộ");
        
        // thêm các tiêu đề cho sheet
        Row headerRow = sheet.createRow(0);
        Cell headerCell1 = headerRow.createCell(0);
        headerCell1.setCellValue("ID");
        Cell headerCell2 = headerRow.createCell(1);
        headerCell2.setCellValue("Họ tên");
        Cell headerCell3 = headerRow.createCell(2);
        headerCell3.setCellValue("Email");
        
        // TODO: ghi dữ liệu vào sheet
        // lấy danh sách sinh viên
        DonationDAO donationDAO = new DonationDAO();
        ArrayList<Donation> donations = donationDAO.selectAll();

        // ghi dữ liệu vào sheet
        int rowNum = 1;
        for (Donation donation : donations) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(donation.getDonationID());
            row.createCell(1).setCellValue(donation.getAmount_of_money());
            row.createCell(2).setCellValue(donation.getPhoneNumber());
        }
        
        // xuất file Excel
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=\"danh_sach_sinh_vien.xlsx\"");
        workbook.write(response.getOutputStream());
        
        String absoluteFilePath = getServletContext().getRealPath("/uploads/danh_sach_sinh_vien.xlsx");
        File outputFile = new File(absoluteFilePath);

        FileOutputStream outputStream = new FileOutputStream(outputFile);

        // ghi nội dung của file Excel vào outputStream
        workbook.write(outputStream);

        // đóng outputStream
        outputStream.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}

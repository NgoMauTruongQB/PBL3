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

import database.StaffDAO;
import model.Staff;


@WebServlet("/create_excel_controller")
public class create_excel_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public create_excel_controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mod = request.getParameter("mod");
		if (mod.equals("export")) {
			export_children(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void export_children(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		// tạo workbook mới
        Workbook workbook = new XSSFWorkbook();
        
        // tạo sheet mới
        Sheet sheet = workbook.createSheet("Danh sách nhận viên");
        
        // thêm các tiêu đề cho sheet
        Row headerRow = sheet.createRow(0);
        Cell headerCell1 = headerRow.createCell(0);
        headerCell1.setCellValue("ID");
        Cell headerCell2 = headerRow.createCell(1);
        headerCell2.setCellValue("Họ và tên");
        Cell headerCell3 = headerRow.createCell(2);
        headerCell3.setCellValue("Ngày sinh");
        Cell headerCell4 = headerRow.createCell(3);
        headerCell4.setCellValue("Giới tính");
        Cell headerCell5 = headerRow.createCell(4);
        headerCell5.setCellValue("Vị trí");
        Cell headerCell6 = headerRow.createCell(5);
        headerCell6.setCellValue("Trạng thái");
        Cell headerCell7 = headerRow.createCell(6);
        headerCell7.setCellValue("Số điện thoại");
        Cell headerCell8 = headerRow.createCell(7);
        headerCell8.setCellValue("Email");
        
        // lấy danh sách nhân viên
        StaffDAO staffDAO = new StaffDAO();
        ArrayList<Staff> staff = staffDAO.selectAll();

        // ghi dữ liệu vào sheet
        int rowNum = 1;
        for (Staff st : staff) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(st.getStaffID());
            row.createCell(1).setCellValue(st.getFullname());
            row.createCell(2).setCellValue(st.getDate_of_birth());
            row.createCell(3).setCellValue(st.getState());
            row.createCell(4).setCellValue(st.getPosition());
            row.createCell(5).setCellValue(st.getState());
            row.createCell(6).setCellValue(st.getPhone());
            row.createCell(7).setCellValue(st.getEmail());
        }
        
        // xuất file Excel
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=\"danh_sach_nhan_vien.xlsx\"");
        workbook.write(response.getOutputStream());
        
        String absoluteFilePath = getServletContext().getRealPath("/uploads/danh_sach_nhan_vien.xlsx");
        File outputFile = new File(absoluteFilePath);

        FileOutputStream outputStream = new FileOutputStream(outputFile);

        // ghi nội dung của file Excel vào outputStream
        workbook.write(outputStream);

        // đóng outputStream
        outputStream.close();
	}

}

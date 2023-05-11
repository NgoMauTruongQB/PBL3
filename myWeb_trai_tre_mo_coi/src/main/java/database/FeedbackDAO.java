package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import javax.swing.event.ListDataEvent;

import model.Feedback;
import model.Staff;

public class FeedbackDAO implements DAOInterface<Feedback>{

	@Override
	public ArrayList<Feedback> selectAll() {
		ArrayList<Feedback> result = new ArrayList<Feedback>();
		try {
			//Bước 1
			Connection con = JDBCUtil.getConnection();
			
			//Bước 2
			String sql = "SELECT * FROM feedback";
			PreparedStatement st = con.prepareStatement(sql);
			
			//Thực thi câu lệnh SQL 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			//bước 4 
			while(rs.next()) {
				String feedbackID = rs.getString("feedbackID");
				Date date_of_feedback = rs.getDate("date_of_feedback");
				String staffID = rs.getString("staffID");
				String content_of_feedback = rs.getString("content_of_feedback");
				int rating = rs.getInt("rating");
				
				Staff nv = new Staff();
				nv.setStaffID(staffID);
				
				Staff staff = (new StaffDAO().selectById(nv));
				
				Feedback fb = new Feedback(feedbackID, date_of_feedback, staff, content_of_feedback, rating);
				result.add(fb);
			}
			
			//Bước 5
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Feedback selectById(Feedback t) {
		Feedback result = null;
		try {
			//Bước 1
			Connection con = JDBCUtil.getConnection();
			
			//Tạo ra đối tượng Statement 
			String sql = "SELECT * FROM feedback WHERE feedbackID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getFeedbackID());
			
			//Thực thi câu lệnh SQL 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			//Lấy thông tin 
			while(rs.next()) {
				String feedbackID = rs.getString("feedbackID");
				Date date_of_feedback = rs.getDate("date_of_feedback");
				String staffID = rs.getString("staffID");
				String content_of_feedback = rs.getString("content_of_feedback");
				int rating = rs.getInt("rating");
				
				Staff nv = new Staff();
				nv.setStaffID(staffID);
				
				Staff staff = (new StaffDAO().selectById(nv));
				
				result = new Feedback(feedbackID, date_of_feedback, staff, content_of_feedback, rating);
				break;
			}
			
			//Đóng cơ sở dữ liệu
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insert(Feedback t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO feedback (feedbackID, date_of_feedback, staffID, content_of_feedback, rating) "+
					" VALUES (?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getFeedbackID());
			st.setDate(2, t.getDate_of_feedback());
			st.setString(3, t.getStaff().getStaffID());
			st.setString(4, t.getContent_of_feedback());
			st.setInt(5, t.getRating());
			
			// Bước 3: thực thi câu lệnh SQL
			result = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ result+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int insertAll(ArrayList<Feedback> arr) {
		int count = 0;
		for (Feedback feedback : arr) {
			count = count + this.insert(feedback);
		}
		return count;
	}

	@Override
	public int delete(Feedback t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE from feedback "+
					 " WHERE feedbackID =?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getFeedbackID());
			
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			result = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ result+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteAll(ArrayList<Feedback> arr) {
		int count = 0;
		for (Feedback feedback : arr) {
			count = count + this.delete(feedback);
		}
		return count;
	}

	@Override
	public int update(Feedback t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE feedback "+
					 " SET " +
					 " date_of_feedback=?"+
					 ", staffID=?"+
					 ", content_of_feedback=?"+
					 ", rating=?"+
					 " WHERE feedbackID=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setDate(1, t.getDate_of_feedback());
			st.setString(2, t.getStaff().getStaffID());
			st.setString(3, t.getContent_of_feedback());
			st.setInt(4, t.getRating());
			st.setString(5, t.getFeedbackID());
			
			Staff nv = new Staff();
			nv.setStaffID(t.getStaff().getStaffID());
			
			Staff staff = (new StaffDAO().selectById(nv));
			
			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			result = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ result+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public static void main(String[] args) {
		FeedbackDAO fbd = new FeedbackDAO();
//		ArrayList<Feedback> fb = fbd.selectAll();
//		for (Feedback feedback : fb) {
//			System.out.println(fb.toString());
//		}
		
//		Feedback fb = new Feedback();
//		fb.setFeedbackID("FB1221");
//		
//		Feedback feedback = fbd.selectById(fb);
//		System.out.println(feedback.toString());
		
//		Staff st = new Staff("ST12115","Hoàng Thị Dịu",new Date(1999,07,25),"Nữ","Nhân viên vệ sinh",1);
//		Feedback fb = new Feedback("FB11214",new Date(2023-1900, 2, 26),st,"Nhân viên hướng dẫn tận tình",5);
//		fbd.insert(fb);
		
//		Staff st = new Staff();
//		st.setStaffID("ST12112");
//		Staff st2 = new Staff();
//		st.setStaffID("123331");
//		ArrayList<Feedback> fb = new ArrayList<Feedback>();
//		fb.add(new Feedback("FB4512", new Date(2023,02,27), st, "Bảo vệ khó tính", 2));
//		fb.add(new Feedback("FB4513", new Date(2023,03,27), st, "Thân thiện", 5));
//		fb.add(new Feedback("123331", new Date(2023,06,22), st,"", 5));
//		fbd.insertAll(fb);
		
		Staff st = new Staff();
		st.setStaffID("ST12113");
		Feedback t = new Feedback("FB3212",new Date(2023-1900,12,12),st,"Tốt",4);
		fbd.update(t);
			
	}

}

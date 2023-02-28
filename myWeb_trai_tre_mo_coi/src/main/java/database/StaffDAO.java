package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Staff;

public class StaffDAO implements DAOInterface<Staff> {

	@Override
	public ArrayList<Staff> selectAll() {
		ArrayList<Staff> result = new ArrayList<Staff>();
		try {
			//Kết nối với CSDL
			Connection con = JDBCUtil.getConnection();
			
			//Tạo ra đối tượng Statement 
			String sql = "SELECT * FROM staff";
			PreparedStatement st = con.prepareStatement(sql);
			
			//Thực thi câu lệnh SQL 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			//Lấy thông tin 
			while(rs.next()) {
				String staffID = rs.getString("staff_id");
				String fullname = rs.getString("fullname");
				Date date_of_birth = rs.getDate("date_of_birth");
				String gender = rs.getString("gender");
				String position = rs.getString("position");
				int state = rs.getInt("state");
				
				Staff s = new Staff(staffID, fullname, date_of_birth, gender, position, state);
				result.add(s);
			}
			
			//Đóng cơ sở dữ liệu
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Staff selectById(Staff t) {
		Staff result = null;
		try {
			//Kết nối với CSDL
			Connection con = JDBCUtil.getConnection();
			
			//Tạo ra đối tượng Statement 
			String sql = "SELECT * FROM staff WHERE staff_id=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getStaffID());
			
			//Thực thi câu lệnh SQL 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			//Lấy thông tin 
			while(rs.next()) {
				String staffID = rs.getString("staff_id");
				String fullname = rs.getString("fullname");
				Date date_of_birth = rs.getDate("date_of_birth");
				String gender = rs.getString("gender");
				String position = rs.getString("position");
				int state = rs.getInt("state");
				
				result = new Staff(staffID, fullname, date_of_birth, gender, position, state);
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
	public int insert(Staff t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO staff (staff_id, fullname, date_of_birth, gender, position, state) "+
					" VALUES (?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getStaffID());
			st.setString(2, t.getFullname());
			st.setDate(3, t.getDate_of_birth());
			st.setString(4, t.getGender());
			st.setString(5, t.getPosition());
			st.setInt(6, t.getState());
			
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
	public int insertAll(ArrayList<Staff> arr) {
		int count = 0;
		for (Staff staff : arr) {
			count = count + this.insert(staff);
		}
		return count;
	}

	@Override
	public int delete(Staff t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "DELETE from staff "+
					 " WHERE staff_id=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getStaffID());
			
			// Bước 3:
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

	@Override
	public int deleteAll(ArrayList<Staff> arr) {
		int count = 0;
		for (Staff staff : arr) {
			count = count + this.delete(staff);
		}
		return count;
	}
	
	@Override
	public int update(Staff t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE staff "+
					 " SET " +
					 " fullname=?"+
					 ", date_of_birth=?"+
					 ", gender=?"+
					 ", position=?"+
					 ", state=?"+
					 " WHERE staff_id=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getFullname());
			st.setDate(2, t.getDate_of_birth());
			st.setString(3, t.getGender());
			st.setString(4, t.getPosition());
			st.setInt(5, t.getState());
			st.setString(6, t.getStaffID());
			
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
		StaffDAO std = new StaffDAO();
//		ArrayList<Staff> kq = std.selectAll();
//		for (Staff staff : kq) {
//			System.out.println(staff.toString());
//		}
//		
//		Staff st = std.selectById(new Staff("111221","",null,"","",0));
//		System.out.println(st);
		
//		Staff st_new = new Staff("ST12119","Trần Lê Minh",new Date(2000-1900, 10, 10),"Nam","Nhân viên chăm sóc",1);
//		std.insert(st_new);
		
		Staff st_new = new Staff();
		st_new.setStaffID("ST12119");
		std.delete(st_new);
		
//		Staff st_new = new Staff("123331","Nguyễn Viết Hoài Bảo ",new Date(1998-1900, 11, 28),"Nam","Bảo vệ",1);
//		std.update(st_new);
		
	}
}


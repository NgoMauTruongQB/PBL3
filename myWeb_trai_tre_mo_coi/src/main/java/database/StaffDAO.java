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
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM staff";
			PreparedStatement st = con.prepareStatement(sql);
			 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String staffID = rs.getString("staff_id");
				String fullname = rs.getString("fullname");
				Date date_of_birth = rs.getDate("date_of_birth");
				String gender = rs.getString("gender");
				String position = rs.getString("position");
				int state = rs.getInt("state");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String photo = rs.getString("photo");
				
				Staff s = new Staff(staffID, fullname, date_of_birth, gender, position, state, phone, email, photo);
				result.add(s);
			}
			
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
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM staff WHERE staff_id=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getStaffID());
			 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			 
			while(rs.next()) {
				String staffID = rs.getString("staff_id");
				String fullname = rs.getString("fullname");
				Date date_of_birth = rs.getDate("date_of_birth");
				String gender = rs.getString("gender");
				String position = rs.getString("position");
				int state = rs.getInt("state");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String photo = rs.getString("photo");
				
				result = new Staff(staffID, fullname, date_of_birth, gender, position, state, phone, email, photo);
				break;
			}
			
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
			Connection con = JDBCUtil.getConnection();
			
			String sql = "INSERT INTO staff (staff_id, fullname, date_of_birth, gender, position, state, phone, email, photo) "+
					" VALUES (?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getStaffID());
			st.setString(2, t.getFullname());
			st.setDate(3, t.getDate_of_birth());
			st.setString(4, t.getGender());
			st.setString(5, t.getPosition());
			st.setInt(6, t.getState());
			st.setString(7, t.getPhone());
			st.setString(8, t.getEmail());
			st.setString(9, t.getPhoto());
			
			result = st.executeUpdate();
			
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ result+" dòng bị thay đổi!");
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
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
			
			System.out.println(sql);
			result = st.executeUpdate();
			
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ result+" dòng bị thay đổi!");
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
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
			Connection con = JDBCUtil.getConnection();
			
			String sql = "UPDATE staff "+
					 " SET " +
					 " fullname=?"+
					 ", date_of_birth=?"+
					 ", gender=?"+
					 ", position=?"+
					 ", state=?"+
					 ", phone=?"+
					 ", email=?"+
					 ", photo=?"+
					 " WHERE staff_id=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getFullname());
			st.setDate(2, t.getDate_of_birth());
			st.setString(3, t.getGender());
			st.setString(4, t.getPosition());
			st.setInt(5, t.getState());
			st.setString(6, t.getPhone());
			st.setString(7, t.getEmail());
			st.setString(8, t.getPhoto());
			st.setString(9, t.getStaffID());
			

			System.out.println(sql);
			result = st.executeUpdate();
			
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ result+" dòng bị thay đổi!");
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}


package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Adopter;
import model.Introducter;
import model.Introduction;
import model.Staff;

public class IntroducterDAO implements DAOInterface<Introducter> {

	@Override
	public ArrayList<Introducter> selectAll() {
		ArrayList<Introducter> result = new ArrayList<Introducter>();
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM introducter";
			PreparedStatement st = con.prepareStatement(sql);
			
			//Thực thi
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String introducterID = rs.getString("introducterID");
				String name = rs.getString("name");
				String phonenumber = rs.getString("phonenumber");
				String address = rs.getString("address");
				String note = rs.getString("note");
				
				Introducter s = new Introducter(introducterID, name, phonenumber, address, note);
				result.add(s);
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Introducter selectById(Introducter t) {
		Introducter result = null;
		try {
			//Bước 1
			Connection con = JDBCUtil.getConnection();
			
			//Tạo ra đối tượng Statement 
			String sql = "SELECT * FROM introducter WHERE introducterID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getIntroducterID());
			
			//Thực thi câu lệnh SQL 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			//Lấy thông tin 
			while(rs.next()) {
				String introducterID = rs.getString("introducterID");
				String name = rs.getString("name");
				String phonenumber = rs.getString("phonenumber");
				String address = rs.getString("address");
				String note = rs.getString("note");
				
				result = new Introducter(introducterID, name, phonenumber, address, note);
			}
			
			//Đóng cơ sở dữ liệu
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insert(Introducter t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO introducter (introducterID, name, phonenumber, address, note) "+
					" VALUES (?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getIntroducterID());
			st.setString(2, t.getName());
			st.setString(3, t.getPhoneNumber());
			st.setString(4, t.getAddress());
			st.setString(5, t.getNote());
			
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
	public int insertAll(ArrayList<Introducter> arr) {
		int count = 0;
		for (Introducter introducter : arr) {
			count = count + this.insert(introducter);
		}
		return count;
	}

	@Override
	public int delete(Introducter t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE FROM introducter"
					+ " WHERE introducterID = ? ";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getIntroducterID());
			
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
	public int deleteAll(ArrayList<Introducter> arr) {
		int count = 0;
		for (Introducter introducter : arr) {
			count = count + this.delete(introducter);
		}
		return count;
	}

	@Override
	public int update(Introducter t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE introducter "+
					 " SET " +
					 " name=?"+
					 ", phonenumber=?"+
					 ", address=?"+
					 ", note=?"+
					 " WHERE introducterID=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getName());
			st.setString(2, t.getPhoneNumber());
			st.setString(3, t.getAddress());
			st.setString(4, t.getNote());
			st.setString(5, t.getIntroducterID());
			
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
		IntroducterDAO itd = new IntroducterDAO();
		
//		ArrayList<Introducter> list = itd.selectAll();
//		for (Introducter introducter : list) {
//			System.out.println(introducter.toString());
//		}
		
//		Introducter i = new Introducter();
//		i.setIntroducterID("11112211");
//		System.out.println(itd.selectById(i).toString());
		
//		Introducter i = new Introducter("GT001", "Phạm Thị Linh", "098122131", "Thành phố Huế, Thừa Thiên Huế", null);
//		itd.insert(i);
		
//		Introducter i = new Introducter("GT001", "Phạm Thị Linh", "098122131", "Thành phố Huế, Thừa Thiên Huế", null);
//		itd.delete(i);
		
		Introducter i = new Introducter("GT002", "Phan Thị Ánh Ngọc", "0923278191", "Quảng Ninh, Quảng Bình", null);
		itd.update(i);
	}
}

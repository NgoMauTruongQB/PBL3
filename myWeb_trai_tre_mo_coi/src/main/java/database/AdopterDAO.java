package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Adopter;
import model.Feedback;
import model.Staff;

public class AdopterDAO implements DAOInterface<Adopter> {

	@Override
	public ArrayList<Adopter> selectAll() {
		ArrayList<Adopter> result = new ArrayList<Adopter>();
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * from adopter";
			PreparedStatement st = con.prepareStatement(sql);
			
			//Thực thi 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String apdoterID = rs.getString("apdoterID");
				String name = rs.getString("name");
				String phoneNumber = rs.getString("phonenumber");
				String address = rs.getString("address");
				String cmnd = rs.getString("cmnd");
				String note = rs.getString("note");
				
				Adopter ad = new Adopter(apdoterID, name, phoneNumber, address, cmnd, note);
				result.add(ad);
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Adopter selectById(Adopter t) {
		Adopter result = null;
		try {
			//Bước 1
			Connection con = JDBCUtil.getConnection();
			
			//Tạo ra đối tượng Statement 
			String sql = "SELECT * FROM adopter WHERE apdoterID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getAdopterID());
			
			//Thực thi câu lệnh SQL 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			//Lấy thông tin 
			while(rs.next()) {
				String apdoterID = rs.getString("apdoterID");
				String name = rs.getString("name");
				String phoneNumber = rs.getString("phonenumber");
				String address = rs.getString("address");
				String cmnd = rs.getString("cmnd");
				String note = rs.getString("note");
				
				result = new Adopter(apdoterID, name, phoneNumber, address, cmnd, note);
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
	public int insert(Adopter t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO adopter (apdoterID, name, phonenumber, address, cmnd, note) "+
					" VALUES (?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getAdopterID());
			st.setString(2, t.getName());
			st.setString(3, t.getPhoneNumber());
			st.setString(4, t.getAddress());
			st.setString(5, t.getCmnd());
			st.setString(6, t.getNote());
			
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
	public int insertAll(ArrayList<Adopter> arr) {
		int count = 0;
		for (Adopter adopter : arr) {
			count = count + this.insert(adopter);
		}
		return count;
	}

	@Override
	public int delete(Adopter t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE FROM adopter"
					+ " WHERE apdoterID = ? ";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getAdopterID());
			
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
	public int deleteAll(ArrayList<Adopter> arr) {
		int count = 0;
		for (Adopter adopter : arr) {
			count = count + this.delete(adopter);
		}
		return count;
	}

	@Override
	public int update(Adopter t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE adopter "+
					 " SET " +
					 " name=?"+
					 ", phonenumber=?"+
					 ", address=?"+
					 ", cmnd=?"+
					 ", note=?"+
					 " WHERE apdoterID=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getName());
			st.setString(2, t.getPhoneNumber());
			st.setString(3, t.getAddress());
			st.setString(4, t.getCmnd());
			st.setString(5, t.getNote());
			st.setString(6, t.getAdopterID());
			
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
		AdopterDAO add = new AdopterDAO();
		
		ArrayList<Adopter> l = add.selectAll();
		for (Adopter adopter : l) {
			System.out.println(adopter.toString());
		}
		
//		Adopter ad = new Adopter();
//		ad.setAdopterID("NN1231");
//		System.out.println(add.selectById(ad).toString());
		
//		Adopter ad = new Adopter("NN1235","Thái Khắc Dược", "0354123184", "Điện Bàn, Quảng Nam", "012111221", null);
//		add.insert(ad);
		
//		ArrayList<Adopter> l = new ArrayList<>();
//		l.add(new Adopter("NN1236","Nguyễn Đức Dũng", "0915432189", "Lộc Hà, Hà Tĩnh", "0452021121", null));
//		l.add(new Adopter("NN1237","Phạm Đình Hà", "0928915471", "Lệ Thuỷ, Quảng Bình", "044200123129", null));
//		add.insertAll(l);
		
//		Adopter ad = new Adopter("NN1237","Thái Khắc Dược", "0354123184", "Điện Bàn, Quảng Nam", "012111221", null);
//		add.delete(ad);
		
//		ArrayList<Adopter> l = new ArrayList<>();
//		l.add(new Adopter("NN1236","Nguyễn Đức Dũng", "0915432189", "Lộc Hà, Hà Tĩnh", "0452021121", null));
//		l.add(new Adopter("NN1237","Phạm Đình Hà", "0928915471", "Lệ Thuỷ, Quảng Bình", "044200123129", null));
//		add.deleteAll(l);
		
//		Adopter ad = new Adopter("NN1238","Nguyễn Thu Hà", "012122165", "Đồng Hới, Quảng Bình", "044199001121", null);
//		add.update(ad);
		
	}
}

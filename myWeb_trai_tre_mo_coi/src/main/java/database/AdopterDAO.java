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
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM adopter WHERE apdoterID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getAdopterID());
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			 
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
			Connection con = JDBCUtil.getConnection();
			
			String sql = "INSERT INTO adopter (apdoterID, name, phonenumber, address, cmnd, note) "+
					" VALUES (?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getAdopterID());
			st.setString(2, t.getName());
			st.setString(3, t.getPhoneNumber());
			st.setString(4, t.getAddress());
			st.setString(5, t.getCmnd());
			st.setString(6, t.getNote());
			
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
			Connection con = JDBCUtil.getConnection();
			
			String sql = "DELETE FROM adopter"
					+ " WHERE apdoterID = ? ";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getAdopterID());
			
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
			Connection con = JDBCUtil.getConnection();
			
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
	
	public boolean checkCmnd(String cmnd) {
		boolean result = false;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM adopter WHERE cmnd = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,cmnd);
			
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				return true;
			}
			
			JDBCUtil.closeConnection(con);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean checkCmndDiferentId(String cmnd, String id) {
		boolean result = false;
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM adopter WHERE cmnd = ? AND  apdoterID <> ?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, cmnd);
			st.setString(2, id);
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				return true;
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}

package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Charity_activities;
import model.Donation;
import model.Feedback;
import model.Staff;
import model.User;

public class DonationDAO implements DAOInterface<Donation> {

	@Override
	public ArrayList<Donation> selectAll() {
		ArrayList<Donation> result = new ArrayList<Donation>();
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM donation";
			PreparedStatement st = con.prepareStatement(sql);
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			//bước 4 
			while(rs.next()) {
				String donationID = rs.getString("donationID");
				Double amount_of_money = rs.getDouble("amount_of_money");
				String state = rs.getString("state");
				String phoneNumber = rs.getString("phoneNumber");
				Date date_of_donation = rs.getDate("date_of_donation");
				String activityID = rs.getString("activityID");
				String userID = rs.getString("userID");
				
				Charity_activities ca = new Charity_activities();
				ca.setActivityID(activityID);
				Charity_activities charity_activities = (new Charity_activitiesDAO().selectById(ca));
				
				User u = new User();
				u.setId(userID);
				User user = (new UserDAO().selectById(u));
				
				Donation d = new Donation(donationID, amount_of_money, state, phoneNumber, date_of_donation, charity_activities, user);
				result.add(d);
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Donation selectById(Donation t) {
		Donation result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM donation WHERE donationID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getDonationID());
			
			//
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			//Lấy thông tin 
			while(rs.next()) {
				String donationID = rs.getString("donationID");
				Double amount_of_money = rs.getDouble("amount_of_money");
				String state = rs.getString("state");
				String phoneNumber = rs.getString("phoneNumber");
				Date date_of_donation = rs.getDate("date_of_donation");
				String activityID = rs.getString("activityID");
				String userID = rs.getString("userID");
				
				Charity_activities ca = new Charity_activities();
				ca.setActivityID(activityID);
				Charity_activities charity_activities = (new Charity_activitiesDAO().selectById(ca));
				
				User u = new User();
				u.setId(userID);
				User user = (new UserDAO().selectById(u));
				
				result = new Donation(donationID, amount_of_money, state, phoneNumber, date_of_donation, charity_activities, user);
				break;
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insert(Donation t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "INSERT INTO donation (donationID, amount_of_money, state, phoneNumber, date_of_donation,activityID, userID ) "+
					" VALUES (?,?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getDonationID());
			st.setDouble(2, t.getAmount_of_money());
			st.setString(3, t.getState());
			st.setString(4, t.getPhoneNumber());
			st.setDate(5, t.getDate_of_donation());
			st.setString(6, t.getActivity().getActivityID());
			st.setString(7, t.getUser().getId());
			
			// Bước 3: thực thi câu lệnh SQL
			result = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ result+" dòng bị thay đổi!");
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertAll(ArrayList<Donation> arr) {
		int count = 0;
		for (Donation donation : arr) {
			count = count + this.insert(donation);
		}
		return count;
	}

	@Override
	public int delete(Donation t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "DELETE from donation "+
					 " WHERE donationID =?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getDonationID());
			
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			result = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ result+" dòng bị thay đổi!");
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteAll(ArrayList<Donation> arr) {
		int count = 0;
		for (Donation donation : arr) {
			count = count + this.delete(donation);
		}
		return count;
	}

	@Override
	public int update(Donation t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "UPDATE donation "+
					 " SET " +
					 " amount_of_money=?"+
					 ", state=?"+
					 ", phoneNumber=?"+
					 ", date_of_donation=?"+
					 ", activityID=?"+
					 ", userID=?"+
					 " WHERE donationID=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setDouble(1, t.getAmount_of_money());
			st.setString(2, t.getState());
			st.setString(3, t.getPhoneNumber());
			st.setDate(4, t.getDate_of_donation());
			st.setString(5, t.getActivity().getActivityID());
			st.setString(6, t.getUser().getId());
			st.setString(7, t.getDonationID());
			
			Charity_activities ca = new Charity_activities();
			ca.setActivityID(t.getActivity().getActivityID());
			Charity_activities charity_activities = (new Charity_activitiesDAO().selectById(ca));
			
			User u = new User();
			u.setId(t.getUser().getId());
			User user = (new UserDAO().selectById(u));
			
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			result = st.executeUpdate();
			
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ result+" dòng bị thay đổi!");
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public static void main(String[] args) {
		DonationDAO dnd = new DonationDAO();
		
		Charity_activities c = new Charity_activities();
		c.setActivityID("HD1221"); // HD1202 HD1221
		
		User u = new User();
		u.setId("U002"); // U003
		
//		Donation dns = new Donation("DN001", 200000, "Đang xác thực", "0921233432", new Date(2023-1900,02,22), c, u);
//		dnd.insert(dns);
		
//		ArrayList<Donation> list = dnd.selectAll();
//		for (Donation donation : list) {
//			System.out.println(donation.toString());
//		}
//		Donation dns = new Donation("DN003", 30000, "Hoàn tất", "0398683741", new Date(2023-1900,02,22), c, u);
//		dnd.update(dns);
//		dnd.selectById(dns);
//		System.out.println(dnd.selectById(dns).toString());
	}
}

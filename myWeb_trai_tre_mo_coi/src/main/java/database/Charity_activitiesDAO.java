package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Charity_activities;
import model.Feedback;
import model.Staff;

public class Charity_activitiesDAO implements DAOInterface<Charity_activities> {

	@Override
	public ArrayList<Charity_activities> selectAll() {
		ArrayList<Charity_activities> result = new ArrayList<Charity_activities>();
		try {
			Connection con = JDBCUtil.getConnection();
			

			String sql = "SELECT * FROM charity_activities";
			PreparedStatement st = con.prepareStatement(sql);
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String activityID = rs.getString("activityID");
				String name_of_activity = rs.getString("name_of_activity");
				Date date_begin = rs.getDate("date_begin");
				Date date_end = rs.getDate("date_end");
				double money_collected = rs.getDouble("money_collected");
				String purpose_of_activity = rs.getString("purpose_of_activity");
				String staffID = rs.getString("staffID");
				String photo = rs.getString("photo");
				
				Staff nv = new Staff();
				nv.setStaffID(staffID);
				Staff staff = (new StaffDAO().selectById(nv));
				
				Charity_activities ca = new Charity_activities(activityID, name_of_activity, date_begin, date_end, money_collected, purpose_of_activity, staff, photo);
				result.add(ca);
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Charity_activities selectById(Charity_activities t) {
		Charity_activities result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM charity_activities WHERE activityID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getActivityID());
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String activityID = rs.getString("activityID");
				String name_of_activity = rs.getString("name_of_activity");
				Date date_begin = rs.getDate("date_begin");
				Date date_end = rs.getDate("date_end");
				Double money_collected = rs.getDouble("money_collected");
				String purpose_of_activity = rs.getString("purpose_of_activity");
				String staffID = rs.getString("staffID");
				String photo = rs.getString("photo");
				
				Staff nv = new Staff();
				nv.setStaffID(staffID);
				Staff staff = (new StaffDAO().selectById(nv));
				
				result = new Charity_activities(activityID, name_of_activity, date_begin, date_end, money_collected, purpose_of_activity, staff, photo);
				break;
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insert(Charity_activities t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "INSERT INTO charity_activities (activityID, name_of_activity, date_begin, date_end, money_collected, purpose_of_activity, staffID, photo) "+
					" VALUES (?,?,?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getActivityID());
			st.setString(2, t.getName_of_activity());
			st.setDate(3, t.getDate_begin());
			st.setDate(4, t.getDate_end());
			st.setDouble(5, t.getMoney_collected());
			st.setString(6, t.getPurpose_of_activity());
			st.setString(7, t.getStaff().getStaffID());
			st.setString(8, t.getPhoto());
			
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

	@Override
	public int insertAll(ArrayList<Charity_activities> arr) {
		int count = 0;
		for (Charity_activities charity_activities : arr) {
			count = count + this.insert(charity_activities);
		}
		return count;
	}

	@Override
	public int delete(Charity_activities t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "DELETE from charity_activities "+
					 " WHERE activityID =?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getActivityID());
			
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
	public int deleteAll(ArrayList<Charity_activities> arr) {
		int count = 0;
		for (Charity_activities charity_activities : arr) {
			count = count + this.delete(charity_activities);
		}
		return count;
	}

	@Override
	public int update(Charity_activities t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "UPDATE charity_activities "+
					 " SET " +
					 " name_of_activity=?"+
					 ", date_begin=?"+
					 ", date_end=?"+
					 ", money_collected=?"+
					 ", purpose_of_activity=?"+
					 ", staffID=?"+
					 ", photo=?"+
					 " WHERE activityID=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getName_of_activity());
			st.setDate(2, t.getDate_begin());
			st.setDate(3, t.getDate_end());
			st.setDouble(4, t.getMoney_collected());
			st.setString(5, t.getPurpose_of_activity());
			st.setString(6, t.getStaff().getStaffID());
			st.setString(7, t.getPhoto());
			st.setString(8, t.getActivityID());
			
			Staff nv = new Staff();
			nv.setStaffID(t.getStaff().getStaffID());
			Staff staff = (new StaffDAO().selectById(nv));
			
			
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

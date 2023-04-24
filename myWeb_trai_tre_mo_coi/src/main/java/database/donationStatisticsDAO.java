package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Charity_activities;
import model.Donation;
import model.DonationStatistics;
import model.Monthly_statistics;
import model.User;

public class donationStatisticsDAO implements DAOInterface<DonationStatistics> {

	@Override
	public ArrayList<DonationStatistics> selectAll() {
		ArrayList<DonationStatistics> result = new ArrayList<>();
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT charity_activities.activityID, charity_activities.name_of_activity, charity_activities.money_collected,"
					+ "SUM(donation.amount_of_money) AS total_amount_of_money "
					+ "FROM charity_activities JOIN donation "
					+ "ON charity_activities.activityID = donation.activityID "
					+ "WHERE donation.state = 1 "
					+ "GROUP BY charity_activities.activityID, charity_activities.name_of_activity, charity_activities.money_collected; ";
			PreparedStatement st = con.prepareStatement(sql);
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			 
			while(rs.next()) {
				String id = rs.getString("activityID");
				String name = rs.getString("name_of_activity");
				Double money_collected = rs.getDouble("money_collected");
				Double total_amount_of_money = rs.getDouble("total_amount_of_money");
				
				DonationStatistics ds = new DonationStatistics(id, name, money_collected, total_amount_of_money);
				result.add(ds);
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	

	public ArrayList<Monthly_statistics> selectAllMonth() {
		ArrayList<Monthly_statistics> result = new ArrayList<>();
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT YEAR(date_of_donation) AS year, MONTH(date_of_donation) AS month, SUM(donation.amount_of_money) AS total_amount_of_money"
					   + " FROM donation"
					   + " GROUP BY YEAR(date_of_donation), MONTH(date_of_donation)"
					   + " ORDER BY YEAR(date_of_donation) DESC, MONTH(date_of_donation) DESC;";
			PreparedStatement st = con.prepareStatement(sql);
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			 
			while(rs.next()) {
				int year = rs.getInt("year");
				int month = rs.getInt("month");
				Double total = rs.getDouble("total_amount_of_money");
				
				Monthly_statistics ds = new Monthly_statistics(year, month, total);
				result.add(ds);
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public DonationStatistics selectById(DonationStatistics t) {
		return null;
	}

	@Override
	public int insert(DonationStatistics t) {
		return 0;
	}

	@Override
	public int insertAll(ArrayList<DonationStatistics> arr) {
		return 0;
	}

	@Override
	public int delete(DonationStatistics t) {
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<DonationStatistics> arr) {
		return 0;
	}

	@Override
	public int update(DonationStatistics t) {
		return 0;
	}
}

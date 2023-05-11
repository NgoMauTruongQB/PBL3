package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.User;
import model.Adopter;
import model.Adopter_user;

public class Adopter_user_DAO {
	private User adopterID;
	// Thêm một bản ghi vào bảng trung gian
		public void addAdopterUser( Adopter adopter ,User user) {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO adopter_user (userID,adopterID ) VALUES (?, ?)";
			try (
				PreparedStatement statement = con.prepareStatement(sql)) {
				statement.setString(1, user.getId());
				statement.setString(2, adopter.getAdopterID());
				statement.executeUpdate();
				JDBCUtil.closeConnection(con);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		// xóa 
		public void deleteAdopterUser( User user) {
			String sql = "DELETE FROM adopter_user WHERE userID = ? ";
			try (Connection con = JDBCUtil.getConnection();
					PreparedStatement statement = con.prepareStatement(sql)) {
				statement.setString(1, user.getId());
				
				statement.executeUpdate();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		// tìm kiếm theo user
		public Adopter_user selectByIdUser(User t) {
			Adopter_user result = null;
			try {
				Connection con = JDBCUtil.getConnection();
				
				String sql = "SELECT * FROM adopter_user WHERE userID=?";
				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, t.getId());
				
				System.out.println(sql);
				ResultSet rs = st.executeQuery();
				 
				while(rs.next()) {
					String userID = rs.getString("userID");
					String adopterID = rs.getString("adopterID");
					User us = new User();
					us.setId(userID);
					User user = (new UserDAO().selectById(us));
					Adopter ad = new Adopter();
					ad.setAdopterID(adopterID);
					Adopter adopter = (new AdopterDAO().selectById(ad));
					
					
					result = new Adopter_user(user, adopter);
				
					break;
				}
				
				JDBCUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
		}
//		public static void main(String agrs[]) {
//			Adopter_user_DAO ad= new Adopter_user_DAO();
//			ad.
//		}
	

}

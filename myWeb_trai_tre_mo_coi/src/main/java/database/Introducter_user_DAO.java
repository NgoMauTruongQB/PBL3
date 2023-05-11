package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.User;
import model.Adopter;
import model.Adopter_user;
import model.Introducter;
import model.Introducter_user;

public class Introducter_user_DAO {
	private User adopterID;
	// Thêm một bản ghi vào bảng trung gian
		public void addIntroducterUser(Introducter introducter, User user) {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO introducter_user (userID,introducterID ) VALUES (?, ?)";
			try (
				PreparedStatement statement = con.prepareStatement(sql)) {
				statement.setString(1, user.getId());
				statement.setString(2, introducter.getIntroducterID());
				statement.executeUpdate();
				JDBCUtil.closeConnection(con);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		// xóa 
		public void deleteIntroducterUser(Introducter introducter, User user) {
			String sql = "DELETE FROM introducter_user WHERE userID = ? AND introducterID = ?";
			try (Connection con = JDBCUtil.getConnection();
					PreparedStatement statement = con.prepareStatement(sql)) {
				statement.setString(2, introducter.getIntroducterID());
				statement.setString(1, user.getId());
				statement.executeUpdate();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		// tìm kiếm theo user
		public Introducter_user selectByIdUser(User t) {
			Introducter_user result = null;
			try {
				Connection con = JDBCUtil.getConnection();
				
				String sql = "SELECT * FROM introducter_user WHERE userID=?";
				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, t.getId());
				
				System.out.println(sql);
				ResultSet rs = st.executeQuery();
				 
				while(rs.next()) {
					String userID = rs.getString("userID");
					String introducterID = rs.getString("introducterID");
					User us = new User();
					us.setId(userID);
					User user = (new UserDAO().selectById(us));
					Introducter in = new Introducter();
					in.setIntroducterID(introducterID);
					Introducter introductrer = (new IntroducterDAO().selectById(in));
					
					
					result = new Introducter_user(user, introductrer);
				
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

package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Adopter;
import model.Children;

public class ChildrenDAO implements DAOInterface<Children> {

	@Override
	public ArrayList<Children> selectAll() {
		ArrayList<Children> result = new ArrayList<Children>();
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * from children";
			PreparedStatement st = con.prepareStatement(sql);
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String orphanID = rs.getString("orphanID");
				String name = rs.getString("name");
				Date date_of_birth = rs.getDate("date_of_birth");
				String gender = rs.getString("gender");
				String reason = rs.getString("reason");
				String health_status = rs.getString("health_status");
				String education = rs.getString("education");
				int state = rs.getInt("state");
				String photo = rs.getString("photo");
				
				Children c = new Children(orphanID, name, date_of_birth, gender, reason, health_status, education, state, photo);
				result.add(c);
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Children selectById(Children t) {
		Children result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM children WHERE orphanID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getOrphanID());
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String orphanID = rs.getString("orphanID");
				String name = rs.getString("name");
				Date date_of_birth = rs.getDate("date_of_birth");
				String gender = rs.getString("gender");
				String reason = rs.getString("reason");
				String health_status = rs.getString("health_status");
				String education = rs.getString("education");
				int state = rs.getInt("state");
				String photo = rs.getString("photo");
				
				result = new Children(orphanID, name, date_of_birth, gender, reason, health_status, education, state, photo);
				break;
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public Children selectById(String t) {
		Children result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM children WHERE name=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t);
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String orphanID = rs.getString("orphanID");
				String name = rs.getString("name");
				Date date_of_birth = rs.getDate("date_of_birth");
				String gender = rs.getString("gender");
				String reason = rs.getString("reason");
				String health_status = rs.getString("health_status");
				String education = rs.getString("education");
				int state = rs.getInt("state");
				String photo = rs.getString("photo");
				
				result = new Children(orphanID, name, date_of_birth, gender, reason, health_status, education, state, photo);
				break;
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int insert(Children t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "INSERT INTO children (orphanID, name, date_of_birth, gender, reason, health_status, education, state, photo ) "+
					" VALUES (?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getOrphanID());
			st.setString(2, t.getName());
			st.setDate(3, t.getDate_of_birth());
			st.setString(4, t.getGender());
			st.setString(5, t.getReason());
			st.setString(6, t.getHealth_status());
			st.setString(7, t.getEducation());
			st.setInt(8, t.getState());
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
	public int insertAll(ArrayList<Children> arr) {
		int count = 0;
		for (Children children : arr) {
			count = count + this.insert(children);
		}
		return count;
	}

	@Override
	public int delete(Children t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "DELETE from children "+
					 " WHERE orphanID =?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getOrphanID());

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
	public int deleteAll(ArrayList<Children> arr) {
		int count = 0;
		for (Children children : arr) {
			count = count + this.delete(children);
		}
		return count;
	}

	@Override
	public int update(Children t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "UPDATE children "+
					 " SET " +
					 " name=?"+
					 ", date_of_birth=?"+
					 ", gender=?"+
					 ", reason=?"+
					 ", health_status=?"+
					 ", education=?"+
					 ", state=?"+
					 ", photo=?"+
					 " WHERE orphanID=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getName());
			st.setDate(2, t.getDate_of_birth());
			st.setString(3, t.getGender());
			st.setString(4, t.getReason());
			st.setString(5, t.getHealth_status());
			st.setString(6, t.getEducation());
			st.setInt(7, t.getState());
			st.setString(8, t.getPhoto());
			st.setString(9, t.getOrphanID());

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

package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Feedback;
import model.Staff;
import model.User;

public class UserDAO implements DAOInterface<User> {

	@Override
	public ArrayList<User> selectAll() {
		ArrayList<User> result = new ArrayList<User>();
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM user";
			PreparedStatement st = con.prepareStatement(sql);
			
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String username = rs.getString("username");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String fullname = rs.getString("fullname");
				String role = rs.getString("role");
				int state = rs.getInt("state");
				
				User u = new User(id, username, email, password, fullname, role, state);
				result.add(u);
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public User selectById(User t) {
		User result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM user WHERE id=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getId());
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String username = rs.getString("username");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String fullname = rs.getString("fullname");
				String role = rs.getString("role");
				int state = rs.getInt("state");
				
				result = new User(id, username, email, password, fullname, role, state);
				break;
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public User selectById(String t) {
		User result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			
			//Tạo ra đối tượng Statement 
			String sql = "SELECT * FROM user WHERE id=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t);
			
			//Thực thi câu lệnh SQL 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			//Lấy thông tin 
			while(rs.next()) {
				String id = rs.getString("id");
				String username = rs.getString("username");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String fullname = rs.getString("fullname");
				String role = rs.getString("role");
				int state = rs.getInt("state");
				
				result = new User(id, username, email, password, fullname, role, state);
				break;
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insert(User t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "INSERT INTO user (id, username, email, password, fullname, role, state) "+
					" VALUES (?,?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getId());
			st.setString(2, t.getUsername());
			st.setString(3, t.getEmail());
			st.setString(4, t.getPassword());
			st.setString(5, t.getFullname());
			st.setString(6, t.getRole());
			st.setInt(7, t.getState());
			
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
	public int insertAll(ArrayList<User> arr) {
		int count = 0;
		for (User user : arr) {
			count = count + this.insert(user);
		}
		return count;
	}

	@Override
	public int delete(User t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "DELETE from user "+
					 " WHERE id =?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getId());
			
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
	public int deleteAll(ArrayList<User> arr) {
		int count = 0;
		for (User user : arr) {
			count = count + this.delete(user);
		}
		return count;
	}

	@Override
	public int update(User t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE user "+
					 " SET " +
					 " username=?"+
					 ", email=?"+
					 ", password=?"+
					 ", fullname=?"+
					 ", role=?"+
					 ", state=?"+
					 " WHERE id=?";
			
			PreparedStatement st = con.prepareStatement(sql);	
			st.setString(1, t.getUsername());
			st.setString(2, t.getEmail());
			st.setString(3, t.getPassword());
			st.setString(4, t.getFullname());
			st.setString(5, t.getRole());
			st.setInt(6, t.getState());
			st.setString(7, t.getId());
			
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
	
	//kiem tra username
	public boolean checkUsername(String username) {
		boolean result = false;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM user WHERE username=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, username);
			
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
	
	public boolean checkUsernameDiferentId(String username, String id) {
		boolean result = false;
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM user WHERE username=? AND id <> ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, username);
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
	
	
	public User selectByUsernameAndPassword(User t) {
		User result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM user WHERE username=? AND password=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getUsername());
			st.setString(2, t.getPassword());
			 
			ResultSet rs = st.executeQuery();
			
			//Lấy thông tin 
			while(rs.next()) {
				String id = rs.getString("id");
				String username = rs.getString("username");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String fullname = rs.getString("fullname");
				String role = rs.getString("role");
				int state = rs.getInt("state");
				
				result = new User(id, username, email, password, fullname, role, state);
				break;
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}

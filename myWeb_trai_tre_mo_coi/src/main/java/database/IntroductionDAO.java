package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import controller.register;
import model.Children;
import model.Feedback;
import model.Introducter;
import model.Introduction;
import model.Staff;

public class IntroductionDAO implements DAOInterface<Introduction> {

	@Override
	public ArrayList<Introduction> selectAll() {
		ArrayList<Introduction> result = new ArrayList<Introduction>();
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM introduction";
			PreparedStatement st = con.prepareStatement(sql);
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String introductionID = rs.getString("introductionID");
				String orphanID = rs.getString("orphanID");
				String introducterID = rs.getString("introducterID");
				int state = rs.getInt("state");
				Date date_introduction = rs.getDate("date_introduction");
				String note = rs.getString("note");
				
				Children c = new Children();
				c.setOrphanID(orphanID);
				Children children = (new ChildrenDAO().selectById(c));
				
				Introducter ci = new Introducter();
				ci.setIntroducterID(introducterID);
				Introducter introducter = (new IntroducterDAO().selectById(ci));
				
				Introduction it = new Introduction(introductionID, children, introducter, state, date_introduction, note);
				result.add(it);
			}
			
			//Bước 5
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Introduction selectById(Introduction t) {
		Introduction result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM introduction WHERE introductionID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getIntroductionID());
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String introductionID = rs.getString("introductionID");
				String orphanID = rs.getString("orphanID");
				String introducterID = rs.getString("introducterID");
				int state = rs.getInt("state");
				Date date_introduction = rs.getDate("date_introduction");
				String note = rs.getString("note");
				
				Children c = new Children();
				c.setOrphanID(orphanID);
				Children children = (new ChildrenDAO().selectById(c));
				
				Introducter ci = new Introducter();
				ci.setIntroducterID(introducterID);
				Introducter introducter = (new IntroducterDAO().selectById(ci));
				
				result = new Introduction(introductionID, children, introducter, state, date_introduction, note);
				break;
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insert(Introduction t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "INSERT INTO introduction (introductionID, orphanID, introducterID, state, date_introduction, note) "+
					" VALUES (?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getIntroductionID());
			st.setString(2, t.getChild().getOrphanID());
			st.setString(3, t.getIntroducter().getIntroducterID());
			st.setInt(4, t.getState());
			st.setDate(5, t.getDate_introduction());
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
	public int insertAll(ArrayList<Introduction> arr) {
		int count = 0;
		for (Introduction introduction : arr) {
			count = count + this.insert(introduction);
		}
		return count;
	}

	@Override
	public int delete(Introduction t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "DELETE from introduction "+
					 " WHERE introductionID =?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getIntroductionID());
			
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
	public int deleteAll(ArrayList<Introduction> arr) {
		int count = 0;
		for (Introduction introduction : arr) {
			count = count + this.delete(introduction);
		}
		return count;
	}

	@Override
	public int update(Introduction t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "UPDATE introduction "+
					 " SET " +
					 " orphanID=?"+
					 ", introducterID=?"+
					 ", state=?"+
					 ", date_introduction=?"+
					 ", note=?"+
					 " WHERE introductionID=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getChild().getOrphanID());
			st.setString(2, t.getIntroducter().getIntroducterID());
			st.setInt(3, t.getState());
			st.setDate(4, t.getDate_introduction());
			st.setString(5, t.getNote());
			st.setString(6, t.getIntroductionID());
			
			Children c = new Children();
			c.setOrphanID(t.getChild().getOrphanID());
			Children children = (new ChildrenDAO().selectById(c));
			
			Introducter ci = new Introducter();
			ci.setIntroducterID(t.getIntroducter().getIntroducterID());
			Introducter introducter = (new IntroducterDAO().selectById(ci));
			
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
	
	public String selectEmail(String introducterID) {
			String result = null;
			try {
				Connection con = JDBCUtil.getConnection();
				
				String sql = "SELECT user.email "
						+ "FROM user "
						+ "JOIN introducter_user ON user.id = introducter_user.userID "
						+ "JOIN introducter ON introducter.introducterID = introducter_user.introducterID "
						+ "WHERE introducter.introducterID = ?";
				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, introducterID);
				
				System.out.println(sql);
				ResultSet rs = st.executeQuery();
				
				while(rs.next()) {
				    String mail = rs.getString("email");
				    return mail;
				}
				
				JDBCUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
	}
}

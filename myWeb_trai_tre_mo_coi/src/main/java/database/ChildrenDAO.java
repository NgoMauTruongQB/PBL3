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
			
			//Thực thi 
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
				
				Children c = new Children(orphanID, name, date_of_birth, gender, reason, health_status, education, state);
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
			//Bước 1
			Connection con = JDBCUtil.getConnection();
			
			//Tạo ra đối tượng Statement 
			String sql = "SELECT * FROM children WHERE orphanID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getOrphanID());
			
			//Thực thi câu lệnh SQL 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			//Lấy thông tin 
			while(rs.next()) {
				String orphanID = rs.getString("orphanID");
				String name = rs.getString("name");
				Date date_of_birth = rs.getDate("date_of_birth");
				String gender = rs.getString("gender");
				String reason = rs.getString("reason");
				String health_status = rs.getString("health_status");
				String education = rs.getString("education");
				int state = rs.getInt("state");
				
				result = new Children(orphanID, name, date_of_birth, gender, reason, health_status, education, state);
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
	public int insert(Children t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO children (orphanID, name, date_of_birth, gender, reason, health_status, education, state ) "+
					" VALUES (?,?,?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getOrphanID());
			st.setString(2, t.getName());
			st.setDate(3, t.getDate_of_birth());
			st.setString(4, t.getGender());
			st.setString(5, t.getReason());
			st.setString(6, t.getHealth_status());
			st.setString(7, t.getEducation());
			st.setInt(8, t.getState());
			
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
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE from children "+
					 " WHERE orphanID =?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getOrphanID());
			
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
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE children "+
					 " SET " +
					 " name=?"+
					 ", date_of_birth=?"+
					 ", gender=?"+
					 ", reason=?"+
					 ", health_status=?"+
					 ", education=?"+
					 ", state=?"+
					 " WHERE orphanID=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getName());
			st.setDate(2, t.getDate_of_birth());
			st.setString(3, t.getGender());
			st.setString(4, t.getReason());
			st.setString(5, t.getHealth_status());
			st.setString(6, t.getEducation());
			st.setInt(7, t.getState());
			st.setString(8, t.getOrphanID());
			
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
		ChildrenDAO cd = new ChildrenDAO();
		
//		ArrayList<Children> c = cd.selectAll();
//			System.out.println(c.toString());
		
//		Children c = cd.selectById(new Children("C11221", null, null, null, null, null, null, 0));
//		System.out.println(c.toString());
		
//		cd.insert(new Children("C11000", "Nguyễn Văn Nhật" , new Date(2022-1900), "Nam", "", "Tốt", "", 1));
		
//		ArrayList< Children> list = new ArrayList<Children>();
		
//		list.add(new Children("C11223", "Ngô Văn Hải", new Date(2005-1700), "Nam", "Bố mẹ bị bệnh hiểm nghèo", "Tim bẩm sinh", "11/12", 1));
//		list.add(new Children("C11224", "Nguyễn Hồng Hạnh", new Date(2009-1700), "Nữ", "Lạc bố mẹ", "Tốt", "6/12", 1));
//		cd.insertAll(list);
		
//		cd.delete(new Children("C11000", "Nguyễn Văn Nhật" , new Date(2022-1900), "Nam", "", "Tốt", "", 1));
		
//		cd.deleteAll(list);
		
		cd.update(new Children("C11000", "Nguyễn Văn Nhật" , new Date(2022-1900,03,02), "Nam", "Bị bỏ rơi ở cổng chùa", "Tốt", "", 1));
	}
	
}

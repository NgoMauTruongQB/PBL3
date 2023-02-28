package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Caring_relationship;
import model.Children;
import model.Staff;

public class Caring_relationshipDAO implements DAOInterface<Caring_relationship> {

	@Override
	public ArrayList<Caring_relationship> selectAll() {
		ArrayList<Caring_relationship> result = new ArrayList<Caring_relationship>();
		try {
			//Bước 1
			Connection con = JDBCUtil.getConnection();
			
			//Bước 2
			String sql = "SELECT * FROM caring_relationship";
			PreparedStatement st = con.prepareStatement(sql);
			
			//Thực thi câu lệnh SQL 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			//bước 4 
			while(rs.next()) {
				String id = rs.getString("id");
				String staffID = rs.getString("staffID");
				String ophanID = rs.getString("ophanID");
				String relationship_type = rs.getString("relationship_type");
				
				Staff nv = new Staff();
				nv.setStaffID(staffID);
				Staff staff = (new StaffDAO().selectById(nv));
				
				Children c = new Children();
				c.setOrphanID(ophanID);
				Children children = (new ChildrenDAO().selectById(c));
				
				Caring_relationship cr = new Caring_relationship(id, staff, children, relationship_type);
				result.add(cr);
			}
			
			//Bước 5
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Caring_relationship selectById(Caring_relationship t) {
		Caring_relationship result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM caring_relationship WHERE id=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getId());
			
			//Thực thi câu lệnh SQL 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			//Lấy thông tin 
			while(rs.next()) {
				String id = rs.getString("id");
				String staffID = rs.getString("staffID");
				String ophanID = rs.getString("ophanID");
				String relationship_type = rs.getString("relationship_type");
				
				Staff nv = new Staff();
				nv.setStaffID(staffID);
				Staff staff = (new StaffDAO().selectById(nv));
				
				Children c = new Children();
				c.setOrphanID(ophanID);
				Children children = (new ChildrenDAO().selectById(c));
				
				result = new Caring_relationship(id, staff, children, relationship_type);
				break;
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insert(Caring_relationship t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "INSERT INTO caring_relationship (id, staffID, ophanID, relationship_type) "+
					" VALUES (?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getId());
			st.setString(2, t.getStaff().getStaffID());
			st.setString(3, t.getChild().getOrphanID());
			st.setString(4, t.getRelationship_type());
			
			// Bước 3: thực thi câu lệnh SQL
			result = st.executeUpdate();
			
			// Bước 4:
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
	public int insertAll(ArrayList<Caring_relationship> arr) {
		int count = 0;
		for (Caring_relationship caring_relationship : arr) {
			count = count + this.insert(caring_relationship);
		}
		return count;
	}

	@Override
	public int delete(Caring_relationship t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "DELETE from caring_relationship "+
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
	public int deleteAll(ArrayList<Caring_relationship> arr) {
		int count = 0;
		for (Caring_relationship caring_relationship : arr) {
			count = count + this.delete(caring_relationship);
		}
		return count;
	}

	@Override
	public int update(Caring_relationship t) {
		int result = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE caring_relationship "+
					 " SET " +
					 " staffID=?"+
					 ", ophanID=?"+
					 ", relationship_type=?"+
					 " WHERE id=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getStaff().getStaffID());
			st.setString(2, t.getChild().getOrphanID());
			st.setString(3, t.getRelationship_type());
			st.setString(4, t.getId());
			
			Staff nv = new Staff();
			nv.setStaffID(t.getStaff().getStaffID());
			Staff staff = (new StaffDAO().selectById(nv));
			
			Children cr = new Children();
			cr.setOrphanID(t.getChild().getOrphanID());
			Children children = (new ChildrenDAO().selectById(cr));
			
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
		Caring_relationshipDAO crd = new Caring_relationshipDAO();
		
//		Caring_relationship cr = new Caring_relationship();
//		cr.setId("1122111");
//		System.out.println(crd.selectById(cr).toString());
		
		Staff st = new Staff();
		st.setStaffID("ST12111");
		
		Children c = new Children();
		c.setOrphanID("C11224");
		
		Caring_relationship cr = new Caring_relationship("1231121",st,c,"Hướng dẫn học tập");
		crd.update(cr);
		
//		ArrayList<Caring_relationship> list = crd.selectAll();
//		for (Caring_relationship caring_relationship : list) {
//			System.out.println(caring_relationship.toString());		
//		}
	}

}

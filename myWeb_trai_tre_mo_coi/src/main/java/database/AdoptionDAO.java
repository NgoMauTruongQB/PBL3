package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Adopter;
import model.Adoption;
import model.Children;
import model.Feedback;
import model.Staff;

public class AdoptionDAO implements DAOInterface<Adoption> {

	@Override
	public ArrayList<Adoption> selectAll() {
		ArrayList<Adoption> result = new ArrayList<Adoption>();
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM adoption";
			PreparedStatement st = con.prepareStatement(sql);
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String adoptionID = rs.getString("adoptionID");
				String adopterID = rs.getString("adopterID");
				String orphanID = rs.getString("orphanID");
				int state = rs.getInt("state");
				Date date_adoption = rs.getDate("date_adoption");
				String note = rs.getString("note");
				
				Adopter ad = new Adopter();
				ad.setAdopterID(adopterID);
				Adopter adopter = (new AdopterDAO().selectById(ad));
				
				Children c = new Children();
				c.setOrphanID(orphanID);
				Children children = (new ChildrenDAO().selectById(c));
				
				Adoption s = new Adoption(adoptionID, adopter, children, state, date_adoption, note);
				result.add(s);
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Adoption selectById(Adoption t) {
		Adoption result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM adoption WHERE adoptionID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getAdoptionID());
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String adoptionID = rs.getString("adoptionID");
				String adopterID = rs.getString("adopterID");
				String orphanID = rs.getString("orphanID");
				int state = rs.getInt("state");
				Date date_adoption = rs.getDate("date_adoption");
				String note = rs.getString("note");
				
				Adopter ad = new Adopter();
				ad.setAdopterID(adopterID);
				Adopter adopter = (new AdopterDAO().selectById(ad));
				
				Children c = new Children();
				c.setOrphanID(orphanID);
				Children children = (new ChildrenDAO().selectById(c));
				
				result = new Adoption(adoptionID, adopter, children, state, date_adoption, note);
				break;
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insert(Adoption t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "INSERT INTO adoption (adoptionID, adopterID, orphanID, state, date_adoption, note) "+
					" VALUES (?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getAdoptionID());
			st.setString(2, t.getAdopter().getAdopterID());
			st.setString(3, t.getChild().getOrphanID());
			st.setInt(4, t.getState());
			st.setDate(5, t.getDate_adoption());
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
	public int insertAll(ArrayList<Adoption> arr) {
		int count = 0;
		for (Adoption adoption : arr) {
			count = count + this.insert(adoption);
		}
		return count;
	}

	@Override
	public int delete(Adoption t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "DELETE from adoption "+
					 " WHERE adoptionID =?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getAdoptionID());
			
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
	public int deleteAll(ArrayList<Adoption> arr) {
		int count = 0;
		for (Adoption adoption : arr) {
			count = count + this.delete(adoption);
		}
		return count;
	}

	@Override
	public int update(Adoption t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "UPDATE adoption "+
					 " SET " +
					 " adopterID=?"+
					 ", orphanID=?"+
					 ", state=?"+
					 ", date_adoption=?"+
					 ", note=?"+
					 " WHERE adoptionID=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getAdopter().getAdopterID());
			st.setString(2, t.getChild().getOrphanID());
			st.setInt(3, t.getState());
			st.setDate(4, t.getDate_adoption());
			st.setString(5, t.getNote());
			st.setString(6, t.getAdoptionID());
			
			Adopter ad = new Adopter();
			ad.setAdopterID(t.getAdopter().getAdopterID());
			Adopter adopter = (new AdopterDAO().selectById(ad));
			
			Children c = new Children();
			c.setOrphanID(t.getChild().getOrphanID());
			Children children = (new ChildrenDAO().selectById(c));
			
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

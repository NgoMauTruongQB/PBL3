package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Event;
import model.Feedback;
import model.Staff;

public class EventDAO implements DAOInterface<Event> {

	@Override
	public ArrayList<Event> selectAll() {
		ArrayList<Event> result = new ArrayList<Event>();
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM event";
			PreparedStatement st = con.prepareStatement(sql);
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String eventID = rs.getString("eventID");
				Date date_begin = rs.getDate("date_begin");
				String location = rs.getString("location");
				String event_of_name = rs.getString("event_of_name");
				int number_of_chidlren = rs.getInt("number_of_chidlren");
				int state = rs.getInt("state");
				Date date_end = rs.getDate("date_end");
				String staffID = rs.getString("staffID");
				String content = rs.getString("content");
				
				Staff nv = new Staff();
				nv.setStaffID(staffID);
				Staff staff = (new StaffDAO().selectById(nv));
				
				Event e = new Event(eventID, date_begin, date_end, location, event_of_name, number_of_chidlren, state,staff, content);
				result.add(e);
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Event selectById(Event t) {
		Event result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM event WHERE eventID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getEventID());
			 
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String eventID = rs.getString("eventID");
				Date date_begin = rs.getDate("date_begin");
				String location = rs.getString("location");
				String event_of_name = rs.getString("event_of_name");
				int number_of_chidlren = rs.getInt("number_of_chidlren");
				int state = rs.getInt("state");
				Date date_end = rs.getDate("date_end");
				String staffID = rs.getString("staffID");
				String content = rs.getString("content");
				
				Staff nv = new Staff();
				nv.setStaffID(staffID);
				Staff staff = (new StaffDAO().selectById(nv));
				
				result = new Event(eventID, date_begin, date_end, location, event_of_name, number_of_chidlren, state,staff, content);
				break;
			}
			
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insert(Event t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "INSERT INTO event (eventID, date_begin, date_end, location, event_of_name, number_of_chidlren, state, staffID, content) "+
					" VALUES (?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getEventID());
			st.setDate(2, t.getDate_begin());
			st.setDate(3, t.getDate_end());
			st.setString(4, t.getLocation());
			st.setString(5, t.getEvent_of_name());
			st.setInt(6, t.getNumber_of_children());
			st.setInt(7, t.getState());
			st.setString(8, t.getStaff().getStaffID());
			st.setString(9, t.getContent());
			
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
	public int insertAll(ArrayList<Event> arr) {
		int count = 0;
		for (Event event : arr) {
			count = count + this.insert(event);
		}
		return count;
	}

	@Override
	public int delete(Event t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "DELETE from event "+
					 " WHERE eventID =?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getEventID());
			
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
	public int deleteAll(ArrayList<Event> arr) {
		int count = 0;
		for (Event event : arr) {
			count = count + this.delete(event);
		}
		return count;
	}

	@Override
	public int update(Event t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "UPDATE event "+
					 " SET " +
					 " date_begin=?"+
					 ", date_end=?"+
					 ", location=?"+
					 ", event_of_name=?"+
					 ", number_of_chidlren=?"+
					 ", state=?"+
					 ", staffID=?"+
					 ", content=?"+
					 " WHERE eventID=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setDate(1, t.getDate_begin());
			st.setDate(2, t.getDate_end());
			st.setString(3, t.getLocation());
			st.setString(4, t.getEvent_of_name());
			st.setInt(5, t.getNumber_of_children());
			st.setInt(6, t.getState());
			st.setString(7, t.getStaff().getStaffID());
			st.setString(8, t.getContent());
			st.setString(9, t.getEventID());
			
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

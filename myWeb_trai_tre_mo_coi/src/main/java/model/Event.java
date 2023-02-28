package model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Objects;

public class Event {
	private String eventID;
	private Date date_begin;
	private Date date_end;
	private String location;
	private String event_of_name;
	private int number_of_children;
	private int state;
	private Staff staff;
	
	public Event() {
		super();
	}

	public Event(String eventID, Date date_begin, Date date_end, String location, String event_of_name,
			int number_of_children, int state, Staff staff) {
		super();
		this.eventID = eventID;
		this.date_begin = date_begin;
		this.date_end = date_end;
		this.location = location;
		this.event_of_name = event_of_name;
		this.number_of_children = number_of_children;
		this.state = state;
		this.staff = staff;
	}

	public String getEventID() {
		return eventID;
	}

	public void setEventID(String eventID) {
		this.eventID = eventID;
	}

	public Date getDate_begin() {
		return date_begin;
	}

	public void setDate_begin(Date date_begin) {
		this.date_begin = date_begin;
	}

	public Date getDate_end() {
		return date_end;
	}

	public void setDate_end(Date date_end) {
		this.date_end = date_end;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getEvent_of_name() {
		return event_of_name;
	}

	public void setEvent_of_name(String event_of_name) {
		this.event_of_name = event_of_name;
	}

	public int getNumber_of_children() {
		return number_of_children;
	}

	public void setNumber_of_children(int number_of_children) {
		this.number_of_children = number_of_children;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	@Override
	public int hashCode() {
		return Objects.hash(date_begin, date_end, eventID, event_of_name, location, number_of_children, staff, state);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Event other = (Event) obj;
		return Objects.equals(eventID, other.eventID);
	}

	@Override
	public String toString() {
		return "Event [eventID=" + eventID + ", date_begin=" + date_begin + ", date_end=" + date_end + ", location="
				+ location + ", event_of_name=" + event_of_name + ", number_of_children=" + number_of_children
				+ ", state=" + state + ", staff=" + staff + "]";
	}
}

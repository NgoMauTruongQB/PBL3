package model;

import java.sql.Date;

public class Event {
	private String eventID;
	private Date date_begin;
	private Date date_end;
	private String location;
	private String event_of_name;
	private int number_of_children;
	private int state;
	private Staff staff;
	private String content;
	
	public Event() {
		super();
	}

	public Event(String eventID, Date date_begin, Date date_end, String location, String event_of_name,
			int number_of_children, int state, Staff staff, String content) {
		super();
		this.eventID = eventID;
		this.date_begin = date_begin;
		this.date_end = date_end;
		this.location = location;
		this.event_of_name = event_of_name;
		this.number_of_children = number_of_children;
		this.state = state;
		this.staff = staff;
		this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}

package model;

import java.sql.Date;
import java.util.Objects;

public class Charity_activities {
	private String activityID;
	private String name_of_activity;
	private Date date_begin;
	private Date date_end;
	private double money_collected;
	private String purpose_of_activity;
	private Staff staff;
	private String photo;
	
	public Charity_activities() {
		super();
	}

	public Charity_activities(String activityID, String name_of_activity, Date date_begin, Date date_end,
			double money_collected, String purpose_of_activity, Staff staff, String photo) {
		super();
		this.activityID = activityID;
		this.name_of_activity = name_of_activity;
		this.date_begin = date_begin;
		this.date_end = date_end;
		this.money_collected = money_collected;
		this.purpose_of_activity = purpose_of_activity;
		this.staff = staff;
		this.photo = photo;
	}

	public String getActivityID() {
		return activityID;
	}

	public void setActivityID(String activityID) {
		this.activityID = activityID;
	}

	public String getName_of_activity() {
		return name_of_activity;
	}

	public void setName_of_activity(String name_of_activity) {
		this.name_of_activity = name_of_activity;
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

	public double getMoney_collected() {
		return money_collected;
	}

	public void setMoney_collected(double money_collected) {
		this.money_collected = money_collected;
	}

	public String getPurpose_of_activity() {
		return purpose_of_activity;
	}

	public void setPurpose_of_activity(String purpose_of_activity) {
		this.purpose_of_activity = purpose_of_activity;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	
}

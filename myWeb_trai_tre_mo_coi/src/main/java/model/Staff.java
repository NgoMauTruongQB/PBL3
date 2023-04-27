package model;

import java.sql.Date;

public class Staff {
	private String staffID;
	private String fullname;
	private Date date_of_birth;
	private String gender;
	private String position;
	private int state;
	private String phone;
	private String email;
	private String photo;
	
	public Staff(String staffID, String fullname, Date date_of_birth, String gender, String position, int state,
			String phone, String email, String photo) {
		super();
		this.staffID = staffID;
		this.fullname = fullname;
		this.date_of_birth = date_of_birth;
		this.gender = gender;
		this.position = position;
		this.state = state;
		this.phone = phone;
		this.email = email;
		this.photo = photo;
	}

	public Staff() {
		super();
	}

	public String getStaffID() {
		return staffID;
	}

	public void setStaffID(String staffID) {
		this.staffID = staffID;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public Date getDate_of_birth() {
		return date_of_birth;
	}

	public void setDate_of_birth(Date date_of_birth) {
		this.date_of_birth = date_of_birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
}

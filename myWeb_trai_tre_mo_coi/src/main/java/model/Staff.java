package model;

import java.sql.Date;
import java.util.Objects;

public class Staff {
	private String staffID;
	private String fullname;
	private Date date_of_birth;
	private String gender;
	private String position;
	private int state;
	
	public Staff() {
		super();
	}

	public Staff(String staffID, String fullname, Date date_of_birth, String gender, String position, int state) {
		super();
		this.staffID = staffID;
		this.fullname = fullname;
		this.date_of_birth = date_of_birth;
		this.gender = gender;
		this.position = position;
		this.state = state;
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

	@Override
	public int hashCode() {
		return Objects.hash(date_of_birth, fullname, gender, position, staffID, state);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Staff other = (Staff) obj;
		return Objects.equals(staffID, other.staffID);
	}

	@Override
	public String toString() {
		return "Staff [staffID=" + staffID + ", fullname=" + fullname + ", date_of_birth=" + date_of_birth + ", gender="
				+ gender + ", position=" + position + ", state=" + state + "]";
	}
	
	
	
}

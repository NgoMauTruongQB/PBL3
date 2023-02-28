package model;

import java.sql.Date;
import java.util.Objects;

public class Children {
	private String orphanID;
	private String name;
	private Date date_of_birth;
	private String gender;
	private String reason;
	private String health_status;
	private String education;
	private int state;
	
	public Children() {
		super();
	}

	public Children(String orphanID, String name, Date date_of_birth, String gender, String reason,
			String health_status, String education, int state) {
		super();
		this.orphanID = orphanID;
		this.name = name;
		this.date_of_birth = date_of_birth;
		this.gender = gender;
		this.reason = reason;
		this.health_status = health_status;
		this.education = education;
		this.state = state;
	}

	public String getOrphanID() {
		return orphanID;
	}

	public void setOrphanID(String orphanID) {
		this.orphanID = orphanID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getHealth_status() {
		return health_status;
	}

	public void setHealth_status(String health_status) {
		this.health_status = health_status;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public int hashCode() {
		return Objects.hash(date_of_birth, education, gender, health_status, name, orphanID, reason, state);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Children other = (Children) obj;
		return Objects.equals(orphanID, other.orphanID);
	}

	@Override
	public String toString() {
		return "Children [orphanID=" + orphanID + ", name=" + name + ", date_of_birth=" + date_of_birth + ", gender="
				+ gender + ", reason=" + reason + ", health_status=" + health_status + ", education=" + education
				+ ", state=" + state + "]";
	}
}

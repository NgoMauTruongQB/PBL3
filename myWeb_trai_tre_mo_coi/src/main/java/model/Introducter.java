package model;

import java.util.Objects;

public class Introducter {
	private String introducterID;
	private String name;
	private String phoneNumber;
	private String address;
	private String note;
	
	public Introducter() {
		super();
	}

	public Introducter(String introducterID, String name, String phoneNumber, String address, String note) {
		super();
		this.introducterID = introducterID;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.note = note;
	}

	public String getIntroducterID() {
		return introducterID;
	}

	public void setIntroducterID(String introducterID) {
		this.introducterID = introducterID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Override
	public int hashCode() {
		return Objects.hash(address, introducterID, name, note, phoneNumber);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Introducter other = (Introducter) obj;
		return Objects.equals(introducterID, other.introducterID);
	}

	@Override
	public String toString() {
		return "Introducter [introducterID=" + introducterID + ", name=" + name + ", phoneNumber=" + phoneNumber
				+ ", address=" + address + ", note=" + note + "]";
	}
	
}

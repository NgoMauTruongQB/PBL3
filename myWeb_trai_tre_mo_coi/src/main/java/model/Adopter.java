package model;

import java.util.Objects;

public class Adopter {
	private String adopterID;
	private String name;
	private String phoneNumber;
	private String address;
	private String cmnd;
	private String note;
	
	public Adopter() {
		super();
	}

	public Adopter(String adopterID, String name, String phoneNumber, String address, String cmnd, String note) {
		super();
		this.adopterID = adopterID;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.cmnd = cmnd;
		this.note = note;
	}

	public String getAdopterID() {
		return adopterID;
	}

	public void setAdopterID(String adopterID) {
		this.adopterID = adopterID;
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

	public String getCmnd() {
		return cmnd;
	}

	public void setCmnd(String cmnd) {
		this.cmnd = cmnd;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Override
	public int hashCode() {
		return Objects.hash(address, adopterID, cmnd, name, note, phoneNumber);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Adopter other = (Adopter) obj;
		return Objects.equals(adopterID, other.adopterID);
	}

	@Override
	public String toString() {
		return "Adopter [adopterID=" + adopterID + ", name=" + name + ", phoneNumber=" + phoneNumber + ", address="
				+ address + ", cmnd=" + cmnd + ", note=" + note + "]";
	}
	
	
}

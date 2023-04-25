package model;

import java.sql.Date;
import java.util.Objects;

public class Adoption {
	private String adoptionID;
	private Adopter adopter;
	private Children child;
	private int state;
	private Date date_adoption;
	private String note;
	
	public Adoption() {
		super();
	}

	public Adoption(String adoptionID, Adopter adopter, Children child, int state, Date date_adoption,
			String note) {
		super();
		this.adoptionID = adoptionID;
		this.adopter = adopter;
		this.child = child;
		this.state = state;
		this.date_adoption = date_adoption;
		this.note = note;
	}

	public String getAdoptionID() {
		return adoptionID;
	}

	public void setAdoptionID(String adoptionID) {
		this.adoptionID = adoptionID;
	}

	public Adopter getAdopter() {
		return adopter;
	}

	public void setAdopter(Adopter adopter) {
		this.adopter = adopter;
	}

	public Children getChild() {
		return child;
	}

	public void setChild(Children child) {
		this.child = child;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getDate_adoption() {
		return date_adoption;
	}

	public void setDate_adoption(Date date_adoption) {
		this.date_adoption = date_adoption;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}	
	
}

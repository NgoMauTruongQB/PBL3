package model;

import java.sql.Date;
import java.util.Objects;

public class Introduction {
	private String introductionID;
	private Children child;
	private Introducter introducter;
	private int state;
	private Date date_introduction;
	private String note;
	
	public Introduction() {
		super();
	}

	public Introduction(String introductionID, Children child, Introducter introducter, int state,
			Date date_introduction, String note) {
		super();
		this.introductionID = introductionID;
		this.child = child;
		this.introducter = introducter;
		this.state = state;
		this.date_introduction = date_introduction;
		this.note = note;
	}

	public String getIntroductionID() {
		return introductionID;
	}

	public void setIntroductionID(String introductionID) {
		this.introductionID = introductionID;
	}

	public Children getChild() {
		return child;
	}

	public void setChild(Children child) {
		this.child = child;
	}

	public Introducter getIntroducter() {
		return introducter;
	}

	public void setIntroducter(Introducter introducter) {
		this.introducter = introducter;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getDate_introduction() {
		return date_introduction;
	}

	public void setDate_introduction(Date date_introduction) {
		this.date_introduction = date_introduction;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Override
	public int hashCode() {
		return Objects.hash(child, state, date_introduction, introducter, introductionID, note);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Introduction other = (Introduction) obj;
		return Objects.equals(introductionID, other.introductionID);
	}

	@Override
	public String toString() {
		return "Introduction [introductionID=" + introductionID + ", child=" + child + ", introducter=" + introducter
				+ ", state=" + state + ", date_introduction=" + date_introduction + ", note=" + note + "]";
	}
	
	
}

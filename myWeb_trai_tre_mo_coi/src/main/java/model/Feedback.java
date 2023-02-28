package model;

import java.sql.Date;
import java.util.Objects;

public class Feedback {
	private String feedbackID;
	private Date date_of_feedback;
	private Staff staff;
	private String content_of_feedback;
	private int rating;
	
	public Feedback() {
		super();
	}

	public Feedback(String feedbackID, Date date_of_feedback, Staff staff, String content_of_feedback, int rating) {
		super();
		this.feedbackID = feedbackID;
		this.date_of_feedback = date_of_feedback;
		this.staff = staff;
		this.content_of_feedback = content_of_feedback;
		this.rating = rating;
	}

	public String getFeedbackID() {
		return feedbackID;
	}

	public void setFeedbackID(String feedbackID) {
		this.feedbackID = feedbackID;
	}

	public Date getDate_of_feedback() {
		return date_of_feedback;
	}

	public void setDate_of_feedback(Date date_of_feedback) {
		this.date_of_feedback = date_of_feedback;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public String getContent_of_feedback() {
		return content_of_feedback;
	}

	public void setContent_of_feedback(String content_of_feedback) {
		this.content_of_feedback = content_of_feedback;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	@Override
	public int hashCode() {
		return Objects.hash(content_of_feedback, date_of_feedback, feedbackID, rating, staff);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Feedback other = (Feedback) obj;
		return Objects.equals(feedbackID, other.feedbackID);
	}

	@Override
	public String toString() {
		return "Feedback [feedbackID=" + feedbackID + ", date_of_feedback=" + date_of_feedback + ", staff=" + staff
				+ ", content_of_feedback=" + content_of_feedback + ", rating=" + rating + "]";
	}
	
	
	
}

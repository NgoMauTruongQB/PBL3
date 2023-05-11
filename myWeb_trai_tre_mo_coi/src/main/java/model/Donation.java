package model;

import java.sql.Date;
import java.util.Objects;

public class Donation {
	private String donationID;
	private double amount_of_money;
	private String state;
	private String phoneNumber;
	private Date date_of_donation;
	private Charity_activities activity;
	private User user;
	
	public Donation() {
		super();
	}

	public Donation(String donationID, double amount_of_money, String state, String phoneNumber,
			Date date_of_donation, Charity_activities activity, User user) {
		super();
		this.donationID = donationID;
		this.amount_of_money = amount_of_money;
		this.state = state;
		this.phoneNumber = phoneNumber;
		this.date_of_donation = date_of_donation;
		this.activity = activity;
		this.user = user;
	}

	public String getDonationID() {
		return donationID;
	}

	public void setDonationID(String donationID) {
		this.donationID = donationID;
	}

	public double getAmount_of_money() {
		return amount_of_money;
	}

	public void setAmount_of_money(double amount_of_money) {
		this.amount_of_money = amount_of_money;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getDate_of_donation() {
		return date_of_donation;
	}

	public void setDate_of_donation(Date date_of_donation) {
		this.date_of_donation = date_of_donation;
	}

	public Charity_activities getActivity() {
		return activity;
	}

	public void setActivity(Charity_activities activity) {
		this.activity = activity;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public int hashCode() {
		return Objects.hash(activity, amount_of_money, state, date_of_donation, donationID, phoneNumber, user);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Donation other = (Donation) obj;
		return Objects.equals(donationID, other.donationID);
	}

	@Override
	public String toString() {
		return "Donation [donationID=" + donationID + ", amount_of_money=" + amount_of_money + ", state="
				+ state + ", phoneNumber=" + phoneNumber + ", date_of_donation=" + date_of_donation + ", activity="
				+ activity + ", user=" + user + "]";
	}
}

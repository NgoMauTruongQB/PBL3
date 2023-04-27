package model;

public class Adopter_user {
	private Adopter adopter;
	private User user;
	
	public Adopter_user() {
		super();
	}
	
	public Adopter_user( User user,Adopter adopter) {
		super();
		this.user = user;
		this.adopter = adopter;
		
	}
	
	public Adopter getAdopter() {
		return adopter;
	}
	
	public void setAdopter(Adopter adopter) {
		this.adopter = adopter;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
}
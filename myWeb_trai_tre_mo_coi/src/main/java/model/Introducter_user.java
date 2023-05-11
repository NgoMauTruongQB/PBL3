package model;

public class Introducter_user {
	private Introducter introducter;
	private User user;
	public Introducter_user() {
		super();
	}
	public Introducter_user(User user,Introducter introducter ) {
		super();
		this.user = user;
		this.introducter = introducter;
		
	}
	public Introducter getIntroducter() {
		return introducter;
	}
	public void setIntroducter(Introducter introducter) {
		this.introducter = introducter;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}

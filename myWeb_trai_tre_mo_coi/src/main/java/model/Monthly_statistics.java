package model;

public class Monthly_statistics {
	private int year;
	private int month;
	private double total;
	
	public Monthly_statistics() {
		super();
	}

	public Monthly_statistics(int year, int month, double total) {
		super();
		this.year = year;
		this.month = month;
		this.total = total;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "Monthly_statistics [year=" + year + ", month=" + month + ", total=" + total + "]";
	}
	
}

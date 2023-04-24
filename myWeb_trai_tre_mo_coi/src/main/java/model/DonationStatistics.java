package model;

public class DonationStatistics {
	private String id;
	private String name;
	private Double money_collected;
	private Double amount_of_money;

	public DonationStatistics(String id, String name, Double money_collected, Double amount_of_money) {
		super();
		this.id = id;
		this.name = name;
		this.money_collected = money_collected;
		this.amount_of_money = amount_of_money;
	}

	public DonationStatistics() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getMoney_collected() {
		return money_collected;
	}

	public void setMoney_collected(Double money_collected) {
		this.money_collected = money_collected;
	}

	public Double getAmount_of_money() {
		return amount_of_money;
	}

	public void setAmount_of_money(Double amount_of_money) {
		this.amount_of_money = amount_of_money;
	}

	@Override
	public String toString() {
		return "DonationStatistics [id=" + id + ", name=" + name + ", money_collected=" + money_collected
				+ ", amount_of_money=" + amount_of_money + "]";
	}
	
}

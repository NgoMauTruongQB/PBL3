package model;

import java.util.Objects;

public class Caring_relationship {
	private String id;
	private Staff staff;
	private Children child;
	private String relationship_type;
	
	public Caring_relationship() {
		super();
	}

	public Caring_relationship(String id, Staff staff, Children child, String relationship_type) {
		super();
		this.id = id;
		this.staff = staff;
		this.child = child;
		this.relationship_type = relationship_type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public Children getChild() {
		return child;
	}

	public void setChild(Children child) {
		this.child = child;
	}

	public String getRelationship_type() {
		return relationship_type;
	}

	public void setRelationship_type(String relationship_type) {
		this.relationship_type = relationship_type;
	}

	@Override
	public int hashCode() {
		return Objects.hash(child, id, relationship_type, staff);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Caring_relationship other = (Caring_relationship) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Caring_relationship [id=" + id + ", staff=" + staff + ", child=" + child + ", relationship_type="
				+ relationship_type + "]";
	}
	
}

package DTO;

public class StudentDto {
	
//	Declare the datamembers
	
	private int id;
	private String name;
	private double physics;
	private double chemistry;
	private double maths;
	
//	Getter and Setter methods
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPhysics() {
		return physics;
	}
	public void setPhysics(double physics) {
		this.physics = physics;
	}
	public double getChemistry() {
		return chemistry;
	}
	public void setChemistry(double chemistry) {
		this.chemistry = chemistry;
	}
	public double getMaths() {
		return maths;
	}
	public void setMaths(double maths) {
		this.maths = maths;
	}
	
//	constructor
	public StudentDto(int id, String name, double physics, double chemistry, double maths) {
		super();
		this.id = id;
		this.name = name;
		this.physics = physics;
		this.chemistry = chemistry;
		this.maths = maths;
	}	
}

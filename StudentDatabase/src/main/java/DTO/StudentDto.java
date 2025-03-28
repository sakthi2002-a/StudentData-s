package DTO;

public class StudentDto {
	
//	Declare the datamembers
	private int id;
	private String name;
	private int physics;
	private int chemistry;
	private int maths;
	
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
	public int getPhysics() {
		return physics;
	}
	public void setPhysics(int physics) {
		this.physics = physics;
	}
	public int getChemistry() {
		return chemistry;
	}
	public void setChemistry(int chemistry) {
		this.chemistry = chemistry;
	}
	public int getMaths() {
		return maths;
	}
	public void setMaths(int maths) {
		this.maths = maths;
	}
//	constructor
	public StudentDto(int id, String name, int physics, int chemistry, int maths) {
		super();
		this.id = id;
		this.name = name;
		this.physics = physics;
		this.chemistry = chemistry;
		this.maths = maths;
	}
	
	
	
}

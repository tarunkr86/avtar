package avtar.controller.form;

import avtar.model.Position;

public class PositionForm {
	
	private int id;	
	private String name;	
	private String template;
	private int departmentId;
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
	public String getTemplate() {
		return template;
	}
	public void setTemplate(String template) {
		this.template = template;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public Position updatePosition(Position position){
		position.setId(this.getId());
		position.setName(this.getName());
		position.setTemplate(getTemplate());
		return position;
		
	}
}

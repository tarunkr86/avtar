package avtar.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Configurable;

@Configurable(autowire = Autowire.BY_TYPE)
@Entity
@Table(name = "position")
public class Position  {

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;

	@Column(name = "name")
	private String name;

	@Column(name = "template")
	@Lob
	private String template;
	
	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "department_id")
	private CompanyDepartment department;
	
	@Transient
	private int departmentId ;

	public Position() {
		super();
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String positionName) {
		this.name = positionName.trim();
	}

	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}

	public CompanyDepartment getDepartment() {
		return department;
	}

	public void setDepartment(CompanyDepartment department) {
		this.department = department;
	}

	public int getDepartmentId() {
		
		return this.department.getId();
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
		
	}

	
}

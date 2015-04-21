package avtar.model;

import static javax.persistence.CascadeType.*;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Configurable;

@Configurable(autowire = Autowire.BY_TYPE)
@Entity
@Table(name = "department")
public class CompanyDepartment {
	
	@Transient
	private int hash = -1;
		
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;

	@Column(name = "name")
	private String name;
	
	@OneToMany(cascade = ALL, fetch=FetchType.EAGER,orphanRemoval = true)
	@JoinColumn(name = "department_id", referencedColumnName = "id")	
	private Set<Position> positions = new HashSet<Position>();
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name = "department_id")
	@JsonIgnore
	private Set<User> users = new HashSet<User>();
	
	@ManyToMany(cascade = CascadeType.DETACH,fetch=FetchType.EAGER)
	@JoinTable(name = "department_location", joinColumns = @JoinColumn(name = "department_id"), inverseJoinColumns = @JoinColumn(name = "company_location_id"))
	private Set<CompanyLocation> companyLocations = new HashSet<CompanyLocation>();

	@Column(name = "department_code")
	private String departmentCode;

	@Column(name = "abbreviation")
	private String abbreviation;

	@Column(name = "email_address")
	private String emailAddress;

	@ManyToOne
	@JoinColumn(name = "company_id")
	private Company company;

	public CompanyDepartment() {
		//
	}

	public CompanyDepartment(Company c, String departmentCode, String abbreviation, String name) {
		this.company = c;
		this.departmentCode = departmentCode;
		this.abbreviation = abbreviation;
		this.name = name;
	}

	// TODO why have this???
	protected CompanyDepartment(String name, String code, String abbreviation) {
		this.name = name;
		this.departmentCode = code;
		this.abbreviation = abbreviation;
	}

	public CompanyDepartment(String name, String departmentCode, String abbreviation, Company company, String emailAddress) {
		this.name = name;
		this.departmentCode = departmentCode;
		this.abbreviation = abbreviation;
		this.company = company;
		this.emailAddress = emailAddress;
	}

	public Company getCompany() {
		return company;
	}

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getAbbreviation() {
		return abbreviation;
	}

	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}
	
	public void setCompanyLocations(Set<CompanyLocation> companyLocations) {
		this.companyLocations = companyLocations;
	}

	
	public Set<CompanyLocation> getCompanyLocations() {
		return companyLocations;
	}
		
	public void addCompanyLocation(CompanyLocation companyLocation) {
		this.companyLocations.add(companyLocation);
		companyLocation.addDepartment(this);
	}

	public int getId() {
		return id;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	// TODO make this better :(
	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setCompany(Company company) {
		this.company = company;
	}
	@JsonIgnore
	public Set<Position> getPositions() {
		return positions;
	}

	public void setPositions(Set<Position> positions) {
		this.positions = positions;
	}
	public Position addPosition(Position position) {		
		positions.add(position);
		return position;		
	}	
	
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public User addUser(User user) {		
		users.add(user);
		return user;		
	}
}


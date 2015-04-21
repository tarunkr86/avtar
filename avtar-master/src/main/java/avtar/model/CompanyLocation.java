package avtar.model;

import java.util.HashSet;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Configurable;

@Configurable(autowire = Autowire.BY_TYPE)
@Entity
@Table(name="company_location")
public class CompanyLocation {
	
	@Transient
	private int hash = -1;
	
	
	@ManyToOne
	@JoinColumn(name="company_id")	
	private Company company;
	
	@JsonIgnore
    @ManyToMany(mappedBy = "companyLocations", cascade=CascadeType.ALL)
	private Set<CompanyDepartment> departments = new HashSet<CompanyDepartment>();
   
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
	
    @Column(name="name")
	private String name;

    @Column(name="location_type")
	private String locationType;

    @Column(name="abbreviation")
	private String abbreviation;

    @Column(name = "city")
    private String city;

    @Column(name = "state")
    private String state;
    
    @Column(name = "country")
    private String country;

    @Column(name = "postal_code")
    private String postalCode;

   
    @Enumerated(EnumType.STRING)
    @Column(name = "qualifier")
    private AddressQualifier qualifier;
    
    @Column(name = "street1")
    private String street1;

    @Column(name = "street2")
    private String street2;

	public CompanyLocation() {}
	
	public CompanyLocation(String name, String locationType, String abbreviation,String street1,String street2,String city,String state,String postalCode,String country) {
		this.name = name;
		this.locationType = locationType;
		this.abbreviation = abbreviation;
		this.street1=street1;
		this.street2=street2;
		this.city=city;
		this.state=state;
		this.postalCode=postalCode;
		this.country=country;					
	}
	
	public String getLocationType() {
		return locationType;
	}

	public void setLocationType(String locationType) {
		this.locationType = locationType;
	}

	public String getAbbreviation() {
		return abbreviation;
	}

	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}


	
	public Company getCompany() {
		return company;
	}

	protected void setId(int id) {
		this.id = id;
	}
	
	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setCompany(Company c) {
		this.company = c;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	

	public AddressQualifier getQualifier() {
		return qualifier.BUSINESS;
	}

	public void setQualifier(AddressQualifier qualifier) {
		this.qualifier = qualifier;
	}

	public String getStreet1() {
		return street1;
	}

	public void setStreet1(String street1) {
		this.street1 = street1;
	}

	public String getStreet2() {
		return street2;
	}

	public void setStreet2(String street2) {
		this.street2 = street2;
	}

	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void addDepartment(CompanyDepartment dept) {
		this.departments.add(dept);
	}
	
	@Override
	public String toString() {
		return "id: " + id + ", name=" + name;
	}
	
	
}


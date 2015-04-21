package avtar.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
public class Company {

	@Id
	@GeneratedValue	
	private int id;		
	private String name;		
	private String notes;
	private String url;
	private String city;
	private String country;
	private String postalCode;
	private String province;
	private String fax;
	private String mobile;
	private String primaryPhone;
	private String secondaryPhone;
	@Enumerated(EnumType.STRING)
	@Column(name = "qualifier")
	private AddressQualifier qualifier; 
	private String street1;
	private String street2;
		
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name = "company_id")
	@JsonIgnore
	private Set<CompanyLocation> locations = new HashSet<CompanyLocation>();
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name = "company_id")
	@JsonIgnore
	private Set<CompanyDepartment> departments = new HashSet<CompanyDepartment>();
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name = "company_id")
	@JsonIgnore
	private Set<Agency> agencys = new HashSet<Agency>();
	
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

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	

	public String getPrimaryPhone() {
		return primaryPhone;
	}

	public void setPrimaryPhone(String primaryPhone) {
		this.primaryPhone = primaryPhone;
	}

	public String getSecondaryPhone() {
		return secondaryPhone;
	}

	public void setSecondaryPhone(String secondaryPhone) {
		this.secondaryPhone = secondaryPhone;
	}

	public AddressQualifier getQualifier() {
		return qualifier;
	}

	public void setQualifier(AddressQualifier qualifier) {
		String role = "BUSINESS";

		AddressQualifier roleEnum = AddressQualifier.valueOf(role);
		this.qualifier = roleEnum;
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

	public void setLocations(Set<CompanyLocation> locations) {
		this.locations = locations;
	}
	
	public void setDepartments(Set<CompanyDepartment> departments) {
		this.departments = departments;
	}

	public CompanyLocation addLocation(CompanyLocation location) {		
		locations.add(location);
		return location;		
	}
	public CompanyDepartment addDepartment(CompanyDepartment department) {		
		departments.add(department);
		return department;		
	}
	
	public void setAgencys(Set<Agency> agencys) {
		this.agencys = agencys;
	}

	public Agency addAgency(Agency agency) {		
		agencys.add(agency);
		return agency;		
	}
	public void setStreet2(String street2) {
		this.street2 = street2;
	}

	@Override
    public boolean equals(Object object) {
        if (object instanceof Contact){
            Company company = (Company) object;
            return company.id == id;
        }
        return false;
    }

    @Override
    public int hashCode() {
        return id;
    }
}


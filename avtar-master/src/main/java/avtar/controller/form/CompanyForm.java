package avtar.controller.form;

import org.codehaus.jackson.annotate.JsonIgnore;

import avtar.model.Address;
import avtar.model.Company;

public class CompanyForm {

	private String name;
	private String url;
	private String notes;
	private String fax;
	private String mobile;
	private String primary;
	private String secondary;
	private int id;
	private Integer version;
	private Address address;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public String getPrimary() {
		return primary;
	}

	public void setPrimary(String primary) {
		this.primary = primary;
	}

	public String getSecondary() {
		return secondary;
	}

	public void setSecondary(String secondary) {
		this.secondary = secondary;
	}

	public CompanyForm() {
		this.address = new Address();
	}

	public CompanyForm(Address address) {
		this.address = address;
	}

	public CompanyForm(Company company) {
		this();
	   // this.setId(company.getId());
	    //this.setVersion(company.getVersion());
	   // this.setAddress(company.getAddresses().get(0));
	   // this.setUrl(company.getWebSite());
	   /* List<Phone> phones = company.getPhones();
	   if (phones != null && phones.size() > 0) {
	    	for (Phone phone : phones) {
	    		if (phone.getQualifier().equals(PhoneQualifier.PRIMARY)) {
	    			this.setPrimary(phone.getNumber());
	    		} else if (phone.getQualifier().equals(PhoneQualifier.SECONDARY)) {
	    			this.setSecondary(phone.getNumber());
	    		} else if (phone.getQualifier().equals(PhoneQualifier.MOBILE)) {
	    			this.setMobile(phone.getNumber());
	    		} else if (phone.getQualifier().equals(PhoneQualifier.FAX)) {
	    			this.setFax(phone.getNumber());
	    		}
	    	}
	    }*/
	    this.setName(company.getName());
	    this.setNotes(company.getNotes());
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

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getName() {
		return name;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getAddress1() {
		return address.getStreet1();
	}

	public String getAddress2() {
		return address.getStreet2();
	}

	public void setAddress1(String address1) {
		address.setStreet1(address1);
	}

	public void setAddress2(String address2) {
		address.setStreet2(address2);
	}

	public void setCity(String city) {
		address.setCity(city);
	}

	public String getCity() {
		return address.getCity();
	}

	public String getProvince() {
		return address.getProvince();
	}

	public void setProvince(String state) {
		address.setProvince(state);
	}
	
	public String getPostalCode() {
		return address.getPostalCode();
	}

	public void setPostalCode(String postalCode) {
		address.setPostalCode(postalCode);
	}
	
	public String getCountry() {
		return address.getCountry();
	}
	
	public void setCountry(String country) {
		address.setCountry(country);
	}

	
	public Company getUpdateCompany(Company companyUpdate) {
		//Company companyUpdate = new Company();
		companyUpdate.setId(this.getId());
	    //companyUpdate.setWebSite(this.getUrl());
	    companyUpdate.setName(this.getName());
	    companyUpdate.setNotes(this.getNotes());
	   // companyUpdate.setVersion(this.getVersion());
	   /* Address address = this.getAddress();
	    companyUpdate.addAddress(address);
	    if (!StringUtils.isEmpty(this.getFax())) {
	    	Phone p = PhoneQualifier.FAX.createPhone();
	    	p.setNumber(this.getFax());
	    	companyUpdate.addPhone(p);
	    }
	    if (!StringUtils.isEmpty(this.getPrimary())) {
	    	Phone p = PhoneQualifier.PRIMARY.createPhone();
	    	p.setNumber(this.getPrimary());
	    	companyUpdate.addPhone(p);
	    }
	    if (!StringUtils.isEmpty(this.getSecondary())) {
	    	Phone p = PhoneQualifier.SECONDARY.createPhone();
	    	p.setNumber(this.getSecondary());
	    	companyUpdate.addPhone(p);
	    }
	    if (!StringUtils.isEmpty(this.getMobile())) {
	    	Phone p = PhoneQualifier.MOBILE.createPhone();
	    	p.setNumber(this.getMobile());
	    	companyUpdate.addPhone(p);
	    }*/
		return companyUpdate;
	}
	@JsonIgnore
	public Company getCompany() {
		Company company = new Company();
	    //company.setWebSite(this.getUrl());
	    company.setName(this.getName());
	    company.setNotes(this.getNotes());
	   // company.setVersion(this.getVersion());
	   /* Address address = this.getAddress();
	    company.addAddress(address);
	    if (!StringUtils.isEmpty(this.getFax())) {
	    	Phone p = PhoneQualifier.FAX.createPhone();
	    	p.setNumber(this.getFax());
	    	company.addPhone(p);
	    }
	    if (!StringUtils.isEmpty(this.getPrimary())) {
	    	Phone p = PhoneQualifier.PRIMARY.createPhone();
	    	p.setNumber(this.getPrimary());
	    	company.addPhone(p);
	    }
	    if (!StringUtils.isEmpty(this.getSecondary())) {
	    	Phone p = PhoneQualifier.SECONDARY.createPhone();
	    	p.setNumber(this.getSecondary());
	    	company.addPhone(p);
	    }
	    if (!StringUtils.isEmpty(this.getMobile())) {
	    	Phone p = PhoneQualifier.MOBILE.createPhone();
	    	p.setNumber(this.getMobile());
	    	company.addPhone(p);
	    }*/
		return company;
	}
}


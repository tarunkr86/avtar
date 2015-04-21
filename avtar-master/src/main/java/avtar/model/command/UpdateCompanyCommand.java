package avtar.model.command;

import java.util.ArrayList;
import java.util.List;

import avtar.model.Address;
import avtar.model.Phone;

public class UpdateCompanyCommand {

	private String url;
	private String name;
	private String notes;
	private List<Phone> phones = new ArrayList<Phone>();
	private List<Address> addresses = new ArrayList<Address>();

	public void setWebSite(String url) {
		this.url = url;
		
	}

	public void setName(String name) {
		this.name = name;
		
	}

	public void setNotes(String notes) {
		this.notes = notes;
		
	}

	public void addAddress(Address address) {
		this.addresses.add(address);	
	}

	public void addPhone(Phone p) {
		this.phones.add(p);
	}

	public String getName() {
		return this.name;
	}

	public String getNotes() {
		return this.notes;
	}

	public String getWebSite() {
		return this.url;
	}

	public List<Phone> getPhones() {
		return new ArrayList<Phone>(this.phones);
	}

	public List<Address> getAddresses() {
		return new ArrayList<Address>(this.addresses );
	}
}

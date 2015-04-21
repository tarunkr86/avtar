package avtar.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;


import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
public class Nationality {

	@Id
	@GeneratedValue	
	private int id;			
	private String country;
	private String name;
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name = "nationality_id")
	@JsonIgnore
	private Set<Agency> agencies = new HashSet<Agency>();
	
	
	
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
	
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public void setAgencies(Set<Agency> agencies) {
		this.agencies = agencies;
	}
	
}

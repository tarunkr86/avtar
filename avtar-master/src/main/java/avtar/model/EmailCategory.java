package avtar.model;

import static javax.persistence.CascadeType.ALL;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Configurable;

@Configurable(autowire = Autowire.BY_TYPE)
@Entity
@Table(name = "email_category")
public class EmailCategory {

	@Transient
	private int hash = -1;
		
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;

	@Column(name = "name")
	private String name;
	
	@OneToMany(cascade = ALL, fetch=FetchType.EAGER,orphanRemoval = true)
	@JoinColumn(name = "category_id", referencedColumnName = "id")	
	private Set<EmailTemplate> emailTemplates = new HashSet<EmailTemplate>();

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
	@JsonIgnore
	public Set<EmailTemplate> getEmailTemplates() {
		return emailTemplates;
	}

	public void setEmailTemplates(Set<EmailTemplate> emailTemplates) {
		this.emailTemplates = emailTemplates;
	}
	
	
}

package avtar.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Configurable;

@Configurable(autowire = Autowire.BY_TYPE)
@Entity
@Table(name = "email_template")
public class EmailTemplate {
	
	@Transient
	private int hash = -1;
		
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;

	@Column(name = "name")
	private String name;
	
	@Column(name = "subject")
	private String subject;
	
	@Column(name = "message")
	private String message;
	
	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "category_id")
	private EmailCategory category;
	
	@Transient
	private int categoryId ;
	
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public EmailCategory getCategory() {
		return category;
	}

	public void setCategory(EmailCategory category) {
		this.category = category;
	}

	public int getCategoryId() {
		return this.category.getId();
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
}

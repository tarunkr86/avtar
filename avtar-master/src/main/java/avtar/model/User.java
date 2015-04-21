package avtar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
//import javax.persistence.EnumType;
//import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "system_user")
public class User {

    @Id
    @GeneratedValue
    private int id;
    private String prefix;
    private String name;
    private String phone;
    private String email;
    private String title;
    
    @ManyToOne
	@JoinColumn(name = "department_id")
	private CompanyDepartment companyDepartment;
    
    private String assignableRecruiter;
    private String enabled;   
   // @Enumerated(EnumType.STRING)
    @Column(name = "user_role")
    private String role;
    private String password; 
    
    @Transient
	private int departmentId ;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
    	
    	//Role roleEnum=Role.valueOf(role);
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }
   
	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAssignableRecruiter() {
		return assignableRecruiter;
	}

	public void setAssignableRecruiter(String assignableRecruiter) {
		this.assignableRecruiter = assignableRecruiter;
	}

	public CompanyDepartment getCompanyDepartment() {
		return companyDepartment;
	}

	public void setCompanyDepartment(CompanyDepartment companyDepartment) {
		this.companyDepartment = companyDepartment;
	}
	
   public int getDepartmentId() {
		if(this.companyDepartment!=null){
		return this.companyDepartment.getId();
		}else{
			return 0;
		}
			
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
		
	}
}
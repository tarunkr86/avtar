package avtar.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.annotate.JsonProperty;

@Embeddable
public class Phone {

	@Column(name = "area_code")
	private String areaCode;
	@Column(name = "country_access_code")
	private String countryAccessCode;

	@Column(name = "extension")
	private String extension;
	@Column(name = "number")
	private String number;

	@Column(name = "outside_access_number")
	private String outsideAccessNumber;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "qualifier")
	private PhoneQualifier qualifier;
	
	@SuppressWarnings("unused")
	private Phone() {
	}

	public Phone(PhoneQualifier qualifier) {
		this.qualifier = qualifier;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public String getCountryAccessCode() {
		return countryAccessCode;
	}

	public String getExtension() {
		return extension;
	}

	public String getNumber() {
		return number;
	}

	public String getOutsideAccessNumber() {
		return outsideAccessNumber;
	}

	public PhoneQualifier getQualifier() {
		return qualifier;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public void setCountryAccessCode(String countryAccessCode) {
		this.countryAccessCode = countryAccessCode;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public void setOutsideAccessNumber(String outsideAccessNumber) {
		this.outsideAccessNumber = outsideAccessNumber;
	}

	public void setQualifier(PhoneQualifier qualifier) {
		this.qualifier = qualifier;
	}
	@JsonProperty
	public String formatted() {
	  return StringUtils.join(new String[]{getCountryAccessCode(),getAreaCode(), getNumber()}, "-");
	}
	@JsonProperty
	public String formattedFully() {
		StringBuilder sb = new StringBuilder(this.formatted());
	  return (StringUtils.isBlank(this.getExtension()))?
			  sb.toString():sb.append(" ext: ").append(this.getExtension()).toString();
	}
}


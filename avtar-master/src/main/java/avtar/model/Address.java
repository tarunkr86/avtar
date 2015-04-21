package avtar.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import org.apache.commons.lang.StringUtils;

@Embeddable
public class Address {

  //@Column(name = "attention")
 // private String attention;

  @Column(name = "city")
  private String city;

  @Column(name = "country")
  private String country;

  @Column(name = "postal_code")
  private String postalCode;

  @Column(name = "province")
  private String province;

  @Enumerated(EnumType.STRING)
  @Column(name = "qualifier")
  private AddressQualifier qualifier;
  
  @Column(name = "street1")
  private String street1;

  @Column(name = "street2")
  private String street2;

  public Address() {

  }

  public Address(AddressQualifier qualifier) {
    this.qualifier = qualifier;
  }

 // public String getAttention() {
   // return attention;
 // }

  public String getCity() {
    return city;
  }

  public String getPostalCode() {
    return postalCode;
  }

  public AddressQualifier getQualifier() {
    return qualifier;
  }

  public String getStreet1() {
    return street1;
  }

  public String getStreet2() {
    return street2;
  }

  //public void setAttention(String attention) {
    //this.attention = attention;
  //}

  public void setCity(String city) {
    this.city = city;
  }

  public String getCountry() {
    return country;
  }

  public void setCountry(String country) {
    this.country = country;
  }

  public String getProvince() {
    return province;
  }

  public void setProvince(String province) {
    this.province = province;
  }

  public void setPostalCode(String postalCode) {
    this.postalCode = postalCode;
  }

  public void setQualifier(AddressQualifier qualifier) {
    this.qualifier = qualifier;
  }

  public void setStreet1(String street1) {
    this.street1 = street1;
  }

  public void setStreet2(String street2) {
    this.street2 = street2;
  }

  public String formatted() {
    return StringUtils.join(new String[] { getStreet1(), getStreet2(), getCity() + ", " + getProvince() + ", " + getPostalCode() },
        "\n");
  }

}


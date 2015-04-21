package avtar.model;

public enum AddressQualifier {

	HOME, BUSINESS, SHIPPING, BILLING,CURRENT;
	
	public Address createAddress() {
		return new Address(this);
	}
}

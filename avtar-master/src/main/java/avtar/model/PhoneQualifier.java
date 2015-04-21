package avtar.model;

public enum PhoneQualifier {
	
	PRIMARY, SECONDARY, HOME, WORK, MOBILE, FAX;

	public Phone createPhone() {
		return new Phone(this);
	}
}

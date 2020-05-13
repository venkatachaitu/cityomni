package com.chaitu.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "userlogin")
@Table(name = "userlogin")
public class UserLogin {
	@Id
	public  String userName;
	public String password;
	public String mobileNo;
	public String email;
	public String gender;
	public String dob;
	public String city;
	public String country;
	public String pin;
	public String registrationDate;
	public String activeStatus;
	public String privateFields;
	public String lastLogin;
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(String activeStatus) {
		this.activeStatus = activeStatus;
	}
	
	

	public String getPrivateFields() {
		return privateFields;
	}

	public void setPrivateFields(String privateFields) {
		this.privateFields = privateFields;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

	@Override
	public String toString() {
		return "UserLogin [userName=" + userName + ", password=" + password + ", mobileNo=" + mobileNo + ", email="
				+ email + ", gender=" + gender + ", dob=" + dob + ", city=" + city + ", country=" + country + ", pin="
				+ pin + ", registrationDate=" + registrationDate + ", activeStatus=" + activeStatus + ", privateFields="
				+ privateFields + ", lastLogin=" + lastLogin + "]";
	}

	public UserLogin(String userName, String password, String mobileNo, String email, String gender, String dob,
			String city, String country, String pin, String registrationDate, String activeStatus, String privateFields,
			String lastLogin) {
		super();
		this.userName = userName;
		this.password = password;
		this.mobileNo = mobileNo;
		this.email = email;
		this.gender = gender;
		this.dob = dob;
		this.city = city;
		this.country = country;
		this.pin = pin;
		this.registrationDate = registrationDate;
		this.activeStatus = activeStatus;
		this.privateFields = privateFields;
		this.lastLogin = lastLogin;
	}

	public UserLogin() {
		super();
	}

}

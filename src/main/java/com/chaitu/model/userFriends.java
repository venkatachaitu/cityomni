package com.chaitu.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "userFriends")
@Table(name = "userFriends")
public class userFriends {

	@Id
	public String userName;
	public String userFriends;
	public String yourRequests;
	public String sentRequests;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserFriends() {
		return userFriends;
	}
	public void setUserFriends(String userFriends) {
		this.userFriends = userFriends;
	}
	public String getYourRequests() {
		return yourRequests;
	}
	public void setYourRequests(String yourRequests) {
		this.yourRequests = yourRequests;
	}
	public String getSentRequests() {
		return sentRequests;
	}
	public void setSentRequests(String sentRequests) {
		this.sentRequests = sentRequests;
	}
	@Override
	public String toString() {
		return "userFriends [userName=" + userName + ", userFriends=" + userFriends + ", yourRequests=" + yourRequests
				+ ", sentRequests=" + sentRequests + "]";
	}
	public userFriends(String userName, String userFriends, String yourRequests, String sentRequests) {
		super();
		this.userName = userName;
		this.userFriends = userFriends;
		this.yourRequests = yourRequests;
		this.sentRequests = sentRequests;
	}
	public userFriends() {
		super();
	}
	
	
}

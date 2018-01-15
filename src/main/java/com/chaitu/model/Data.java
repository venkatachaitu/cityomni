/*package com.chaitu.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="data")
public class Data {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="pkId")
	public int pkId;	
	
	@Column(name="user")
	public String user;	
	
	@Column(name="area")
	public String area;	
	
	@Column(name="comment")
	public String comment;
	
	@Column(name="date")
	@Temporal(TemporalType.TIMESTAMP)
	public Date date;

	 

	public int getPkId() {
		return pkId;
	}

	public void setPkId(int pkId) {
		this.pkId = pkId;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Data [pkId=" + pkId + ", user=" + user + ", area=" + area
				+ ", comment=" + comment + ", date=" + date + "]";
	}
	
}
*/
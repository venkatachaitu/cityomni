package com.chaitu.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "userPosts")
@Table(name = "userPosts")
public class UserPosts {
	@Id
	public String postId;
	public String dateTime;
	public String userPost;
	public String likeUsers;
	public String userName;
	public String privacy;
	
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getUserPost() {
		return userPost;
	}
	public void setUserPost(String userPost) {
		this.userPost = userPost;
	}
	public String getLikeUsers() {
		return likeUsers;
	}
	public void setLikeUsers(String likeUsers) {
		this.likeUsers = likeUsers;
	}
	public String getuserName() {
		return userName;
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}
	public String getPrivacy() {
		return privacy;
	}
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}
	@Override
	public String toString() {
		return "UserPosts [postId=" + postId + ", dateTime=" + dateTime + ", userPost=" + userPost + ", likeUsers="
				+ likeUsers + ", userName=" + userName + ", privacy=" + privacy + "]";
	}
	public UserPosts(String postId, String dateTime, String userPost, String likeUsers, String userName, String privacy) {
		super();
		this.postId = postId;
		this.dateTime = dateTime;
		this.userPost = userPost;
		this.likeUsers = likeUsers;
		this.userName = userName;
		this.privacy = privacy;
	}
	public UserPosts() {
		super();
	}
}

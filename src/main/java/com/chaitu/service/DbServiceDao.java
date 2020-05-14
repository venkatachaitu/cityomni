package com.chaitu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.chaitu.model.DataTable;
import com.chaitu.model.UserLogin;
import com.chaitu.model.UserPosts;
@Service
public interface DbServiceDao {
	
	public void addConfession(DataTable data);

	public List<DataTable> readAllConfession();
	
	public List<DataTable> readConfessionByArea(String area);
	
	public List<DataTable> readallAreas();
	
	public boolean registerUser(UserLogin user);
	
	public UserLogin loginUser(UserLogin user);
	
	public UserLogin getUser(String userName);

	public UserLogin updateUser(UserLogin user);
	
	public String lastLoginTimeUpdate(String userName, String string);
	
	public UserPosts addUserPost(UserPosts post);
	
	public List<UserPosts> readAllPosts(String user);

	public void likeUser(String postId, String userName);

	public void updatePrivacy(String postId, String userName, String privacy);

	public List<String> findFriends(String value);

	public UserLogin viewSearchProfile(String userName);

	public void deletePost(String postId);
	
	
}

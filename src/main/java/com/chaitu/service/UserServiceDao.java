package com.chaitu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.chaitu.model.Data;
@Service
public interface UserServiceDao {
	
	public void addConfession(Data data);

	public List<Data> readAllConfession();
	
	public List<Data> readConfessionByArea(String area);
	
	public List<Data> readallAreas();

}

package com.chaitu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.chaitu.model.DataTable;
@Service
public interface DbServiceDao {
	
	public void addConfession(DataTable data);

	public List<DataTable> readAllConfession();
	
	public List<DataTable> readConfessionByArea(String area);
	
	public List<DataTable> readallAreas();

}

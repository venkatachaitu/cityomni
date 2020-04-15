package com.excel.model;

public class SprintData {
	public String sprintName;
	public String startDate;
	public String endDate;
	public SprintData() {
		super();
	}
	public SprintData(String sprintName, String startDate, String endDate) {
		super();
		this.sprintName = sprintName;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public String getSprintName() {
		return sprintName;
	}
	public void setSprintName(String sprintName) {
		this.sprintName = sprintName;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "SprintData [sprintName=" + sprintName + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	 

	

}

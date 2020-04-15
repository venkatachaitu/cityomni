package com.excel.model;

public class ReportData2 {
	public String issueKey;
	public String assgnee;
	public int points;
	public String status;
	public String getIssueKey() {
		return issueKey;
	}
	public void setIssueKey(String issueKey) {
		this.issueKey = issueKey;
	}
	public String getAssgnee() {
		return assgnee;
	}
	public void setAssgnee(String assgnee) {
		this.assgnee = assgnee;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ReportData2 [issueKey=" + issueKey + ", assgnee=" + assgnee + ", points=" + points + ", status="
				+ status + "]";
	}
	public ReportData2(String issueKey, String assgnee, int points, String status) {
		super();
		this.issueKey = issueKey;
		this.assgnee = assgnee;
		this.points = points;
		this.status = status;
	}
	public ReportData2() {
		super();
	}

	

}

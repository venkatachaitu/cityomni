package com.chaitu.model;

import org.springframework.stereotype.Component;

@Component
public class RadarSearchRespose {
	@Override
	public String toString() {
		return "RadarSearchRespose [place_id=" + place_id + ", distance="
				+ distance + "]";
	}

	public RadarSearchRespose() {
		super();
	}

	public String place_id;
	public Double distance;
	public String getPlace_id() {
		return place_id;
	}

	public void setPlace_id(String place_id) {
		this.place_id = place_id;
	}

	public Double getDistance() {
		return distance;
	}

	public void setDistance(Double distance) {
		this.distance = distance;
	}
	
	public RadarSearchRespose(String place_id, Double distance) {
		this.place_id = place_id;
		this.distance  = distance;
	}
}
 
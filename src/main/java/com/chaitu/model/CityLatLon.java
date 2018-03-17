package com.chaitu.model;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonProperty;

@Component
public class CityLatLon {
	@Override
	public String toString() {
		return "CityLatLon [city=" + city + ", lat=" + lat + ", lon=" + lon
				+ "]";
	}
	@JsonProperty
	public String city;
	@JsonProperty
	public String lat;
	@JsonProperty
	public String lon;
}

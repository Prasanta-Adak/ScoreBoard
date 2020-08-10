package com.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CricketSchedule")
public class AddCricketSchedule {
	
	@Id
	private int id;
	private String type;
	private String firstTeam;
	private String secondTeam;
	private String matchDate;
	private String time;
	private String live;
	
	public AddCricketSchedule(int id, String type, String firstTeam, String secondTeam, String matchDate, String time,
			String live) {
		super();
		this.id = id;
		this.type = type;
		this.firstTeam = firstTeam;
		this.secondTeam = secondTeam;
		this.matchDate = matchDate;
		this.time = time;
		this.live = live;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstTeam() {
		return firstTeam;
	}
	public void setFirstTeam(String firstTeam) {
		this.firstTeam = firstTeam;
	}
	public String getSecondTeam() {
		return secondTeam;
	}
	public void setSecondTeam(String secondTeam) {
		this.secondTeam = secondTeam;
	}
	public String getMatchDate() {
		return matchDate;
	}
	public void setMatchDate(String matchDate) {
		this.matchDate = matchDate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public AddCricketSchedule() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLive() {
		return live;
	}
	public void setLive(String live) {
		this.live = live;
	}
	
	

}

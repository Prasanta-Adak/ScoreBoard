package com.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class AddSecondTeamScore {
	
	@Id
	private int id;
	private int match_id;
	private String teamName;
	private String player;
	private int four;
	private int six;
	private int other;
	
	
	public AddSecondTeamScore() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMatch_id() {
		return match_id;
	}
	public AddSecondTeamScore(int id, int match_id, String teamName, String player, int four, int six, int other) {
		super();
		this.id = id;
		this.match_id = match_id;
		this.teamName = teamName;
		this.player = player;
		this.four = four;
		this.six = six;
		this.other = other;
	}
	public void setMatch_id(int match_id) {
		this.match_id = match_id;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getPlayer() {
		return player;
	}
	public void setPlayer(String player) {
		this.player = player;
	}
	public int getFour() {
		return four;
	}
	public void setFour(int four) {
		this.four = four;
	}
	public int getSix() {
		return six;
	}
	public void setSix(int six) {
		this.six = six;
	}
	public int getOther() {
		return other;
	}
	public void setOther(int other) {
		this.other = other;
	}
	

}

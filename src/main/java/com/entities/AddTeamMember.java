package com.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="team_member")
public class AddTeamMember {
	
	@Id
	private int id;
	private String playerName;
	private String playerType;
	private String teamName;
	
	public AddTeamMember(int id, String playerName, String playerType, String teamName) {
		super();
		this.id = id;
		this.playerName = playerName;
		this.playerType = playerType;
		this.teamName = teamName;
	}
	
	public AddTeamMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	public String getPlayerType() {
		return playerType;
	}
	public void setPlayerType(String playerType) {
		this.playerType = playerType;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

}

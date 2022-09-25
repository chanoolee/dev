package org.hdcd.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Platform {

	private int listno;
	private String title;
	private String actor;
	private String genre;
	private String link;
	private Date playdate;
	private String story;
	private int viewcount;
	private String platform;
	private int category;
	private String poster;
}

package com.blog.entity;
// Generated 2017-4-7 20:34:55 by Hibernate Tools 3.5.0.Final

/**
 * Connect generated by hbm2java
 */
public class Connect implements java.io.Serializable {

	private Integer id;
	private String title;
	private String name;
	private String target;

	public Connect() {
	}

	public Connect(String name, String target) {
		this.name = name;
		this.target = target;
	}

	public Connect(String title, String name, String target) {
		this.title = title;
		this.name = name;
		this.target = target;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTarget() {
		return this.target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

}

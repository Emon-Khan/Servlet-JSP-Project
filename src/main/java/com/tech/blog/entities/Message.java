package com.tech.blog.entities;

public class Message {
	private String Content;
	private String Type;
	private String cssClass;
	public Message(String content, String type, String cssClass) {
		super();
		Content = content;
		Type = type;
		this.cssClass = cssClass;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
	
}

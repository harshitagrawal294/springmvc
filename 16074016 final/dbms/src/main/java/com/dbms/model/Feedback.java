package com.dbms.model;

import java.sql.Time;
import java.util.Date;

public class Feedback {

	private int feedbackid;
	private int orderid;
	private Date feedbackdate;
	private Time feedbacktime;
	private String feedback;
	private String username;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getFeedbackid() {
		return feedbackid;
	}
	public void setFeedbackid(int feedbackid) {
		this.feedbackid = feedbackid;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public Date getFeedbackdate() {
		return feedbackdate;
	}
	public void setFeedbackdate(Date feedbackdate) {
		this.feedbackdate = feedbackdate;
	}
	public Time getFeedbacktime() {
		return feedbacktime;
	}
	public void setFeedbacktime(Time feedbacktime) {
		this.feedbacktime = feedbacktime;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
}

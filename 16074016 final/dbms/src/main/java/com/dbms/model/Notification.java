package com.dbms.model;

import java.sql.Time;
import java.util.Date;

public class Notification {

	private int notificationid;
	private String notification;
	private Date notificationdate;
	private Time notificationtime;
	
	public int getNotificationid() {
		return notificationid;
	}
	public void setNotificationid(int notificationid) {
		this.notificationid = notificationid;
	}
	public String getNotification() {
		return notification;
	}
	public void setNotification(String notification) {
		this.notification = notification;
	}
	public Date getNotificationdate() {
		return notificationdate;
	}
	public void setNotificationdate(Date notificationdate) {
		this.notificationdate = notificationdate;
	}
	public Time getNotificationtime() {
		return notificationtime;
	}
	public void setNotificationtime(Time notificationtime) {
		this.notificationtime = notificationtime;
	}
	
	
}

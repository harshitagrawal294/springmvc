package com.dbms.dao;

import java.util.List;

import com.dbms.model.Notification;

public interface Notificationdao {
	
	public List<Notification> getallNotifications();
	public void addNotification(String notification);
	public Notification getNotificationbyid(int notificationid);
	public void deletenotification(int notificationid);
}

package com.dbms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.dbms.model.Notification;

public class NotificationdaoImpl implements Notificationdao{

	
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Notification> getallNotifications() {
		String sql = "select * from NOTIFICATIONS order by notificationid desc";
		List<Notification> notifications = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Notification>(Notification.class));
		return notifications;
	}

	@Override
	public void addNotification(String notification) {
		
		Date dt = new Date();
		SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = sdfd.format(dt);
		SimpleDateFormat sdft = new SimpleDateFormat("HH:mm:ss");
		String currentTime = sdft.format(dt);
		
		String sql = "insert into NOTIFICATIONS(notification, notificationdate, notificationtime) values(?,?,?)";
		jdbcTemplate.update(sql, new Object[] {notification, currentDate, currentTime});
		
		
		
	}

	@Override
	public Notification getNotificationbyid(int notificationid) {
		String sql = "select * from NOTIFICATIONS where notificationid="+Integer.toString(notificationid);
		return jdbcTemplate.query(sql, new ResultSetExtractor<Notification>() {

			@Override
			public Notification extractData(ResultSet rs) throws SQLException, DataAccessException {
				if(rs.next()) {
					Notification notification = new Notification();
					notification.setNotificationid(rs.getInt("notificationid"));
					notification.setNotification(rs.getString("notification"));
					notification.setNotificationtime(rs.getTime("notificationtime"));
					notification.setNotificationdate(rs.getDate("notificationdate"));
					return notification;
				}
				return null;
			}
			
		});
	}

	@Override
	public void deletenotification(int notificationid) {
		String sql = "delete from NOTIFICATIONS where notificationid=?";
		jdbcTemplate.update(sql, new Object[] {notificationid});
		
	}

}

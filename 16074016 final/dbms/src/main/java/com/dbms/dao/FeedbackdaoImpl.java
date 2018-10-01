package com.dbms.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.dbms.model.Feedback;

public class FeedbackdaoImpl implements Feedbackdao{

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public void addfeedback(Feedback feedback) {
		
		Date dt = new Date();
		SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd");
		String currentDate = sdfd.format(dt);
		SimpleDateFormat sdft = new SimpleDateFormat("HH:mm:ss");
		String currentTime = sdft.format(dt);
		
		String sql = "insert into FEEDBACKS(orderid,feedback,feedbackdate,feedbacktime,feedbackusername) values (?,?,?,?,?)";
		jdbcTemplate.update(sql,feedback.getOrderid(),feedback.getFeedback(),currentDate,currentTime, feedback.getUsername());
	}

	@Override
	public List<Feedback> getFeedbacksbyorderid(int orderid) {
		String sql="select * from FEEDBACKS where orderid="+orderid+" order by feedbackid desc";
		List<Feedback> feedbacks = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Feedback>(Feedback.class));
		return feedbacks;
	}

}

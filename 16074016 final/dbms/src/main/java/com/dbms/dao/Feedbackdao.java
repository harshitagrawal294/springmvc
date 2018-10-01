package com.dbms.dao;

import java.util.List;

import com.dbms.model.Feedback;

public interface Feedbackdao {

	public void addfeedback(Feedback feedback);
	public List<Feedback> getFeedbacksbyorderid(int orderid);
}

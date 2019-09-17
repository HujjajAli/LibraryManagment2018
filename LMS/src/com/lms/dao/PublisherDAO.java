package com.lms.dao;

import java.util.List;

import com.lms.model.Publisher;

public interface PublisherDAO {
	
	public boolean addPublisher(Publisher publisher);
	public List<Publisher> getAllPublisher();

}

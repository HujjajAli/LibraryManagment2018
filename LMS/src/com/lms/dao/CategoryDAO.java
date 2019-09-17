package com.lms.dao;

import java.util.List;

import com.lms.model.Category;

public interface CategoryDAO {

	boolean addCategory(Category category);
	Category getCategory(int id);
	List<Category> getAllCategory();
}

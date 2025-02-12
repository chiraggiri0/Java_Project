package com.dao;

import java.util.List;

import com.entity.book_order;

public interface orderBook {

	public boolean savorder(List<book_order> b);

	public List<book_order> getbook(String email);

	public List<book_order> getbook();
}

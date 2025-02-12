package com.dao;

import java.util.List;

import com.entity.cart;

public interface cartDao {

	public boolean addcart(cart c);
	
	public List<cart>  getbookbyuser(int userid);
	
	public boolean deletebook(int bid,int uid,int cid );
	
}

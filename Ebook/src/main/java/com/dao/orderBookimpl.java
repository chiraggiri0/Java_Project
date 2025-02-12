package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.book_order;

public class orderBookimpl implements orderBook {

	private Connection conn;
	
	public orderBookimpl( Connection conn) {
	super();
	this.conn=conn;
	
	}
	
	public int getorderno() {
		int i = 1;
		try {
			String sql = "select * from cartorder";
			PreparedStatement p = conn.prepareStatement(sql);
			ResultSet r = p.executeQuery();
			while (r.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}


public boolean savorder(List<book_order> blist) {
		boolean f=false;
		try {
			String sql="insert into cartorder (orderid,username,email,address,phone,bookname,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(sql);
			
			for(book_order b:blist) {
			ps.setString(1, b.getOrderid());
			ps.setString(2, b.getUsername());
			ps.setString(3, b.getEmail());
			ps.setString(4, b.getFulladd());
			ps.setString(5, b.getPhone());
			ps.setString(6, b.getBookname());
			ps.setString(7, b.getAuthor());
			ps.setString(8, b.getPrice());
			ps.setString(9, b.getPayment());
			ps.addBatch();
		}
		int[] count = ps.executeBatch();
		conn.commit();
		f = true;
		conn.setAutoCommit(true);

	} catch (Exception e) {
		e.printStackTrace();
	}
	return f;
}

public List<book_order> getbook(String email) {
	List<book_order> list=new ArrayList<book_order>();
	book_order o=null;
	
	try {
		String sql="select * from cartorder where email=?";
		PreparedStatement p=conn.prepareStatement(sql);
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		while (rs.next()) {
			o=new book_order();
			o.setId(rs.getInt(1));
			o.setOrderid(rs.getString(2));
			o.setUsername(rs.getString(3));
			o.setEmail(rs.getString(4));
			o.setFulladd(rs.getString(5));
			o.setPhone(rs.getString(6));
			o.setBookname(rs.getString(7));
			o.setAuthor(rs.getString(8));
			o.setPrice(rs.getString(9));
			o.setPayment(rs.getString(10));
		list.add(o);
		}
		
	} catch (Exception e) {
	e.printStackTrace();
	}
	
	return list;
}

public List<book_order> getbook() {
	List<book_order> list=new ArrayList<book_order>();
	book_order o=null;
	
	try {
		String sql="select * from cartorder";
		PreparedStatement p=conn.prepareStatement(sql);
		ResultSet rs=p.executeQuery();
		while (rs.next()) {
			o=new book_order();
			o.setId(rs.getInt(1));
			o.setOrderid(rs.getString(2));
			o.setUsername(rs.getString(3));
			o.setEmail(rs.getString(4));
			o.setFulladd(rs.getString(5));
			o.setPhone(rs.getString(6));
			o.setBookname(rs.getString(7));
			o.setAuthor(rs.getString(8));
			o.setPrice(rs.getString(9));
			o.setPayment(rs.getString(10));
		list.add(o);
		}
		
	} catch (Exception e) {
	e.printStackTrace();
	}
	
	return list;
}


}

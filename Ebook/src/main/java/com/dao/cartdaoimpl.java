package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.cart;

public class cartdaoimpl implements cartDao {
	private Connection conn;

	public cartdaoimpl(Connection conn) {
		super();
		this.conn = conn;
	}


	public boolean addcart(cart c) {
	boolean f=false;
	
	try {
		String sql="insert into cart(bid,uid,bookname,author,totalprice,price) values(?,?,?,?,?,?)";
		PreparedStatement p=conn.prepareStatement(sql);
		p.setInt(1, c.getBid());
		p.setInt(2, c.getUid());
        p.setString(3, c.getBookname());
        p.setString(4, c.getAuthor());
        p.setDouble(5, c.getTotalprice());
        p.setDouble(6, c.getPrice());
        
        int i=p.executeUpdate();
        if (i==1) {
			f=true;
		} 
        } catch (Exception e) {
	e.printStackTrace();
	}
	
	
	return f;
	}


	public List<cart>  getbookbyuser(int userid) {
		List<cart> list=new ArrayList<>();
		cart b= null;
    double totalprice = 0;
		 try {
			String sql ="select *from cart where uid=?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setInt(1, userid);
           
			ResultSet r=p.executeQuery();
			while (r.next()) {
				b =new cart();
				b.setCid(r.getInt(1));
				b.setBid(r.getInt(2));
				b.setUid(r.getInt(3));
				b.setBookname(r.getString(4));
				b.setAuthor(r.getString(5));
				totalprice=totalprice+r.getDouble(6);
				b.setPrice(r.getDouble(7));
			
				b.setTotalprice(totalprice);
				list.add(b);
			}
		} catch (Exception e) {
		e.printStackTrace();
		}
		return list;
	}


	public boolean deletebook(int bid,int uid,int cid) {
	boolean f=false;
	
	try {
		String sql="delete from cart where bid=? and uid=? and cid=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, bid);
		ps.setInt(2, uid);
		ps.setInt(3, cid);
		int i=ps.executeUpdate();
		if (i==1) {
			f=true;
		}
	} catch (Exception e) {
	e.printStackTrace();
	}
	
		return f;
	}

}

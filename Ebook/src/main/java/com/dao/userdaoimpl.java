package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.user;

public class userdaoimpl implements userdao {
	
	private Connection conn;

	public userdaoimpl(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean userRegister(user us) {
     boolean f=false;
     try {
		String sql="insert into user (name,email,phone,password) values(?,?,?,?)" ;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, us.getName());
		ps.setString(2, us.getEmail());
		ps.setString(3, us.getPhone());
		ps.setString(4, us.getPassword());
      
         int i=ps.executeUpdate();
         if (i==1) {
			f=true;
		}
         
     } catch (Exception e) {
		e.printStackTrace();
	}
		return f;
	}
	
	public user login(String email, String password) {
		user us=null;
		
		try {
		String sql="select * from user where email=? and password=?";	
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, password);
		
		ResultSet rs=ps.executeQuery();
		
		while (rs.next()) {
			us=new user();
			us.setId(rs.getInt(1));
            us.setName(rs.getString(2));
            us.setEmail(rs.getString(3));
            us.setPhone(rs.getString(4));
            us.setPassword(rs.getString(5));
            us.setAddress(rs.getString(6));
            us.setLandmark(rs.getString(7));
            us.setCity(rs.getString(8));
		us.setState(rs.getString(9));
		us.setPincode(rs.getString(10));
		}
		
		} catch (Exception e) {
		}
		
		return us;
	}
	public boolean checkpassword(int id,String passwrod) {
	boolean f=false;
	try {
		String sql="select *from user where id=? and password=?";
		PreparedStatement p=conn.prepareStatement(sql);
		p.setInt(1, id);
		p.setString(2, passwrod);
		
		ResultSet rs=p.executeQuery();
		
		while (rs.next()) {
			f=true;
		}
		
	} catch (Exception e) {
	e.printStackTrace();
	}
	
		return f;
	}
	
	public boolean userupdateproflie(user us) {
		 boolean f=false;
	     try {
			String sql="update user set name=?,email=?,phone=? where id=?" ;
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setInt(4, us.getId());
	      
	         int i=ps.executeUpdate();
	         if (i==1) {
				f=true;
			}
	         
	     } catch (Exception e) {
			e.printStackTrace();
		}
			return f;
	}
	
	public boolean checkuser(String email) {
		boolean f=true;
			try {
				String sql="select *from user where email=?";
				PreparedStatement p=conn.prepareStatement(sql);
				p.setString(1, email);
				ResultSet rs=p.executeQuery();
				
				while (rs.next()) {
					f=false;
				}
				
			} catch (Exception e) {
			e.printStackTrace();
			}
			
				return f;	}
	
	
	
}

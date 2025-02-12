package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.bookdetils;

public class bookdaoimpl implements bookDao {
private Connection conn;
	
public bookdaoimpl(Connection conn) {
	super();
	this.conn = conn;
}

@Override
public boolean addbook(bookdetils b) {
	boolean f = false;
	try {
		String sql = "insert into book_order(author,bookname,price,bookcategory,status,photo,user_email) values(?,?,?,?,?,?,?)";
		PreparedStatement p = conn.prepareStatement(sql);
		p.setString(1, b.getBookname());
		p.setString(2, b.getAuthor());
		p.setString(3, b.getPrice());
		p.setString(4, b.getBookcategory());
		p.setString(5, b.getStatus());
		p.setString(6, b.getPhoto());
		p.setString(7, b.getUser_email());

		int i = p.executeUpdate();
		if (i == 1) {
			f = true;
		} else {

		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return false;
}

	public List<bookdetils> getallbook() {
		List<bookdetils> list = new ArrayList<>();
		bookdetils b = null;

		try {
			String sql = "select * from book_order";
			PreparedStatement p = conn.prepareStatement(sql);
			ResultSet r = p.executeQuery();
			while (r.next()) {
				b = new bookdetils();
				b.setBookid(r.getInt(1));
				b.setAuthor(r.getString(2));
				b.setBookname(r.getString(3));
				b.setPrice(r.getString(4));
				b.setBookcategory(r.getString(5));
				b.setStatus(r.getString(6));
				b.setPhoto(r.getString(7));
				b.setUser_email(r.getString(8));
				list.add(b);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public bookdetils getbookbyid(int id) {
		bookdetils b = null;
		PreparedStatement p = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM book_order WHERE bookid=?";
			p = conn.prepareStatement(sql);
			p.setInt(1, id);
			rs = p.executeQuery();

			if (rs.next()) {
				b = new bookdetils();
				b.setBookid(rs.getInt(1));
				b.setAuthor(rs.getString(2));
				b.setBookname(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUser_email(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (p != null)
					p.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return b;
	}

	public boolean updateeditbook(bookdetils b) {
		boolean f = false;
		try {

			String sql = "update book_order set  author=?, Bookname=?, price=?, status=? where bookid=?";
			PreparedStatement p = conn.prepareStatement(sql);
			p.setString(1, b.getAuthor());
			p.setString(2, b.getBookname());
			p.setString(3, b.getPrice());
			p.setString(4, b.getStatus());
			p.setInt(5, b.getBookid());
			int i = p.executeUpdate();
			if (f) {
				f = true;
			} else {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
public boolean deletebook(int id) {
	boolean f = false;
	try {
		String sql = "delete from book_order where bookid=?";
		PreparedStatement p = conn.prepareStatement(sql);
		p.setInt(1, id);
		int i = p.executeUpdate();
		if (f) {
			f = true;
		} else {
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	return f;
}

public List<bookdetils> getnewbook() {
	List<bookdetils> list = new ArrayList<>();
	bookdetils b = null;
	try {

		String sql="select *from book_order  where Bookcategory=? and Status=? order by bookid DESC";
		PreparedStatement p=conn.prepareStatement(sql);
		p.setString(1, "New");
		p.setString(2, "Active");
		ResultSet rs=p.executeQuery();
		int i=1;
		while (rs.next() && i<4)
		{
			b=new bookdetils();
			b.setBookid(rs.getInt(1));
			b.setAuthor(rs.getString(2));
			b.setBookname(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookcategory(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setPhoto(rs.getString(7));
			b.setUser_email(rs.getString(8));
		   list.add(b);
		i++;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}

	return list;
}


public List<bookdetils> getRecentbook() {
	List<bookdetils> list = new ArrayList<>();
	bookdetils b = null;
	try {

		String sql="select *from book_order  where Status=? order by bookid DESC";
		PreparedStatement p=conn.prepareStatement(sql);
		p.setString(1, "Active");
		ResultSet rs=p.executeQuery();
		int i=1;
		while (rs.next() && i<4)
		{
			b=new bookdetils();
			b.setBookid(rs.getInt(1));
			b.setAuthor(rs.getString(2));
			b.setBookname(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookcategory(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setPhoto(rs.getString(7));
			b.setUser_email(rs.getString(8));
		   list.add(b);
		i++;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}

	return list;}


public List<bookdetils> getoldbook() {
	List<bookdetils> list = new ArrayList<>();
	bookdetils b = null;
	try {

		String sql="select *from book_order  where bookcategory=? and status=? order by bookid DESC";
		PreparedStatement p=conn.prepareStatement(sql);
		p.setString(1, "Old");
		p.setString(2, "Active");
		ResultSet rs=p.executeQuery();
		int i=1;
		while (rs.next() && i<4)
		{
			b=new bookdetils();
			b.setBookid(rs.getInt(1));
			b.setAuthor(rs.getString(2));
			b.setBookname(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookcategory(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setPhoto(rs.getString(7));
			b.setUser_email(rs.getString(8));
		   list.add(b);
		i++;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}

	return list;
}

public List<bookdetils> getallnewbook() {
	List<bookdetils> list = new ArrayList<>();
	bookdetils b = null;
	try {

		String sql="select *from book_order  where Bookcategory=? and Status=? order by bookid DESC";
		PreparedStatement p=conn.prepareStatement(sql);
		p.setString(1, "New");
		p.setString(2, "Active");
		ResultSet rs=p.executeQuery();
	
		while (rs.next())
		{
			b=new bookdetils();
			b.setBookid(rs.getInt(1));
			b.setAuthor(rs.getString(2));
			b.setBookname(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookcategory(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setPhoto(rs.getString(7));
			b.setUser_email(rs.getString(8));
		   list.add(b);

		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}

	return list;
}

public List<bookdetils> getallrecentbook() {
	List<bookdetils> list = new ArrayList<>();
	bookdetils b = null;
	try {

		String sql="select *from book_order  where Status=? order by bookid DESC";
		PreparedStatement p=conn.prepareStatement(sql);
		p.setString(1, "Active");
		ResultSet rs=p.executeQuery();
		while (rs.next())
		{
			b=new bookdetils();
			b.setBookid(rs.getInt(1));
			b.setAuthor(rs.getString(2));
			b.setBookname(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookcategory(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setPhoto(rs.getString(7));
			b.setUser_email(rs.getString(8));
		   list.add(b);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}

	return list;}

public List<bookdetils> getalloldbook() {
	List<bookdetils> list = new ArrayList<>();
	bookdetils b = null;
	try {

		String sql = "select *from book_order  where bookcategory=? and status=? order by bookid DESC";
		PreparedStatement p = conn.prepareStatement(sql);
		p.setString(1, "Old");
		p.setString(2, "Active");
		ResultSet rs = p.executeQuery();
		while (rs.next()) {
			b = new bookdetils();
			b.setBookid(rs.getInt(1));
			b.setAuthor(rs.getString(2));
			b.setBookname(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookcategory(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setPhoto(rs.getString(7));
			b.setUser_email(rs.getString(8));
			list.add(b);
		}

	} catch (Exception e) {
		e.printStackTrace();
	}

	return list;
}

      public List<bookdetils> getbookbyserch(String ch) {
    	  List<bookdetils> list = new ArrayList<>();
    		bookdetils b = null;
    		try {

    			String sql="select *from book_order  where bookname like ? or author like?  or bookcategory like ? and status=? ";
    			PreparedStatement p=conn.prepareStatement(sql);
    			p.setString(1, "%"+ch+"%");
    			p.setString(2, "%"+ch+"%");
    			p.setString(3, "%"+ch+"%");
    			p.setString(4, "Active");
    			ResultSet rs=p.executeQuery();
    			while (rs.next() )
    			{
    				b=new bookdetils();
    				b.setBookid(rs.getInt(1));
    				b.setAuthor(rs.getString(2));
    				b.setBookname(rs.getString(3));
    				b.setPrice(rs.getString(4));
    				b.setBookcategory(rs.getString(5));
    				b.setStatus(rs.getString(6));
    				b.setPhoto(rs.getString(7));
    				b.setUser_email(rs.getString(8));
    			   list.add(b);
    			}
    			
    		} catch (Exception e) {
    			e.printStackTrace();
    		}

    		return list;
    		}

}
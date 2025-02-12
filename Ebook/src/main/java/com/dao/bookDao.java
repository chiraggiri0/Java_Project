package com.dao;

import java.util.List;


import com.entity.bookdetils;

public interface bookDao {

	public boolean addbook(bookdetils b);

	public List<bookdetils> getallbook();

	public bookdetils getbookbyid(int id);

	public boolean updateeditbook(bookdetils b);

	public boolean deletebook(int id);

	public List<bookdetils> getnewbook();

	public List<bookdetils> getRecentbook();

	public List<bookdetils> getoldbook();

	public List<bookdetils> getallnewbook();

	public List<bookdetils> getallrecentbook();

	public List<bookdetils> getalloldbook();

	public List<bookdetils> getbookbyserch(String ch);

}

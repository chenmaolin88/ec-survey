package com.ec.survey.dao;

import java.util.List;

import com.ec.survey.dto.Guestbook;
import com.swufe.pager.PageListener;

public interface GusetbookDAO extends PageListener {
	boolean addGusetbook(Guestbook guestbook);
	boolean updateGuestbook(Guestbook guestbook);
	boolean delGuestbook(Long guestbookId);
	List<Guestbook> listAllGuestbook();
	Guestbook findGuestbook(Long guestbookId);
}

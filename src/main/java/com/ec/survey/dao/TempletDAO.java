package com.ec.survey.dao;

import java.util.List;

import com.ec.survey.dto.Templet;
import com.swufe.pager.PageListener;

public interface TempletDAO extends PageListener{

	boolean addTemplet(Templet templet);
	boolean updateTemplet(Templet templet);
	boolean delTemplet(Long templetId);
	List<Templet> listAllTemplet();
	Templet findTemplet(Long templetId);
}

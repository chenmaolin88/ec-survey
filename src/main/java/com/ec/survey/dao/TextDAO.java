package com.ec.survey.dao;

import java.util.List;

import com.ec.survey.dto.Text;
import com.swufe.pager.PageListener;

public interface TextDAO extends PageListener{
	boolean addText(Text text);
	boolean delText(Long sid);
	List<Text> listAllText(Long questionId);
	Text findText(Long textId);
}

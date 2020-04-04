package com.ec.survey.dao;
import java.util.List;

import com.ec.survey.dto.Question;
import com.swufe.pager.PageListener;
public interface QuestionDAO extends PageListener {
	/**
	 * ��������
	 * @param question
	 * @return
	 */
	boolean addQuestion(Question question);
	/**
	 * �༭����������
	 * @param question
	 * @return
	 */
	boolean updateQuestion(Question question);
	/**
	 * ɾ������
	 * @param question
	 * @return
	 */
	boolean delQuestion(Long questionId);
	/**
	 * ɾ��ָ���ʾ����������
	 * @param question
	 * @return
	 */
	boolean delQuestions(Long surveyId);
	/**
	 * �г�ָ���������������,����ָ����ID�������������
	 * @return
	 */
	List<Question> listQuestions(String WhereClause);
	List<Question> listAllQuestion(Long surveyId);
	List<Question> listAllQuestion(Long surveyId,String ascORdesc);
	/**
	 * ����ָ��ID������
	 * @param question
	 * @return
	 */
	Question findQuestion(Long questionId);
}

package service;

import java.util.List;

import criTest.Criteria;
import criTest.SearchCriteria;
import vo.QnaVO;

public interface QnaService {
	
	// ** Ajax titleRDetail
	public List<QnaVO> titleQDetail(QnaVO vo);
	
	// PageList2. => ver02 : SearchPageList
	public int searchRowsCount(SearchCriteria cri);
	public List<QnaVO> searchList(SearchCriteria cri);
		
	// PageList2. => ver01 : criPageList
	public int totalRowsCount();
	public List<QnaVO> criPList(Criteria cri);
    
	int replyInsert(QnaVO vo); // 답글등록
	
	List<QnaVO> selectList(); //selectList
	QnaVO selectOne(QnaVO vo); //selectList
	
	int insert(QnaVO vo); //insert
	int delete(QnaVO vo); //delete
} //class

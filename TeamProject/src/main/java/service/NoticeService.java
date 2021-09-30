package service;

import java.util.List;

import criTest.Criteria;
import criTest.SearchCriteria;
import vo.NoticeVO;

public interface NoticeService {
	
	// ** Ajax titleRDetail
	public List<NoticeVO> titleNDetail(NoticeVO vo);
		
	// PageList2. => ver02 : SearchPageList
	public int searchRowsCount(SearchCriteria cri);
	public List<NoticeVO> searchList(SearchCriteria cri);
	
	// PageList2. => ver01 : criPageList
	public int totalRowsCount();
	public List<NoticeVO> criPList(Criteria cri);
	
	List<NoticeVO> selectList(); //selectList
	NoticeVO selectOne(NoticeVO vo); //selectList
	
	int countUp(NoticeVO vo); //countUp
	int update (NoticeVO vo); //update
	int insert(NoticeVO vo); //insert
	int delete(NoticeVO vo); //delete
	
} //class

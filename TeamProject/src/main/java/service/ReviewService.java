package service;

import java.util.List;

import criTest.Criteria;
import criTest.SearchCriteria;
import vo.ReviewVO;

public interface ReviewService {
	
	// ** Ajax titleRDetail
	public List<ReviewVO> titleRDetail(ReviewVO vo);
		
	// PageList2. => ver02 : SearchPageList
	public int searchRowsCount(SearchCriteria cri);
	public List<ReviewVO> searchList(SearchCriteria cri);
		
	// PageList2. => ver01 : criPageList
	public int totalRowsCount();
	public List<ReviewVO> criPList(Criteria cri);
	
	int replyInsert(ReviewVO vo); // 답글등록
	
	List<ReviewVO> selectList(); //selectList
	ReviewVO selectOne(ReviewVO vo); //selectList
	
	int countUp(ReviewVO vo); //countUp

	int insert(ReviewVO vo); //insert
	int delete(ReviewVO vo); //delete
	
} //class

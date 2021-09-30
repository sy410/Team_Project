package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criTest.Criteria;
import criTest.SearchCriteria;
import util.ReviewDAO;
import vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	ReviewDAO dao;
	
	// ** Ajax titleRDetail
	@Override
	public List<ReviewVO> titleRDetail(ReviewVO vo) {
		return dao.titleRDetail(vo);
	}
	
	// PageList2. => ver02 : SearchPageList
	@Override
	public int searchRowsCount(SearchCriteria cri) {
		return dao.searchRowsCount(cri);
	}
	@Override
	public List<ReviewVO> searchList(SearchCriteria cri) {
		return dao.searchList(cri);
	}
	
	// PageList2. => ver01 : criPageList 
	@Override
	public int totalRowsCount() {
		return dao.totalRowsCount();
	} //totalRowsCount
	
	@Override
	public List<ReviewVO> criPList(Criteria cri) {
		return dao.criPList(cri);
	} //criPList
	
	// 답글등록
	@Override
	public int replyInsert(ReviewVO vo) {
		return dao.replyInsert(vo);
	} //replyInsert
	
	@Override
	public List<ReviewVO> selectList() {
		return dao.selectList();
	} //selectList
	@Override
	public ReviewVO selectOne(ReviewVO vo) {
		return dao.selectOne(vo);
	} //selectone
	
	// ** 조회수 증가
	@Override
	public int countUp(ReviewVO vo) {
		return dao.countUp(vo);
	} //countUp
	
	@Override
	public int insert(ReviewVO vo) {
		return dao.insert(vo);
	} //insert
	
	@Override
	public int delete(ReviewVO vo) {
		return dao.delete(vo);
	} //delete

} //class

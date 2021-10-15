package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criTest.Criteria;
import criTest.SearchCriteria;
import util.NoticeDAO;
import vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	NoticeDAO dao;
	
	// PageList2. => ver02 : SearchPageList
	@Override
	public int searchRowsCount(SearchCriteria cri) {
		return dao.searchRowsCount(cri);
	}
	@Override
	public List<NoticeVO> searchList(SearchCriteria cri) {
		return dao.searchList(cri);
	}
	
	// PageList2. => ver01 : criPageList 
	@Override
	public int totalRowsCount() {
		return dao.totalRowsCount();
	} //totalRowsCount
	
	@Override
	public List<NoticeVO> criPList(Criteria cri) {
		return dao.criPList(cri);
	} //criPList
	
	@Override
	public List<NoticeVO> selectList() {
		return dao.selectList();
	} //selectList
	@Override
	public NoticeVO selectOne(NoticeVO vo) {
		return dao.selectOne(vo);
	} //selectone
	
	// ** 조회수 증가
	@Override
	public int countUp(NoticeVO vo) {
		return dao.countUp(vo);
	} //countUp
	
	@Override
	public int insert(NoticeVO vo) {
		return dao.insert(vo);
	} //insert
	@Override
	public int update(NoticeVO vo) {
		return dao.update(vo);
	} //update
	@Override
	public int delete(NoticeVO vo) {
		return dao.delete(vo);
	} //delete

} //class

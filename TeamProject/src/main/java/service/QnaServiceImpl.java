package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criTest.Criteria;
import criTest.SearchCriteria;
import util.QnaDAO;
import vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	QnaDAO dao;
	
	// ** Ajax titleQDetail
	@Override
	public List<QnaVO> titleQDetail(QnaVO vo) {
		return dao.titleQDetail(vo);
	}
	
	// PageList2. => ver02 : SearchPageList
	@Override
	public int searchRowsCount(SearchCriteria cri) {
		return dao.searchRowsCount(cri);
	}
	@Override
	public List<QnaVO> searchList(SearchCriteria cri) {
		return dao.searchList(cri);
	}
	
	// PageList2. => ver01 : criPageList 
	@Override
	public int totalRowsCount() {
		return dao.totalRowsCount();
	} //totalRowsCount
	
	@Override
	public List<QnaVO> criPList(Criteria cri) {
		return dao.criPList(cri);
	} //criPList
	
	// 답글등록
	@Override
	public int replyInsert(QnaVO vo) {
		return dao.replyInsert(vo);
	} //replyInsert

	@Override
	public List<QnaVO> selectList() {
		return dao.selectList();
	} //selectList
	
	@Override
	public QnaVO selectOne(QnaVO vo) {
		return dao.selectOne(vo);
	} //selectone
	
	@Override
	public QnaVO selectReply(QnaVO vo) {
		return dao.selectReply(vo);
	}
	
	@Override
	public int insert(QnaVO vo) {
		return dao.insert(vo);
	} //insert
	
	@Override
	public int delete(QnaVO vo) {
		return dao.delete(vo);
	} //delete

} //class

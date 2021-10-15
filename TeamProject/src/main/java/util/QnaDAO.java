package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criTest.Criteria;
import criTest.SearchCriteria;
import lombok.extern.log4j.Log4j;
import vo.QnaVO;

@Log4j
@Repository
public class QnaDAO {	
	@Autowired
	SqlSession sqlSession;
	private static final String NS="one.mapper.QnaMapper.";

	// ** Ajax titleQnaList
	public List<QnaVO> titleQDetail(QnaVO vo) {
		return sqlSession.selectList(NS+"titleQDetail",vo);
	}
	
	// PageList2. => ver02 : SearchPageList---------------
	// => mapper 에 searchRowsCount, searchList 추가
	public int searchRowsCount(SearchCriteria cri) {
		return sqlSession.selectOne(NS+"searchRowsCount",cri);
	}
	public List<QnaVO> searchList(SearchCriteria cri) {
		return sqlSession.selectList(NS+"searchList",cri);
	}
	
	// PageList2. => ver01 : criPageList 
	public int totalRowsCount() {
		return sqlSession.selectOne(NS+"totalRowCount");
	} //totalRowsCount
	
	public List<QnaVO> criPList(Criteria cri) {
		return sqlSession.selectList(NS+"pageList",cri);
	} //criPList
	
	// ** 답글등록
	public int replyInsert(QnaVO vo) {
		log.info("** Step_Update Count => "+sqlSession.update(NS+"stepUpdate",vo));
		return sqlSession.insert(NS+"replyInsert",vo);
	} //replyInsert
		
	// ** selectList
	public List<QnaVO> selectList() {
		return sqlSession.selectList(NS+"selectList");
	} //selectList
		
	// ** selectOne
	public QnaVO selectOne(QnaVO vo) {
		return sqlSession.selectOne(NS+"selectOne", vo);
	} //selectOne
	
	// ** selectReply
	public QnaVO selectReply(QnaVO vo) {
		return sqlSession.selectOne(NS+"selectReply", vo);
	} //selectReply 
	
	// ** insert (원글)
	public int insert(QnaVO vo) {
		return sqlSession.insert(NS+"insert",vo);
	} //insert
	
	// ** delete
	public int delete(QnaVO vo) {
		return sqlSession.delete(NS+"delete",vo);
	} //delete
} //class

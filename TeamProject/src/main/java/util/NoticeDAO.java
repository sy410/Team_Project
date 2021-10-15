package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criTest.Criteria;
import criTest.SearchCriteria;
import lombok.extern.log4j.Log4j;
import vo.NoticeVO;

@Log4j
@Repository
public class NoticeDAO {
	@Autowired
	SqlSession sqlSession;
	private static final String NS="one.mapper.NoticeMapper.";
	
	// PageList2. => ver02 : SearchPageList---------------
	// => mapper 에 searchRowsCount, searchList 추가
	public int searchRowsCount(SearchCriteria cri) {
		return sqlSession.selectOne(NS+"searchRowsCount",cri);
	}
	public List<NoticeVO> searchList(SearchCriteria cri) {
		return sqlSession.selectList(NS+"searchList",cri);
	}
		
	// PageList2. => ver01 : criPageList 
	public int totalRowsCount() {
		return sqlSession.selectOne(NS+"totalRowCount");
	} //totalRowsCount
	
	public List<NoticeVO> criPList(Criteria cri) {
		return sqlSession.selectList(NS+"pageList",cri);
	} //criPList
	
	// ** selectList
	public List<NoticeVO> selectList() {
		return sqlSession.selectList(NS+"selectList");
	} //selectList
	
	// ** selectOne
	public NoticeVO selectOne(NoticeVO vo) {
		return sqlSession.selectOne(NS+"selectOne", vo);
	} //selectOne 
		
	// ** 조회수 증가
	public int countUp(NoticeVO vo) {
		return sqlSession.update(NS+"countUp",vo);
	} //countUp
		
	// ** insert (원글)
	public int insert(NoticeVO vo) {
		return sqlSession.insert(NS+"insert",vo);
	} //insert
	// ** update
	public int update(NoticeVO vo) {
		return sqlSession.update(NS+"update",vo);
	} //update
	
	// ** delete
	public int delete(NoticeVO vo) {
		return sqlSession.delete(NS+"delete",vo);
	} //delete
	
} //class

package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criTest.Criteria;
import criTest.SearchCriteria;
import lombok.extern.log4j.Log4j;
import vo.ReviewVO;

@Log4j
@Repository
public class ReviewDAO {
	@Autowired
	SqlSession sqlSession;
	private static final String NS = "one.mapper.ReviewMapper.";
	
	// ** Ajax titleReviewList
	public List<ReviewVO> titleRDetail(ReviewVO vo) {
		return sqlSession.selectList(NS+"titleRDetail",vo);
	}
	
	// PageList2. => ver02 : SearchPageList---------------
	// => mapper 에 searchRowsCount, searchList 추가
	public int searchRowsCount(SearchCriteria cri) {
		return sqlSession.selectOne(NS+"searchRowsCount",cri);
	}
	public List<ReviewVO> searchList(SearchCriteria cri) {
		return sqlSession.selectList(NS+"searchList",cri);
	}
		
	// PageList2. => ver01 : criPageList 
	public int totalRowsCount() {
		return sqlSession.selectOne(NS+"totalRowCount");
	} //totalRowsCount
	
	public List<ReviewVO> criPList(Criteria cri) {
		return sqlSession.selectList(NS+"pageList",cri);
	} //criPList
	
	// ** 답글등록
	public int replyInsert(ReviewVO vo) {
		log.info("** Step_Update Count => "+sqlSession.update(NS+"stepUpdate",vo));
		return sqlSession.insert(NS+"replyInsert",vo);
	} //replyInsert
	
	// ** selectList
	public List<ReviewVO> selectList() {
		return sqlSession.selectList(NS+"selectList");
	} //selectList
	
	// ** selectOne
	public ReviewVO selectOne(ReviewVO vo) {
		return sqlSession.selectOne(NS+"selectOne", vo);
	} //selectOne 
		
	// ** 조회수 증가
	public int countUp(ReviewVO vo) {
		return sqlSession.update(NS+"countUp",vo);
	} //countUp
		
	// ** insert (원글)
	public int insert(ReviewVO vo) {
		return sqlSession.insert(NS+"insert",vo);
	} //insert
	
	// ** delete
	public int delete(ReviewVO vo) {
		return sqlSession.delete(NS+"delete",vo);
	} //delete

	
} //class

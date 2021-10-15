package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criTest.Criteria;
import criTest.SearchCriteria;
import vo.CompanyVO;
import vo.PageVO;


@Repository
public class CompanyDAO {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NS = "one.mapper.CompanyMapper.";
	
	// ** Check_CompanyList
	public List<CompanyVO> checkList(CompanyVO vo) {
		return sqlSession.selectList(NS+"checkList",vo);
	}
	
	// PageList2. => SearchPageList---------------
	// => mapper 에 searchRowsCount, searchList 추가
	public int searchRowsCount(SearchCriteria cri) {
		return sqlSession.selectOne(NS+"searchRowsCount",cri);
	}
	public List<CompanyVO> searchList(SearchCriteria cri) {
		return sqlSession.selectList(NS+"searchList",cri);
	}
	
	// PageList2. => ver01 : criPageList ------------------------
	public int totalRowsCount() {
		return sqlSession.selectOne(NS+"totalRowCount");
	} //totalRowsCount
	
	public List<CompanyVO> criPList(Criteria cri) {
		return sqlSession.selectList(NS+"pageList",cri);
	} //criPList
	//---------------------------------------------------
	
	// ** PageList 1.
	public PageVO<CompanyVO> pageList(PageVO<CompanyVO> pvo) {
	// ** 전체Row수(totalRowCount)
	pvo.setTotalRowCount(sqlSession.selectOne(NS+"totalRowCount")); 
	// ** List 읽기
	pvo.setList(sqlSession.selectList(NS+"pageList",pvo));
	return pvo;
	} //pageList() 
	
	// ** selectList
	public List<CompanyVO> selectList() {
		return sqlSession.selectList(NS+"selectList");
	} //selectList

	// ** selectOne
	public CompanyVO selectOne(CompanyVO vo) {
		return sqlSession.selectOne(NS+"selectOne", vo);
	} //selectOne

	// ** Join : insert
	public int insert(CompanyVO vo) {
		return sqlSession.insert(NS+"insert", vo);
	} //insert

	// ** update
	// => pkey 일반적으로 수정하지 않음.
	public int update(CompanyVO vo) {
		return sqlSession.update(NS+"update", vo);
	} //update

	// ** delete
	public int delete(CompanyVO vo) {
		return sqlSession.delete(NS+"delete",vo);
	} //delete
}

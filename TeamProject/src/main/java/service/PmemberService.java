package service;

import java.util.List;
import java.util.Map;

import criTest.SearchCriteria;
import vo.PmemberVO;

public interface PmemberService {



	
	
	
	
	// ** ID 중복확인
	public int idCheck(PmemberVO vo);
	
	
	// ** 패스워드 확인
	int passCheck(PmemberVO vo);
	
	
	
	// ** ID 찾기
	PmemberVO pFindId(PmemberVO vo);
	// ** Password 찾기
	PmemberVO pFindPw(PmemberVO vo);
	// ** Password 재설정
	public void updatePw(PmemberVO vo);
	
	
	
	// **SearchPageList
	public int searchRowsCount(SearchCriteria cri);
	public List<PmemberVO> searchList(SearchCriteria cri);
		
	PmemberVO selectOne(PmemberVO vo);
	int insert(PmemberVO vo);
	int update(PmemberVO vo);
	int delete(PmemberVO vo);

} //PmemberService
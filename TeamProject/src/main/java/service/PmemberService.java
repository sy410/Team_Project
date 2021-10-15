package service;

import java.util.List;

import criTest.SearchCriteria;
import vo.NoticeVO;
import vo.PmemberVO;

public interface PmemberService {
	
/*	List<NoticeVO> myboard();*/
	
	// ** ID 중복확인
	public int idCheck(PmemberVO vo);
	
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
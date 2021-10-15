package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criTest.SearchCriteria;
import util.PmemberDAO;
import vo.NoticeVO;
import vo.PmemberVO;

@Service
public class PmemberServicelmpl implements PmemberService {
	@Autowired
	PmemberDAO dao;
	
	/*@Override
	public List<NoticeVO> myboard() {
		return dao.myboard();
	}*/
	
	// ** ID 중복확인
	@Override
	public int idCheck(PmemberVO vo) {
		return dao.idCheck(vo);
	}
	
	// ** ID 찾기
	@Override
	public PmemberVO pFindId(PmemberVO vo) {
		return dao.pFindId(vo);
	}
	// ** Password 찾기
	@Override
	public PmemberVO pFindPw(PmemberVO vo) {
		return dao.pFindPw(vo);
	}
	// ** password 재설정
	@Override
	 public void updatePw(PmemberVO vo){
		dao.updatePw(vo);
	}
	
	
	// ** SearchPageList 
	@Override
	public int searchRowsCount(SearchCriteria cri) {
		return dao.searchRowsCount(cri);
	}	
	@Override
	public List<PmemberVO> searchList(SearchCriteria cri) {
		return dao.searchList(cri);
	}

	
	@Override
	public PmemberVO selectOne(PmemberVO vo) {
		return dao.selectOne(vo);
	}
	@Override
	public int insert(PmemberVO vo) {
		return dao.insert(vo);
	}
	@Override
	public int update(PmemberVO vo) {
		return dao.update(vo);
	}
	@Override
	public int delete(PmemberVO vo) {
		return dao.delete(vo);
	}
} // class

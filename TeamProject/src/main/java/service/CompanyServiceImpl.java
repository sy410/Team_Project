package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criTest.Criteria;
import criTest.SearchCriteria;
import util.CompanyDAO;
import vo.CompanyVO;
import vo.PageVO;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	CompanyDAO dao;	
	
	
	@Override
	public List<CompanyVO> checkList(CompanyVO vo) {
		return dao.checkList(vo);
	}
	
	@Override
	public int searchRowsCount(SearchCriteria cri) {
		return dao.searchRowsCount(cri);
	}
	@Override
	public List<CompanyVO> searchList(SearchCriteria cri) {
		return dao.searchList(cri);
	}
	//-------------------------------------------------------------------
	@Override
	public int totalRowsCount() {
		return dao.totalRowsCount();
	}
	@Override
	public List<CompanyVO> criPList(Criteria cri) {
		return dao.criPList(cri);
	}
	@Override
	public PageVO<CompanyVO> pageList(PageVO<CompanyVO> pvo) {
		return dao.pageList(pvo);
	}
	//-------------------------------------------------------------------
	
	@Override
	public List<CompanyVO> selectList() {
		return dao.selectList();
	} //selectlist
	@Override
	public CompanyVO selectOne(CompanyVO vo) {
		return dao.selectOne(vo);
	} //selectOne
	@Override
	public int insert(CompanyVO vo) {
		return dao.insert(vo);
	} //insert
	@Override
	public int update(CompanyVO vo) {
		return dao.update(vo);
	} //update
	@Override
	public int delete(CompanyVO vo) {
		return dao.delete(vo);
	} //delete

}

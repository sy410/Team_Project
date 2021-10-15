package service;

import java.util.List;

import criTest.Criteria;
import criTest.SearchCriteria;
import vo.CompanyVO;
import vo.PageVO;

public interface CompanyService {
	
	List<CompanyVO> checkList(CompanyVO vo);
	
	// PageList2. => ver02 : SearchPageList
	public int searchRowsCount(SearchCriteria cri);
	public List<CompanyVO> searchList(SearchCriteria cri);
	
	// PageList2. => ver01 : criPageList
	public int totalRowsCount();
	public List<CompanyVO> criPList(Criteria cri);
	
	// PageList1.
	PageVO<CompanyVO> pageList(PageVO<CompanyVO> pvo);
	
	List<CompanyVO> selectList(); //selectList()
	CompanyVO selectOne(CompanyVO vo); //selectOne
	int insert(CompanyVO vo); //insert
	int update(CompanyVO vo); //update
	int delete(CompanyVO vo); //delete

}

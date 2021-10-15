package service;

import java.util.List;

import vo.CompanyVO;
import vo.PmemberVO;
import vo.ReservationVO;

public interface ReservationService {
	
	PmemberVO selectPm(PmemberVO vo); //selectPm
	List<ReservationVO> selectList(); //selectList()
	ReservationVO selectOne(ReservationVO vo); //selectOne
	int insert(ReservationVO vo); //insert
	int update(ReservationVO vo); //update
	int delete(ReservationVO vo); //delete

}//class

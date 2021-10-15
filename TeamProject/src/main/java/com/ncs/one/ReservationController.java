package com.ncs.one;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.ReservationService;
import vo.CompanyVO;
import vo.PmemberVO;
import vo.ReservationVO;


@Controller
public class ReservationController {
	
	@Autowired
	ReservationService service;
	
	// ** 예약접수 메인 폼
	@RequestMapping(value = "/rmainf")
	public ModelAndView rmainf(HttpServletRequest request, ModelAndView mv, 
			PmemberVO vo, CompanyVO cvo) {
		
		HttpSession session = request.getSession(false);

		if (session!=null && session.getAttribute("loginID") !=null) {
			vo.setId((String)session.getAttribute("loginID"));
			
			if  (request.getParameter("id")!=null) vo.setId(request.getParameter("id"));	
			
			vo=service.selectPm(vo);
			
			if (vo!=null) {
				mv.setViewName("reservation/reservationForm");
				mv.addObject("Apple", vo);
				mv.addObject("cno", cvo.getCno());
				mv.addObject("cname", cvo.getCname());
				mv.addObject("cprice", cvo.getCprice());
			}else {
				mv.addObject("message","회원 정보를 찾을 수 없습니다. 로그인 후 이용하세요.");
				mv.setViewName("pmember/loginForm");
			}
		}else {
			// 로그인 정보 없음
			mv.addObject("message","로그인 정보 없습니다. 로그인 후 이용하세요.");
			mv.setViewName("pmember/loginForm");
		}
		return mv;
	} //rmainf
	
	// ** 예약하기
	@RequestMapping(value = "/reservation")
	public ModelAndView reservation(ModelAndView mv, ReservationVO vo) {

		if (service.insert(vo) > 0) {
			// 예약 성공 -> 예약확인 유도
			mv.addObject("message", "예약 완료!! 예약 현황을 하세요 ~~");
			mv.setViewName("reservation/rConfForm");
		}else {
			// 예약 실패 -> 재예약 유도
			mv.addObject("message", "예약 접수 오류!! 다시 하세요 ~~");
			mv.setViewName("reservation/reservationForm");
		}
		return mv;
	} //reservation
	
	
}//class

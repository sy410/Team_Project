package com.ncs.one;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import criTest.PageMaker;
import criTest.SearchCriteria;
import lombok.extern.log4j.Log4j;
import service.ReviewService;
import vo.ReviewVO;

@Log4j
@Controller
public class ReviewController {
	
	@Autowired
	ReviewService service;
	
	// ** Ajax review Title - detail
	@RequestMapping(value = "/ardetail")
	public ModelAndView ardetail(ModelAndView mv, ReviewVO vo) {
		List<ReviewVO> list = service.titleRDetail(vo);
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 1건도 없습니다. ~~");
		}
		mv.setViewName("review/reviewDetail");
		return mv;
	} //arlist
	
	// ** Ajax BoardList 
	@RequestMapping(value = "/arcplist")
	public ModelAndView rcplist(ModelAndView mv) {
		List<ReviewVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 1건도 없습니다. ~~");
		}
		mv.setViewName("review/rCriList");
		return mv;
	} //arlist
	
	// ** Review CriPageList
	@RequestMapping(value = "/rcplist")
	
	public ModelAndView rcplist(ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {
		cri.setSnoEno();
			
		// 2) 서비스 처리
		mv.addObject("Banana",service.searchList(cri));
			
		// 3) PageMaker 처리
		pageMaker.setCri(cri);
		pageMaker.setTotalRowCount(service.searchRowsCount(cri));
		
		System.out.println("*** pageMaker => "+pageMaker);
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("review/rCriList");
		return mv;
	} //rcplist 
	
	// ** 새글등록
	@RequestMapping(value = "/rinsertf")
	public ModelAndView rinsertf(ModelAndView mv) {
		mv.setViewName("review/rinsertForm");
		return mv;
    } //rinsertf
	
	@RequestMapping(value = "/rinsert")
	public ModelAndView rinsert(ModelAndView mv, ReviewVO vo, RedirectAttributes rttr) {

		if ( service.insert(vo) > 0) {
			rttr.addFlashAttribute("message", "~~ 새글 등록 성공 ~~");
			mv.setViewName("redirect:rlist"); 
		}else {
			mv.addObject("message", "~~ 새글 등록 실패 !! 다시 하세요 ~~");
			mv.setViewName("review/rinsertForm");
		}
		return mv;
	} //rinsert	
	
	// ** 리뷰는 로그인 되어있을때만
	@RequestMapping(value = "/rdetail")
	public ModelAndView rdetail(HttpServletRequest request, ModelAndView mv, 
			ReviewVO vo, RedirectAttributes rttr) {
		// ** Detail 처리 조건
		// => 로그인 했을때만 글내용을 볼 수 있도록 ( boardList.jsp 에서 처리 ) 
		// => 조회수 증가 
		//    글쓴이(Parameter 로 전달) 와 글보는이(loginID) 가 달라야 함.

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("loginID") != null) {
			String loginID = (String)session.getAttribute("loginID");
			// 글쓴이(Parameter 로 전달) 와 글보는이(loginID) 가 다른경우에만 조회수 증가
			if (!loginID.equals(vo.getId())) {
				service.countUp(vo) ;
			} 
			// 글내용 조회
			vo = service.selectOne(vo);
			if (vo != null) {
				request.setAttribute("Apple", vo);
			}else {
				rttr.addFlashAttribute("message", "~~ 글번호에 해당하는 글을 찾을 수 없습니다 ~~");
				mv.setViewName("redirect:rlist"); 
			}
		}else {
			mv.addObject("message", "~~ 로그인 정보가 없습니다 !! 로그인 후 다시 하세요  ~~");
			mv.setViewName("로그인폼"); 
		}
		return mv;
	} //rdetail	
	
	// ** Review List
	@RequestMapping(value = "/rlist")
	public ModelAndView rlist(ModelAndView mv) {

		List<ReviewVO> list = service.selectList() ;
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 없습니다 ~~");
		}
		mv.setViewName("review/reviewList");
		return mv;
	} //rlist
	
	// ** 답글달기
		@RequestMapping(value = "/replyf")
		public ModelAndView replyf(ModelAndView mv, ReviewVO vo) {
			// => vo 에는 전달된 부모글의 root, step, indent 가 담겨있음 
			// => 매핑메서드의 인자로 정의된 vo 는 request.setAttribute 와 동일 scope
			//    단, 클래스명의 첫글자를 소문자로 ...  ${boardVO.root}
			log.info("** replyf vo :"+vo);
			mv.setViewName("review/replyForm");
			return mv;
		} //replyf 
		
		@RequestMapping(value = "/reply")
		public ModelAndView reply(ModelAndView mv, ReviewVO vo, RedirectAttributes rttr) {
	
			vo.setStep(vo.getStep()+1);
			vo.setIndent(vo.getIndent()+1);
			if (service.replyInsert(vo) > 0) {
					// 답글 입력 성공
				rttr.addFlashAttribute("message", "~~ 답글 등록 성공 ~~");
			}else { // 답글 입력 실패
				rttr.addFlashAttribute("message", "~~ 답글 등록 실패 ~~");
			}
			mv.setViewName("redirect:rlist");
			return mv;
		} //reply 

	@RequestMapping(value = "/rdelete")
	public ModelAndView rdelete(ModelAndView mv, ReviewVO vo, RedirectAttributes rttr) {
		if (service.delete(vo) > 0) {
			rttr.addFlashAttribute("message", "~~ 글삭제 성공 ~~");
			mv.setViewName("redirect:rlist");
		}else {
			rttr.addFlashAttribute("message", "~~ 글삭제 실패 !!! 다시 하세요 ~~");
			mv.setViewName("redirect:rdetail?brno="+vo.getBrno());
		}
		return mv;
	} //rdelete	
	
		
} //class

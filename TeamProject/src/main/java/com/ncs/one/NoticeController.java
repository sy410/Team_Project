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
import service.NoticeService;
import vo.NoticeVO;
import vo.ReviewVO;

@Log4j
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;

	// ** Ajax review Title - detail
	@RequestMapping(value = "/andetail")
	public ModelAndView andetail(ModelAndView mv, NoticeVO vo) {
		List<NoticeVO> list = service.titleNDetail(vo);
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 1건도 없습니다. ~~");
		}
		mv.setViewName("notice/noticeDetail");
		return mv;
	} //aNDetail
	
	// ** Ajax NoticeList 
	@RequestMapping(value = "/ancplist")
	public ModelAndView ancplist(ModelAndView mv) {
		List<NoticeVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 1건도 없습니다. ~~");
		}
		mv.setViewName("notice/nCriList");
		return mv;
	} //anlist
		
	// ** Notice CriPageList
	@RequestMapping(value = "/ncplist")
		
	public ModelAndView rcplist(ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {
		cri.setSnoEno();
		
		// 2) 서비스 처리
		mv.addObject("Banana",service.searchList(cri));
					
		// 3) PageMaker 처리
		pageMaker.setCri(cri);
		pageMaker.setTotalRowCount(service.searchRowsCount(cri));
		
		System.out.println("*** pageMaker => "+pageMaker);
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("notice/nCriList");
		return mv;
	} //rcplist 
	
	@RequestMapping(value = "/nlist")
	public ModelAndView nlist(ModelAndView mv) {
			List<NoticeVO> list = service.selectList() ;
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 없습니다 ~~");
		}
		mv.setViewName("notice/noticeList");
		return mv;
	} //nlist
	
	@RequestMapping(value = "/ndetail")
	public ModelAndView ndetail(HttpServletRequest request, ModelAndView mv, 
			NoticeVO vo, RedirectAttributes rttr) {
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
				// 글 수정 하기의 경우 
				if ("U".equals(request.getParameter("jcode"))) {
					mv.setViewName("notice/nupdateForm");
				}else mv.setViewName("notice/noticeDetail");  
			}else {
				rttr.addFlashAttribute("message", "~~ 글번호에 해당하는 글을 찾을 수 없습니다 ~~");
				mv.setViewName("redirect:nlist"); 
			}
		}else {
			mv.addObject("message", "~~ 로그인 정보가 없습니다 !! 로그인 후 다시 하세요  ~~");
			mv.setViewName("member/loginForm"); 
		}
		return mv;
	} //ndetail
	
	// ** 새글등록
	@RequestMapping(value = "/ninsertf")
	public ModelAndView ninsertf(ModelAndView mv) {
		mv.setViewName("notice/nInsertForm");
		return mv;
	} //ninsertf
	
	@RequestMapping(value = "/ninsert")
	public ModelAndView ninsert(ModelAndView mv, NoticeVO vo, RedirectAttributes rttr) {
			if ( service.insert(vo) > 0) {
			rttr.addFlashAttribute("message", "~~ 새글 등록 성공 ~~");
			mv.setViewName("redirect:nlist"); 
		}else {
			mv.addObject("message", "~~ 새글 등록 실패 !! 다시 하세요 ~~");
			mv.setViewName("notice/ninsertForm");
		}
		return mv;
	} //ninsert	

	@RequestMapping(value = "/nupdate")
	public ModelAndView nupdate(ModelAndView mv, NoticeVO vo, RedirectAttributes rttr) {
		if (service.update(vo) > 0) {
			rttr.addFlashAttribute("message", "~~ 글수정 성공 ~~");
			mv.setViewName("redirect:nlist");
		}else {
			rttr.addFlashAttribute("message", "~~ 글수정 실패 !!! 다시 하세요 ~~");
			mv.setViewName("redirect:ndetail?bfno="+vo.getBfno()+"&jcode=U");
		}
		return mv;
	} //nupdate	
	
	@RequestMapping(value = "/ndelete")
	public ModelAndView ndelete(ModelAndView mv, NoticeVO vo, RedirectAttributes rttr) {
		if (service.delete(vo) > 0) {
			rttr.addFlashAttribute("message", "~~ 글삭제 성공 ~~");
			mv.setViewName("redirect:nlist");
		}else {
			rttr.addFlashAttribute("message", "~~ 글삭제 실패 !!! 다시 하세요 ~~");
			mv.setViewName("redirect:ndetail?bfno="+vo.getBfno());
		}
		return mv;
	} //ndelete	
}//class

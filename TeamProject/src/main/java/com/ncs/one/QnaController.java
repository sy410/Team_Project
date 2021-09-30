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
import service.QnaService;
import vo.QnaVO;
import vo.ReviewVO;

@Log4j
@Controller
public class QnaController {
	
	@Autowired
	QnaService service;
	
	// ** Ajax QnA Title - detail
	@RequestMapping(value = "/aqdetail")
	public ModelAndView aqdetail(ModelAndView mv, QnaVO vo) {
		List<QnaVO> list = service.titleQDetail(vo);
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 1건도 없습니다. ~~");
		}
		mv.setViewName("qna/qnaDetail");
		return mv;
	} //arlist	
	
	// ** Ajax QnaList 
	@RequestMapping(value = "/aqcplist")
	public ModelAndView aqcplist(ModelAndView mv) {
		List<QnaVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 1건도 없습니다. ~~");
		}
		mv.setViewName("qna/qnaList");
		return mv;
	} //anlist
	
	// ** Notice CriPageList
	@RequestMapping(value = "/qcplist")
	public ModelAndView qcplist(ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {
		cri.setSnoEno();
		
		// 2) 서비스 처리
		mv.addObject("Banana",service.searchList(cri));
			
		// 3) PageMaker 처리
		pageMaker.setCri(cri);
		pageMaker.setTotalRowCount(service.searchRowsCount(cri));
		
		System.out.println("*** pageMaker => "+pageMaker);
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("qna/qCriList");
		return mv;
	} //qcplist 
	
	// ** 새글등록
	@RequestMapping(value = "/qinsertf")
	public ModelAndView qinsertf(ModelAndView mv) {
		mv.setViewName("qna/qinsertForm");
		return mv;
	   } //qinsertf
	
	@RequestMapping(value = "/qinsert")
	public ModelAndView qinsert(ModelAndView mv, QnaVO vo, RedirectAttributes rttr) {

		if ( service.insert(vo) > 0) {
			rttr.addFlashAttribute("message", "~~ 새글 등록 성공 ~~");
			mv.setViewName("redirect:qlist"); 
		}else {
			mv.addObject("message", "~~ 새글 등록 실패 !! 다시 하세요 ~~");
			mv.setViewName("review/qinsertForm");
		}
		return mv;
	} //qinsert	
	
	// ** qnapwf	
	@RequestMapping(value = "/qnapwf")
	public ModelAndView qnapwf(ModelAndView mv) {
		mv.setViewName("qna/qnaPwForm");
		return mv;
	} //qnapwf
	
	// ** qnaPW
	@RequestMapping(value = "/qnapw")
	public ModelAndView qnapw(HttpServletRequest request, ModelAndView mv, QnaVO vo) {

		String password = vo.getBqpw(); //User가 입력한값
		vo = service.selectOne(vo);
		if (vo!=null) {
		    if (vo.getBqpw().equals(password)) {
			    mv.setViewName("redirect:qdetail");
		    }else {
			    mv.setViewName("qna/qnaPwForm");
		    } 
	    }else {
			mv.setViewName("pmember/loginForm");
	    }
		return mv;
	} //qnapw
	// ** 리뷰는 로그인 되어있을때만
	@RequestMapping(value = "/qdetail")
	public ModelAndView qdetail(HttpServletRequest request, ModelAndView mv, 
			QnaVO vo, RedirectAttributes rttr) {

		HttpSession session = request.getSession(false);
		
		String password = vo.getBqpw();
		if (session != null && vo.getBqpw().equals(password)) {
			// 글내용 조회
			vo = service.selectOne(vo);
			if (vo != null) {
				request.setAttribute("Apple", vo);
			}else {
				rttr.addFlashAttribute("message", "~~ 글번호에 해당하는 글을 찾을 수 없습니다 ~~");
				mv.setViewName("redirect:qlist"); 
			}
		}else {
			mv.addObject("message", "~~ 로그인 정보가 없습니다 !! 로그인 후 다시 하세요  ~~");
			mv.setViewName("로그인폼"); 
		}
		return mv;
	} //qdetail	
	
	// ** Review List
	@RequestMapping(value = "/qlist")
	public ModelAndView qlist(ModelAndView mv) {

		List<QnaVO> list = service.selectList() ;
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 없습니다 ~~");
		}
		mv.setViewName("qna/qnaList");
		return mv;
	} //qlist
	
	// ** 답글달기
	@RequestMapping(value = "/qreplyf")
	public ModelAndView qreplyf(ModelAndView mv, QnaVO vo) {
		log.info("** replyf vo :"+vo);
		mv.setViewName("qna/replyForm");
		return mv;
	} //replyf 
			
	@RequestMapping(value = "/qreply")
	public ModelAndView qreply(ModelAndView mv, QnaVO vo, RedirectAttributes rttr) {
		
		vo.setStep(vo.getStep()+1);
		vo.setIndent(vo.getIndent()+1);
		if (service.replyInsert(vo) > 0) {
				// 답글 입력 성공
			rttr.addFlashAttribute("message", "~~ 답글 등록 성공 ~~");
		}else { // 답글 입력 실패
			rttr.addFlashAttribute("message", "~~ 답글 등록 실패 ~~");
		}
		mv.setViewName("redirect:qlist");
		return mv;
		} //qreply 

	@RequestMapping(value = "/qdelete")
	public ModelAndView qdelete(ModelAndView mv, QnaVO vo, RedirectAttributes rttr) {
		if (service.delete(vo) > 0) {
			rttr.addFlashAttribute("message", "~~ 글삭제 성공 ~~");
			mv.setViewName("redirect:qlist");
		}else {
			rttr.addFlashAttribute("message", "~~ 글삭제 실패 !!! 다시 하세요 ~~");
			mv.setViewName("redirect:qdetail?bqno="+vo.getBqno());
		}
		return mv;
	} //rdelete	
	
} //class

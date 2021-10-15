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

@Log4j
@Controller
public class QnaController {
	
	@Autowired
	QnaService service;
	
	// ** Qna List
	@RequestMapping(value = "/qlist")
	public ModelAndView qlist(ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {
		cri.setSnoEno();
		
		// 2) 서비스 처리
		mv.addObject("Banana",service.searchList(cri));
			
		// 3) PageMaker 처리
		pageMaker.setCri(cri);
		pageMaker.setTotalRowCount(service.searchRowsCount(cri));
		
		System.out.println("*** pageMaker => "+pageMaker);
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("qna/qnaList");
		return mv;
	} //qlist 
	
	// ** 새글등록
	@RequestMapping(value = "/qinsertf")
	public ModelAndView qinsertf(ModelAndView mv) {
		mv.setViewName("qna/qinsertForm");
		return mv;
	   } //qinsertf
	
	@RequestMapping(value = "/qinsert")
	public ModelAndView qinsert(HttpServletRequest request, ModelAndView mv, QnaVO vo, RedirectAttributes rttr) {
		
		if ( service.insert(vo) > 0) {
			rttr.addFlashAttribute("message", "~~ 새글 등록 성공 ~~");
			mv.setViewName("redirect:qlist"); 
		}else {
			mv.addObject("message", "~~ 새글 등록 실패 !! 다시 하세요 ~~");
			mv.setViewName("qna/qinsertForm");
		}
		return mv;
	} //qinsert	
	
	// ** 리뷰는 로그인 되어있을때만
	@RequestMapping(value = "/qdetail")
	public ModelAndView qdetail(HttpServletRequest request, ModelAndView mv, 
			QnaVO vo, RedirectAttributes rttr) {
		// ** Detail 처리 조건
		// => 로그인 했을때만 글내용을 볼 수 있도록 ( boardList.jsp 에서 처리 ) 
		// => 조회수 증가 
		//    글쓴이(Parameter 로 전달) 와 글보는이(loginID) 가 달라야 함.
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("loginID") != null) {
			String loginID = (String)session.getAttribute("loginID");
			 
			// 글내용 조회
			vo = service.selectOne(vo);
			if (vo != null) {
				// 답글 존재 확인 
				
				// 답글 서비스 selectone 
				request.setAttribute("Apple", vo);
				if (loginID.equals("admin")) {
					mv.setViewName("qna/qnaDetail");
					
					vo.setRoot(vo.getBqno());
					vo = service.selectReply(vo); // 항상 답글 확인
					if(vo!=null)
					request.setAttribute("Apple2", vo);
					
				}else {
					mv.addObject("bqno",vo.getBqno());
					mv.setViewName("qna/qnaPwForm"); 
				}
			}else {
				rttr.addFlashAttribute("message", "~~ 글번호에 해당하는 글을 찾을 수 없습니다 ~~");
				mv.setViewName("redirect:qlist"); 
			}
		}else {
			mv.addObject("message", "~~ 로그인 정보가 없습니다 !! 로그인 후 다시 하세요  ~~");
			mv.setViewName("member/loginForm"); 
		}
		return mv;
		
	} //qdetail			
	
// ** qnapwf	
@RequestMapping(value = "/qnapwf")
public ModelAndView qnapwf(ModelAndView mv) {
	mv.setViewName("qna/qnaPwForm");
	return mv;
} //qnapwf

// ** qnaPW
@RequestMapping(value = "/qnapw")
public ModelAndView qnapw(HttpServletRequest request, ModelAndView mv, QnaVO vo) {
    System.out.println("qnaPW Test 1"+vo);
	String pw = vo.getBqpw();	
	vo = service.selectOne(vo); // 항상 원글 확인
	System.out.println("qnaPW Test 2"+vo);
	if (vo!=null) {
	    if (vo.getBqpw().equals(pw)) {
	    	request.setAttribute("Apple", vo);
			mv.setViewName("qna/qnaDetail");
			vo.setRoot(vo.getBqno());
			vo = service.selectReply(vo); // 항상 답글 확인
			if(vo!=null)
			request.setAttribute("Apple2", vo);
	    } else {
		    mv.setViewName("qna/qnaPwForm");
		    System.out.println("비밀번호 오류");
	    } 
    }else {
    	mv.setViewName("redirect:qlist");
		System.out.println("글번호에 해당하는 글을 찾을 수 없습니다");
    }
	return mv;
} //qnapw
			
	// ** 답글달기
		@RequestMapping(value = "/qreplyf")
		public ModelAndView qreplyf(ModelAndView mv, QnaVO vo) {
			log.info("** replyf vo :"+vo);
			mv.setViewName("qna/replyForm");
			return mv;
		} //replyf 
				
		@RequestMapping(value = "/qreply")
		public ModelAndView qreply(HttpServletRequest request, ModelAndView mv, QnaVO vo, RedirectAttributes rttr) {
			System.out.println("QnA VO => "+vo);
			
			request.setAttribute("Apple2", vo);
			
			vo.setStep(vo.getStep()+1);
			vo.setIndent(vo.getIndent()+1);
			vo.setId("admin");
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

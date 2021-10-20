package com.ncs.one;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import criTest.PageMaker;
import criTest.SearchCriteria;
import service.CompanyService;
import vo.CompanyVO;

@Controller
public class CompanyController {
	
	@Autowired
	CompanyService service;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	
    // ** Member SearchCriteria PageList
	@RequestMapping(value="/comlist")
	public ModelAndView comlist(ModelAndView mv, SearchCriteria cri, PageMaker pageMaker) {
		// 1) Criteria 처리
		cri.setSnoEno();
		
		// 2) 서비스 처리
		mv.addObject("Banana",service.searchList(cri));	
		
		// 3) PageMaker 처리
		pageMaker.setCri(cri);
		pageMaker.setTotalRowCount(service.searchRowsCount(cri));
		
		System.out.println("*** pageMaker =>"+pageMaker);
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("company/cCriList");
		return mv;
	} //cCriList
	
	// ** Image DownLoad
	@RequestMapping(value = "/dnload")
	public ModelAndView comdnload(HttpServletRequest request, ModelAndView mv,
								@RequestParam("dnfile") String dnfile) {
		
		String realPath = request.getRealPath("/");
		String fileName = dnfile.substring(dnfile.lastIndexOf("/")+1);
		if (realPath.contains(".eclipse."))
			 realPath = "C:/Users/skyla/Documents/MTest/MyWork//src/main/webapp/resources/uploadImage"+fileName;
		else realPath += "resources\\uploadImage\\"+fileName; 
		File file = new File(realPath) ;
		mv.addObject("downloadFile", file);
		mv.setViewName("download");
		return mv;	
	}
	
	// ** Cno 중복확인
	@RequestMapping(value = "/cnoCheck")
	public ModelAndView cnoCheck(ModelAndView mv, CompanyVO vo) {
		mv.addObject("newCno", vo.getCno());
		if (service.selectOne(vo) != null) {
			  mv.addObject("cnoUse", "F"); // 사용불가
		}else mv.addObject("cnoUse", "T"); // 사용가능
		mv.setViewName("company/cnoDupCheck");
		return mv;
	} //cnoCheck
	
	//---------------------------------------------------------------------------------------------------
	// ** Loginf
	@RequestMapping(value = "/cloginf")
	public ModelAndView cloginf(ModelAndView mv) {
		mv.setViewName("company/cloginForm");
		return mv;
	} //loginf
	
	// ** Login
	@RequestMapping(value = "/clogin")
	public ModelAndView clogin(HttpServletRequest request, ModelAndView mv, CompanyVO vo) {

		String password = vo.getCpw();
		// => 입력값의 오류에 대한 확인은 UI 에서 JavaScript로 처리
		vo = service.selectOne(vo);
		if (vo != null) {
			// ** BCryptPasswordEncoder 적용
			// => passwordEncoder.matches(rawData, digest) -> (입력값, DB에보관된값)
			if (passwordEncoder.matches(password, vo.getCpw())) {
				// 로그인 성공 : 로그인정보 session에 보관,  home으로
				request.getSession().setAttribute("loginCno",vo.getCno());
				request.getSession().setAttribute("loginCname",vo.getCname());
				mv.setViewName("redirect:home");
			}else {
				// password 오류 : message , 재로그인 유도 (loginForm 으로)
				mv.addObject("message"," password 오류 !! 다시 하세요 ~~");
				mv.setViewName("company/cloginForm");
			}
		}else {
			// ID 오류
			mv.addObject("message"," ID 오류 !! 다시 하세요 ~~");
			mv.setViewName("company/cloginForm");
		}
		return mv;
	} //login
	
	// ** Logout
	@RequestMapping(value = "/clogout")
	public ModelAndView clogout(HttpServletRequest request, ModelAndView mv, RedirectAttributes rttr) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		rttr.addFlashAttribute("message","로그아웃");
		mv.setViewName("redirect:home");
		return mv;
	} //logout
	
	
	//---------------------------------------------------------------------------------------------------
	// ** 업체콘텐츠 지역별로 보기 + 각 문화공간 상세정보
	// ** Company Content_main화면
	@RequestMapping(value = "/ccontent_main")
	public ModelAndView ccontent_main(ModelAndView mv) {
		
		List<CompanyVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 한건도 없습니다 ~~") ;
		}
		mv.setViewName("company/comContent/comContent_main");
		return mv;
	}//cinfo_main
	
	// ** Company Content : 서울
	@RequestMapping(value = "/ccontent_seoul")
	public ModelAndView ccontent_seoul(ModelAndView mv) {
		
		List<CompanyVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 한건도 없습니다 ~~") ;
		}
		mv.setViewName("company/comContent/comContent_Seoul");
		return mv;
	}//cinfo_main
	
	// ** Company Content : 부산
	@RequestMapping(value = "/ccontent_busan")
	public ModelAndView ccontent_busan(ModelAndView mv) {
		
		List<CompanyVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 한건도 없습니다 ~~") ;
		}
		mv.setViewName("company/comContent/comContent_Busan");
		return mv;
	}//cinfo_busan
	
	// ** Company Content : 제주
	@RequestMapping(value = "/ccontent_jeju")
	public ModelAndView ccontent_jeju(ModelAndView mv) {
		
		List<CompanyVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 한건도 없습니다 ~~") ;
		}
		mv.setViewName("company/comContent/comContent_Jeju");
		return mv;
	}//cinfo_jeju
	
	// ** Company Content : 강원
	@RequestMapping(value = "/ccontent_gangwon")
	public ModelAndView ccontent_gangwon(ModelAndView mv) {
		
		List<CompanyVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 한건도 없습니다 ~~") ;
		}
		mv.setViewName("company/comContent/comContent_Gangwon");
		return mv;
	}//cinfo_Gangwon
	
	// ** Company Content : 경기
	@RequestMapping(value = "/ccontent_gyeonggi")
	public ModelAndView ccontent_gyeonggi(ModelAndView mv) {
		
		List<CompanyVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 한건도 없습니다 ~~") ;
		}
		mv.setViewName("company/comContent/comContent_Gyeonggi");
		return mv;
	}//cinfo_Gyeonggi
	
	// ** Company Content : 대구
	@RequestMapping(value = "/ccontent_daegu")
	public ModelAndView ccontent_daegu(ModelAndView mv) {
		
		List<CompanyVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana", list);
		}else {
			mv.addObject("message", "~~ 출력할 자료가 한건도 없습니다 ~~") ;
		}
		mv.setViewName("company/comContent/comContent_Daegu");
		return mv;
	}//cinfo_daegu
	
	// ** Company Content : 문화공간별 상세보기 (로그인없이도 보기가능)
	@RequestMapping(value = "/cdetail01")
	public ModelAndView cdetail01(HttpServletRequest request, ModelAndView mv, CompanyVO vo, RedirectAttributes rttr) {
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			vo = service.selectOne(vo);
			if (vo != null) {
				request.setAttribute("Apple", vo);
				mv.setViewName("company/comContent/comDetail");  
			}else {
				rttr.addFlashAttribute("message", "~~ 글번호에 해당하는 업체를 찾을 수 없습니다 ~~");
				mv.setViewName("redirect:comDetail_main"); 
			}
		}
		return mv;
	} //cdetail01

	
	//---------------------------------------------------------------------------------------------------
	// ** 마이페이지 : 마이페이지 메인화면
	@RequestMapping(value = "/cinfo_main")
	public ModelAndView cinfo_main(HttpServletRequest request, ModelAndView mv, CompanyVO vo) {
		
		HttpSession session =request.getSession(false);
		if(session !=null && session.getAttribute("loginCno")!=null) {
			vo.setCno((String)session.getAttribute("loginCno"));
			
			if(request.getParameter("cno")!=null) vo.setCno(request.getParameter("cno"));
			vo=service.selectOne(vo);
			if(vo!=null) {
				if("U".equals(request.getParameter("jcode"))) {
					mv.setViewName("company/comUpdateForm");
					vo.setCpw((String)session.getAttribute("loginCpw"));
				}else {
					mv.setViewName("company/comInfo/comInfo_Main");
					vo.setCpw("********");
				}
				mv.addObject("Apple",vo);
			}else {
				mv.addObject("message","~~ 정보를 찾을 수 없습니다, 로그인 후 이용하세요 ~~");
				mv.setViewName("company/cloginForm");
			}
		}else {
			// 로그인 정보 없음
			mv.addObject("message","~~ 로그인 정보 없습니다, 로그인 후 이용하세요 ~~");
			mv.setViewName("company/cloginForm");
		}		
		return mv;
	}//cinfo_main
	
	// ** 사업자회원보는 내정보보기 : 로그인해야만 볼 수 있는 내 정보 
	@RequestMapping(value = "/cinfo_detail")
	public ModelAndView cinfo_detail(HttpServletRequest request, ModelAndView mv, CompanyVO vo) {
		
		HttpSession session =request.getSession(false);
		if(session !=null && session.getAttribute("loginCno")!=null) {
			vo.setCno((String)session.getAttribute("loginCno"));
			
			if(request.getParameter("cno")!=null) vo.setCno(request.getParameter("cno"));
			vo=service.selectOne(vo);
			if(vo!=null) {
				if("U".equals(request.getParameter("jcode"))) {
					mv.setViewName("company/comUpdateForm");
					vo.setCpw((String)session.getAttribute("loginCpw"));
				}else {
					mv.setViewName("company/comInfo/comInfo_Detail");
					vo.setCpw("********");
				}
				mv.addObject("Apple",vo);
			}else {
				mv.addObject("message","~~ 정보를 찾을 수 없습니다, 로그인 후 이용하세요 ~~");
				mv.setViewName("company/cloginForm");
			}
		}else {
			// 로그인 정보 없음
			mv.addObject("message","~~ 로그인 정보 없습니다, 로그인 후 이용하세요 ~~");
			mv.setViewName("company/cloginForm");
		}		
		return mv;
		
	}//cdetail :내정보보기
	
	// ** 마이페이지 : 내정보수정하기
	@RequestMapping(value = "/cinfo_cinfo")
	public ModelAndView cinfo_cinfo(HttpServletRequest request, ModelAndView mv, CompanyVO vo) {
		
		HttpSession session =request.getSession(false);
		if(session !=null && session.getAttribute("loginCno")!=null) {
			vo.setCno((String)session.getAttribute("loginCno"));
			
			if(request.getParameter("cno")!=null) vo.setCno(request.getParameter("cno"));
			vo=service.selectOne(vo);
			if(vo!=null) {
				if("U".equals(request.getParameter("jcode"))) {
					mv.setViewName("company/comUpdateForm");
					vo.setCpw((String)session.getAttribute("loginCpw"));
				}else {
					mv.setViewName("company/comInfo/comInfo_Cinfo");
					vo.setCpw("********");
				}
				mv.addObject("Apple",vo);
			}else {
				mv.addObject("message","~~ 정보를 찾을 수 없습니다, 로그인 후 이용하세요 ~~");
				mv.setViewName("company/cloginForm");
			}
		}else {
			// 로그인 정보 없음
			mv.addObject("message","~~ 로그인 정보 없습니다, 로그인 후 이용하세요 ~~");
			mv.setViewName("company/cloginForm");
		}		
		return mv;
	}//cinfo_cinfo
	
	
	//---------------------------------------------------------------------------------------------------
	// ** 업체회원가입 : cjoinf
	@RequestMapping(value = "/cjoinf")
	public ModelAndView joinf(ModelAndView mv) {
		mv.setViewName("company/cjoinForm01");
		return mv;
	} //joinf

	// ** Join
	@RequestMapping(value = "/cjoin")
	public ModelAndView cjoin(HttpServletRequest request, ModelAndView mv, CompanyVO vo) throws IOException  {

		String realPath = request.getRealPath("/"); // deprecated Method
		System.out.println("** realPath => "+realPath);

		// ** 위 의 위치를 이용해서 실제 저장위치 확인 
		// => 개발중인지, 배포했는지 에 따라 결정
		if (realPath.contains(".eclipse."))
			realPath = "C:/Users/skyla/Documents/MTest/MyWork/TeamProject/src/main/webapp/resources/uploadImage/";
		else realPath += "resources\\uploadImage\\"; 

		// ** 폴더 만들기 (File 클래스활용)
		// => 위의 저장경로에 폴더가 없는 경우 (uploadImage가 없는경우)  만들어 준다
		File f1 = new File(realPath);
		if (!f1.exists()) f1.mkdir();

		// 기본 Image 지정
		String file1, file2 = "resources/uploadImage/basicman1.png";

		MultipartFile uploadfilef = vo.getComuploadfilef();
		if ( uploadfilef != null && !uploadfilef.isEmpty() ) {
			// Image 를 선택했음
			file1 = realPath + uploadfilef.getOriginalFilename(); //  전송된 File명 추출 & 연결
			uploadfilef.transferTo(new File(file1)); // real 위치에 전송된 File 붙여넣기
			file2 = "resources/uploadImage/" + uploadfilef.getOriginalFilename(); // Table 저장 경로
		}

		vo.setComuploadfile(file2); // Table 저장 경로 set

		// ** Password 암호화 => BCryptPasswordEncoder 적용 
		vo.setCpw(passwordEncoder.encode(vo.getCpw()));

		if (service.insert(vo) > 0) {
			// Join 성공 -> 로그인 유도
			mv.addObject("message", "~~ 회원가입 완료, 로그인 하세요 ~~");
			mv.setViewName("company/cjoinForm02");
		}else {
			// Join 실패 -> 재가입 유도
			mv.addObject("message", "~~ 회원가입 오류, 다시 하세요 ~~");
			mv.setViewName("company/cjoinForm01");
		}
		return mv;
	} //join
	
	
	//---------------------------------------------------------------------------------------------------	
	// ** Company Update : 사업자회원 내정보수정
	@RequestMapping(value = "/cupdate")
	public ModelAndView cupdate(HttpServletRequest request, ModelAndView mv, CompanyVO vo, RedirectAttributes rttr) throws IOException {
		
		String realPath = request.getRealPath("/");
		if (realPath.contains(".eclipse."))
			 realPath = "C:/Users/skyla/Documents/MTest/MyWork/TeamProject/src/main/webapp/resources/uploadImage/";
		else realPath += "resources\\uploadImage\\";
		
		// * 폴더 만들기 (위의 저장경로에 폴더가 없을 경우)
		File f1 = new File(realPath);
		if (!f1.exists()) f1.mkdir();
		
		// * 기본 Image 지정
		String file1, file2 = "resources/uploadImage/basicman1.png";
		
		MultipartFile comuploadfilef = vo.getComuploadfilef();
		if ( comuploadfilef != null && !comuploadfilef.isEmpty() ) {
			// 변경할시 : Image 를 선택했음
			file1 = realPath + comuploadfilef.getOriginalFilename(); //  전송된 File명 추출 & 연결
			comuploadfilef.transferTo(new File(file1)); // real 위치에 전송된 File 붙여넣기
			file2 = "resources/uploadImage/" + comuploadfilef.getOriginalFilename(); // Table 저장 경로
		}else {
			// 변경없을시 : 이전과 동일하게 처리 
			file2 = vo.getComuploadfile();
		}

		vo.setComuploadfile(file2); // Table 저장 경로 set

		// ** Password 암호화 => BCryptPasswordEncoder 적용 
		vo.setCpw(passwordEncoder.encode(vo.getCpw()));

		if (service.update(vo) > 0) {
			// Update 성공 -> 상세정보확인
			rttr.addFlashAttribute("message", "~~ 정보 수정 성공 ~~");
			mv.setViewName("redirect:cdetail");
		}else {
			// Update 실패 -> 재수정 할 수 있도록 유도
			rttr.addFlashAttribute("message", "~~ 정보수정 오류, 다시 하세요 ~~");
			mv.setViewName("redirect:cdetail?cno="+vo.getCno()+"&jcode=U");
		}
		return mv;
	}//cupdate
	
	// ** Company Delete : 사업자 탈퇴 
	@RequestMapping(value = "/cdelete")
	public ModelAndView cdelete(HttpServletRequest request,ModelAndView mv, CompanyVO vo, RedirectAttributes rttr) {
		
		// * 삭제대상 -> vo에 set
		HttpSession session = request.getSession(false);
		String loginCno = (String)session.getAttribute("loginCno");
		
		if (session!=null && loginCno != null) {
			vo.setCno(loginCno);
			vo=service.selectOne(vo);
			if(vo!=null) {
				String fileName =vo.getComuploadfile().substring(vo.getComuploadfile().lastIndexOf("/")+1);
				String realPath = request.getRealPath("/"); // deprecated Method
				if (realPath.contains(".eclipse."))
					 realPath = "C:/Users/skyla/Documents/MTest/MyWork/TeamProject/src/main/webapp/resources/uploadImage/"+fileName;
				else realPath += "resources\\uploadImage\\"+fileName;
				File delF = new File(realPath);
				if (delF.exists()) delF.delete();
			}

			if(service.delete(vo)>0) {
				session.invalidate();
				rttr.addFlashAttribute("message","사업자회원 탈퇴되셨습니다. 1개월 후 재가입 가능합니다.");
				mv.setViewName("redirect:home");
			}else {
				rttr.addFlashAttribute("message", "회원탈퇴 오류입니다. 다시 시도하세요.");
				mv.setViewName("redirect:cdetail?cno="+vo.getCno());
			}
		}else {
			// 탈퇴 불가능 => message, loginForm.jsp 
			mv.addObject("message", "~~ 탈퇴 불가능 !!  로그인후 하세요 ~~");
			mv.setViewName("member/loginForm");
		}
		return mv;
	}//cdelete

}//class

package com.ncs.one;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.ReservationService;
import vo.PmemberVO;
import vo.ReservationVO;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationService service;
	
	
	// ** 예약접수 메인 폼
	@RequestMapping(value = "/rmainf")
	public ModelAndView rmainf(ModelAndView mv) {
		mv.setViewName("reservation/mainForm");
		return mv;
	} //rmainf
	
}//class

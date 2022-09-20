package kr.kopo.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kopo.domain.ProfessorVO;
import kr.kopo.domain.StudentVO;
import kr.kopo.service.ProfessorService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ProfessorService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Locale locale, Model model) throws ParseException {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		String from = "1985-05-29";
		Date to;
		SimpleDateFormat tranForm = new SimpleDateFormat("yyyy-MM-dd");
		to = tranForm.parse(from);
		
		List<ProfessorVO> list = null;
		list = new ArrayList<ProfessorVO>();
		ProfessorVO vo = new ProfessorVO();
		
		vo.setPid(1);
		vo.setPname("김상범");
		vo.setDept("컴정");
		vo.setPost("교수");
		vo.setPay(5000000);
		vo.setHire(to);
		vo.setMajor("프로그램");
		vo.setCampus("폴리텍2");
		list.add(vo);
		
		from="1995-06-28";
//		tranForm = new SimpleDateFormat("yyyy-MM-dd");
		to = tranForm.parse(from);
		vo = new ProfessorVO();
		vo.setPid(2);
		vo.setPname("인은숙");
		vo.setDept("컴정");
		vo.setPost("부교수");
		vo.setPay(4000000);
		vo.setHire(to);
		vo.setMajor("프로그램");
		vo.setCampus("폴리텍6");
		list.add(vo);
		
		from="1996-12-01";
		to = tranForm.parse(from);
		vo = new ProfessorVO();
		vo.setPid(3);
		vo.setPname("원종철");
		vo.setDept("전자");
		vo.setPost("부교수");
		vo.setPay(3000000);
		vo.setHire(to);
		vo.setMajor("전자계산기");
		vo.setCampus("폴리텍1");
		list.add(vo);
		
		from="1997-01-28";
		to = tranForm.parse(from);
		vo = new ProfessorVO();
		vo.setPid(4);
		vo.setPname("이우열");
		vo.setDept("정통");
		vo.setPost("조교수");
		vo.setPay(2000000);
		vo.setHire(to);
		vo.setMajor("정보통신");
		vo.setCampus("폴리텍7");
		list.add(vo);
		
		from="2030-10-21";
		to = tranForm.parse(from);
		vo = new ProfessorVO();
		vo.setPid(5);
		vo.setPname("이소율");
		vo.setDept("컴공");
		vo.setPost("교수");
		vo.setPay(5000000);
		vo.setHire(to);
		vo.setMajor("전자");
		vo.setCampus("폴리텍7");
		list.add(vo);
		
		model.addAttribute("list", list);
		
		return "list";
	}
	
	// 테이블 클릭하면 해당 교수가 담당하는 학생 테이블 나타나게 하는 페이지
	@GetMapping(value = "/getajax")
	public String getajax(Model model) throws ParseException {
		
//		List<ProfessorVO> list = null;
//		   list = new ArrayList<ProfessorVO>();
//		   ProfessorVO vo = new ProfessorVO();
//		   
//		   String from = "1985-05-29";
//		   Date to;
//		   SimpleDateFormat transForm = new SimpleDateFormat("yyyy-MM-dd");
//		   to = transForm.parse(from);
//		   
//		   vo.setPid(1);
//		   vo.setPname("김상범");
//		   vo.setDept("컴정");
//		   vo.setPost("교수");
//		   vo.setPay(5000000);
//		   vo.setHire(to);
//		   vo.setMajor("프로그램");
//		   vo.setCampus("폴리텍2");
//		   list.add(vo);
//		   
//		   from="1995-06-28";
//			to = transForm.parse(from);
//			vo = new ProfessorVO();
//			vo.setPid(2);
//			vo.setPname("인은숙");
//			vo.setDept("컴정");
//			vo.setPost("부교수");
//			vo.setPay(4000000);
//			vo.setHire(to);
//			vo.setMajor("프로그램");
//			vo.setCampus("폴리텍6");
//			list.add(vo);
//			
//			from="1996-12-01";
//			to = transForm.parse(from);
//			vo = new ProfessorVO();
//			vo.setPid(3);
//			vo.setPname("원종철");
//			vo.setDept("전자");
//			vo.setPost("부교수");
//			vo.setPay(3000000);
//			vo.setHire(to);
//			vo.setMajor("전자계산기");
//			vo.setCampus("폴리텍1");
//			list.add(vo);
//			
//			from="1997-01-28";
//			to = transForm.parse(from);
//			vo = new ProfessorVO();
//			vo.setPid(4);
//			vo.setPname("이우열");
//			vo.setDept("정통");
//			vo.setPost("조교수");
//			vo.setPay(2000000);
//			vo.setHire(to);
//			vo.setMajor("정보통신");
//			vo.setCampus("폴리텍7");
//			list.add(vo);
//			
//			from="2030-10-21";
//			to = transForm.parse(from);
//			vo = new ProfessorVO();
//			vo.setPid(5);
//			vo.setPname("이소율");
//			vo.setDept("컴공");
//			vo.setPost("교수");
//			vo.setPay(5000000);
//			vo.setHire(to);
//			vo.setMajor("전자");
//			vo.setCampus("폴리텍7");
//			list.add(vo);
			model.addAttribute( "list", service.list() );
			
			return "getajax";
	}
	
	@GetMapping(value = "/getajax2")
	public String getajax2(Model model) throws ParseException {
		
		List<StudentVO> list = new ArrayList<StudentVO>();
		StudentVO vo = new StudentVO();
		
		String from = "1992-05-29";
		   Date to;
		   SimpleDateFormat transForm = new SimpleDateFormat("yyyy-MM-dd");
		   to = transForm.parse(from);
		   vo.setSid(1);
		   vo.setSname("학생1");
		   vo.setDept("하이테크");
		   vo.setBirth(to);
		   vo.setSex("여성");
		   vo.setPid(1);
		   list.add(vo);
		   
		   from = "1996-03-28";
		   to = transForm.parse(from);
		   vo = new StudentVO();
		   vo.setSid(2);
		   vo.setSname("학생2");
		   vo.setDept("하이테크");
		   vo.setBirth(to);
		   vo.setSex("여성");
		   vo.setPid(2);
		   list.add(vo);

		   from = "1998-07-28";
		   to = transForm.parse(from);
		   vo = new StudentVO();
		   vo.setSid(2);
		   vo.setSname("학생3");
		   vo.setDept("하이테크");
		   vo.setBirth(to);
		   vo.setSex("여성");
		   vo.setPid(3);
		   list.add(vo);
		   model.addAttribute("list", list); 
		
		return "getajax2";
	}
	
	
	
}

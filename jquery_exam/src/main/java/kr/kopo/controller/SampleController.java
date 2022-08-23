package kr.kopo.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.kopo.domain.ProfessorVO;
import kr.kopo.domain.SampleVO;
import kr.kopo.domain.Ticket;

@RestController
@RequestMapping("/sample")
public class SampleController {

   @GetMapping(value="/getText", produces="text/plain; charset=UTF-8")
   public String getText() {
      return "안녕하세요";
   }
   
   @GetMapping(value="/getSample")
   public SampleVO getSample() {
         return new SampleVO(112, "star", "burn"); 
   }
   
   @GetMapping(value="/getList")
   public List<SampleVO> getList() {
      return IntStream.range(1, 10).mapToObj(i->new SampleVO(i, i+"First", i+"Last")).collect(Collectors.toList());
   }
   
   @GetMapping(value="/getMap")
   public Map<String, SampleVO> getMap() {
      Map<String, SampleVO> map = new HashMap<>();
      map.put("first", new SampleVO(111,"그루트","쥬니어"));
      return map;
   }
   
   //get방식으로 전달
   //ResponseEntity 트로토콜 헤드라인에 정보(http프로토콜 상태)를 전달할 수 있는 객체 
   @GetMapping(value="/check", params= {"height","weight"})
   public ResponseEntity<SampleVO> check(Double height, Double weight){
	   SampleVO vo = new SampleVO(0, ""+height, ""+weight);
	   ResponseEntity<SampleVO> result = null;
	   if(height < 150) {
		   result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
	   } else {
		   result = ResponseEntity.status(HttpStatus.OK).body(vo);
	   }
	   return result;
   }
   
   @GetMapping("/product/{cat}/{pid}")
   public String[] getPath(@PathVariable("cat") String cat, @PathVariable("pid") Integer pid) {
	   return new String[] { "category: " + cat, "productid: " + pid};
   }
   
   @PostMapping("/ticket")
   public ResponseEntity<Ticket> convert(@RequestBody Ticket ticket) {
	   ResponseEntity<Ticket> result = null;
	   return new ResponseEntity<>(ticket, HttpStatus.OK);
//	   return result = ResponseEntity.status(HttpStatus.OK).body(ticket);
   }
   
   @GetMapping(value = "/getList/{pid}")
   public ResponseEntity<List<ProfessorVO>> getList(@PathVariable("pid") long pid) throws ParseException{
	   
	   List<ProfessorVO> list = null;
	   list = new ArrayList<ProfessorVO>();
	   ProfessorVO vo = new ProfessorVO();
	   
	   String from = "1985-05-29";
	   Date to;
	   SimpleDateFormat transForm = new SimpleDateFormat("yyyy-MM-dd");
	   to = transForm.parse(from);
	   
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
		to = transForm.parse(from);
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
		to = transForm.parse(from);
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
		to = transForm.parse(from);
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
		to = transForm.parse(from);
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
		
		
		return new ResponseEntity<>(list,HttpStatus.OK); 
	   
   }
   
   
   
}
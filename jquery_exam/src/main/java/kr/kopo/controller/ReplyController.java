package kr.kopo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.kopo.domain.StudentVO;
import kr.kopo.service.StudentService;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reply/")
@RestController //ajax표현으로 하겠다. 
@Log4j
public class ReplyController {

	@Autowired
	private StudentService service;
	
	@GetMapping(value = "/getList/{pid}")
	public ResponseEntity<List<StudentVO>> getList(@PathVariable("pid") long pid){
		return new ResponseEntity<>(service.getList(pid), HttpStatus.OK);
	}
	
	@GetMapping(value = "/list")
	public ResponseEntity<List<StudentVO>> list(){
		return new ResponseEntity<>(service.Listall(), HttpStatus.OK);
	}
	
	//@RequestBody - studentRegister메소드에 StudentVO객체에 데이터를 받기 위해 붙여준다.  
	@PostMapping(value="/add", consumes="application/json")
	public ResponseEntity<String> add(@RequestBody StudentVO vo){
		int insertCount = service.studentRegister(vo);
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/{sid}")
	public ResponseEntity<StudentVO> get(@PathVariable("sid") long sid) {
		return new ResponseEntity<>(service.studentRead(sid), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{sid}")
	public ResponseEntity<String> remove(@PathVariable("sid") long sid) {
		return service.studentDelete(sid) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value= "/{sid}", consumes="application/json")
	public ResponseEntity<String> modify(@RequestBody StudentVO vo) {
		return service.studentUpdate(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}

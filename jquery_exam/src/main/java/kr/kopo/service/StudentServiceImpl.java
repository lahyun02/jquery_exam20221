package kr.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kopo.domain.StudentVO;
import kr.kopo.mapper.StudentMapper;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentMapper mapper;
	
	@Override
	public List<StudentVO> studentList() {
		return mapper.studentList();
	}

	@Override
	public void studentRegister(StudentVO item) {
		mapper.studentInsert(item);
	}

	@Override
	public StudentVO studentRead(long sid) {
		return mapper.studentRead(sid);
	}

	@Override
	public void studentDelete(long sid) {
		mapper.studentDelete(sid);
	}

	@Override
	public void studentUpdate(StudentVO item) {
		mapper.studentUpdate(item);
	}

	@Override
	public List<StudentVO> studentSelect(long pid) {
		return mapper.studentSelect(pid); 
	}

}

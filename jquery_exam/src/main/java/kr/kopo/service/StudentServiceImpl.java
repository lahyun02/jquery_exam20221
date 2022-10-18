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
	public List<StudentVO> studentList(long pid) {
		return mapper.getList(pid);
	}

	@Override
	public int studentRegister(StudentVO item) {
		return mapper.studentInsert(item);
	}

	@Override
	public StudentVO studentRead(long sid) {
		return mapper.studentRead(sid);
	}

	@Override
	public int studentDelete(long sid) {
		return mapper.studentDelete(sid);
	}

	@Override
	public int studentUpdate(StudentVO item) {
		return mapper.studentUpdate(item);
	}

	@Override
	public List<StudentVO> studentSelect(long pid) {
		return mapper.studentSelect(pid); 
	}

	@Override
	public List<StudentVO> Listall() {
		return mapper.Listall();
	}

	@Override
	public List<StudentVO> getList(long pid) {
		return mapper.getList(pid); 
	}

}

package kr.kopo.service;

import java.util.List;

import kr.kopo.domain.StudentVO;


public interface StudentService {
	public List<StudentVO> studentList();
	public void studentRegister(StudentVO item);
	public StudentVO studentRead(long sid);
	public void studentDelete(long sid);
	public void studentUpdate(StudentVO item);
	public List<StudentVO> studentSelect(long pid);
}

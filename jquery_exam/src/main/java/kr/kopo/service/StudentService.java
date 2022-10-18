package kr.kopo.service;

import java.util.List;

import kr.kopo.domain.StudentVO;


public interface StudentService {
	public List<StudentVO> studentList(long pid);
	public int studentRegister(StudentVO item);
	public StudentVO studentRead(long sid);
	public int studentDelete(long sid);
	public int studentUpdate(StudentVO item);
	
	public List<StudentVO> studentSelect(long pid);
	
	public  List<StudentVO> getList(long pid);
	public List<StudentVO> Listall();
}

package kr.kopo.mapper;

import java.util.List;

import kr.kopo.domain.StudentVO;

public interface StudentMapper {
	public List<StudentVO> studentList();
	
	public void studentInsert(StudentVO item);
	
	public StudentVO studentRead(long sid);
	
	public int studentUpdate(StudentVO item);
	
	public int studentDelete(long sid);

	public List<StudentVO> studentSelect(long pid);
}

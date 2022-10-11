package kr.kopo.mapper;

import java.util.List;

import kr.kopo.domain.ProfessorVO;

public interface ProfessorMapper {
	
	public List<ProfessorVO> list();
	
	public boolean insert(ProfessorVO item);
	
	public ProfessorVO read(long sid);
	
	public boolean update(ProfessorVO item);
	
	public boolean delete(long sid);
	
}

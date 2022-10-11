package kr.kopo.service;

import java.util.List;

import kr.kopo.domain.ProfessorVO;

public interface ProfessorService {
	
	public List<ProfessorVO> list();
	public boolean register(ProfessorVO item);
	public ProfessorVO read(long pid);
	public boolean delete(long pid);
	public boolean update(ProfessorVO item);
	
}

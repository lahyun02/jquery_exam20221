package kr.kopo.service;

import java.util.List;

import kr.kopo.domain.ProfessorVO;

public interface ProfessorService {
	
	public List<ProfessorVO> list();
	public void register(ProfessorVO item);
	public ProfessorVO read(long pid);
	public void delete(long pid);
	public void update(ProfessorVO item);
	
}

package com.ddgold.service;

import java.util.List;

import com.ddgold.vo.CodeVO;

public interface CodeService {
	
	public List<CodeVO> getCodes(CodeVO param);
	
	public CodeVO getCode(CodeVO param);
	
	public int insertCode(CodeVO param);

	public int updateCode(CodeVO param);
	
	public int deleteCode(CodeVO param);
}

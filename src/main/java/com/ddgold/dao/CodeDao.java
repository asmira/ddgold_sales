package com.ddgold.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ddgold.vo.CodeVO;

@Mapper
public interface CodeDao {
	public List<CodeVO> selectCodes(CodeVO param);
	
	public CodeVO selectCode(CodeVO param);
	
	public int insertCode(CodeVO param);
	
	public int updateCode(CodeVO param);
	
	public int deleteCode(CodeVO param);
}

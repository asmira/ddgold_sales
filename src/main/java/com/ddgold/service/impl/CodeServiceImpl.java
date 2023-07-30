package com.ddgold.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddgold.dao.CodeDao;
import com.ddgold.service.CodeService;
import com.ddgold.vo.CodeVO;

@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	CodeDao codeDao;
	
	@Override
	public List<CodeVO> getCodes(CodeVO param) {
		return codeDao.selectCodes(param);
	}

	@Override
	public CodeVO getCode(CodeVO param) {
		return codeDao.selectCode(param);
	}

	@Override
	public int insertCode(CodeVO param) {
		return codeDao.insertCode(param);
	}

	@Override
	public int updateCode(CodeVO param) {
		return codeDao.updateCode(param);
	}

	@Override
	public int deleteCode(CodeVO param) {
		return codeDao.deleteCode(param);
	}

}

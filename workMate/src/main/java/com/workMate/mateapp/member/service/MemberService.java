package com.workMate.mateapp.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.workMate.mateapp.member.vo.MemberVO;

public interface MemberService {
	 public List listMembers() throws DataAccessException;
	 public int addMember(MemberVO memberVO) throws DataAccessException;
	 public int removeMember(String id) throws DataAccessException;
	 public MemberVO login(MemberVO memberVO) throws Exception;
}

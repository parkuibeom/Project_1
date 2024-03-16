package com.project.dlt.member.dao;

import org.apache.ibatis.annotations.Param;

import com.project.dlt.member.model.MemberVO;

public interface IMemberRepository {
	public MemberVO login(@Param("userId")String userId,@Param("userPw") String userPw);
}

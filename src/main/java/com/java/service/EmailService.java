package com.java.service;

import com.java.dto.MemberDto;

public interface EmailService {

	//html 형식 이메일 전송
	void email_send(MemberDto memberDto);

}

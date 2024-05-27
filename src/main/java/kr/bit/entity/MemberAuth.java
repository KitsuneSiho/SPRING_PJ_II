package kr.bit.entity;

import lombok.Data;

@Data
public class MemberAuth {
	
	private int num; //번호
	private String memberID; //아이디
	private String auth;  //권한

}

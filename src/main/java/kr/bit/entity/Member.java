package kr.bit.entity;

import java.util.List;

import lombok.Data;

@Data
public class Member {
	
	private int memberIdx; 
	private String memberID; 
	private String memberPw;
	private String memberName; 
	private int memberAge;
	private String memberGender; 
	private String memberEmail;
	private String memberProfile;
	private List<MemberAuth> authLi; //authLi.auth[0], authLi.auth[1], authLi.auth[2],
	                                //authLi.auth[3]............
 
}

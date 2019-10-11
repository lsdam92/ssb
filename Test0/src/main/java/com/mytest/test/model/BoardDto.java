package com.mytest.test.model;

public class BoardDto {
//	사원기본정보
//	CREATE TABLE IS_MATER (
//	       USER_NO              VARCHAR2(4) NOT NULL,  --회원일련번호
//	       KOR_NAME             VARCHAR2(20) NULL,     --한글이름
//	       ENG_NAME             VARCHAR2(20) NULL,     --영문이름
//	       HAN_NAME             VARCHAR2(20) NULL,     --한문이름
//	       JUMIN_NO             VARCHAR2(14) NULL,     --주민번호
//	       SAJIN_NM             VARCHAR2(50) NULL,     --사진파일명(사진경로)
//	       BIRTH_YMD            VARCHAR2(8) NULL,      --생년월일
//	       BIRTH_RN             VARCHAR2(1) NULL,      --양음력 (1이면 양력, 2이면 음력)
//	       SEX                  VARCHAR2(1) NULL,      --성별 (1이면 남자, 2이면 여자)
//	       MARRY_YN             VARCHAR2(1) NULL,      --결혼유무 (0이면미혼, 1이면기혼)
//	       WORK_YEAR            VARCHAR2(2) NULL,      --년차
//	       JOIN_ST              VARCHAR2(1) NULL,      --입사유형 (0이면 정규직, 1이면 계약직)
//	       HOPE_WORK            VARCHAR2(1) NULL,      --희망직무 (0이면 SI, 1이면 SM)
//	       ADDR                 VARCHAR2(50) NULL,     --주소
//	       TEL                  VARCHAR2(20) NULL,     --연락처
//	       EMAIL                VARCHAR2(20) NULL,     --이메일
//	       TECH_GRD             VARCHAR2(20) NULL,     --기술등급 (고급, 중급, 초급)
//	       ALC_QT               VARCHAR2(20) NULL     --주량
//	);
	String user_no;
	String kor_name;
	String eng_name;
	String han_name;
	String jumin_no;
	String sajin_nm;
	String birth_ymd;
	String birth_rn;
	String sex;
	String marry_yn;
	String work_year;
	String join_st;
	String hope_work;
	String addr;
	String tel;
	String email;
	String tech_grd;
	String alc_qt;
	String enable;
	
	public String getEnable() {
		return enable;
	}
	public void setEnable(String enable) {
		this.enable = enable;
	}
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getKor_name() {
		return kor_name;
	}
	public void setKor_name(String kor_name) {
		this.kor_name = kor_name;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getHan_name() {
		return han_name;
	}
	public void setHan_name(String han_name) {
		this.han_name = han_name;
	}
	public String getJumin_no() {
		return jumin_no;
	}
	public void setJumin_no(String jumin_no) {
		this.jumin_no = jumin_no;
	}
	public String getSajin_nm() {
		return sajin_nm;
	}
	public void setSajin_nm(String sajin_nm) {
		this.sajin_nm = sajin_nm;
	}
	public String getBirth_ymd() {
		return birth_ymd;
	}
	public void setBirth_ymd(String birth_ymd) {
		this.birth_ymd = birth_ymd;
	}
	public String getBirth_rn() {
		return birth_rn;
	}
	public void setBirth_rn(String birth_rn) {
		this.birth_rn = birth_rn;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getMarry_yn() {
		return marry_yn;
	}
	public void setMarry_yn(String marry_yn) {
		this.marry_yn = marry_yn;
	}
	public String getWork_year() {
		return work_year;
	}
	public void setWork_year(String work_year) {
		this.work_year = work_year;
	}
	public String getJoin_st() {
		return join_st;
	}
	public void setJoin_st(String join_st) {
		this.join_st = join_st;
	}
	public String getHope_work() {
		return hope_work;
	}
	public void setHope_work(String hope_work) {
		this.hope_work = hope_work;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTech_grd() {
		return tech_grd;
	}
	public void setTech_grd(String tech_grd) {
		this.tech_grd = tech_grd;
	}
	public String getAlc_qt() {
		return alc_qt;
	}
	public void setAlc_qt(String alc_qt) {
		this.alc_qt = alc_qt;
	}
	
}

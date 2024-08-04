package com.java.dto.diagnosis;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetDiagnosisDto {
    // 공통 질문
	private int dno;
    private String name;
    private Date birth;
    private int age;	
    private String sex;
    private String surgery;  //중성화 여부 yes or no
    private float weight;
    private String breed;
    private String condition; // 질병 유형 (eye, skin)
    private String file;
    private Date diagnosisdate; //진단날짜, default=sysdate

    // 안구질환 질문
    private String eye1; //char(1) Y/N
    private String eye2;
    private String eye3;
    private String eye4;
    private String eye5;
    private String eyeColor; // 녹색, 빨간색, 흰색, 검은색

    // 피부질환 질문
    private String skin1; //char(1) Y/N
    private String skin2;
    private String skin3;
    private String skin4;
    private String skin5;
    
    
}


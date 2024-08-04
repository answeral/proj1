package com.java.dto.diagnosis;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetDiagnosisDto {
    // 공통 질문
    private int dno;              // 진단 번호
    private String name;          // 반려동물 이름
    private String birth;         // 생일 (문자열로 수정)
    private int age;              // 나이
    private String sex;           // 성별
    private String surgery;       // 중성화 여부 (yes or no)
    private String weight;        // 체중 (문자열로 수정)
    private String breed;         // 품종
    private String condition;     // 질병 유형 (eye, skin)
    private String file;          // 파일 경로
    private String diagnosisdate; // 진단 날짜 (문자열로 수정)

    // 안구질환 질문
    private String eye1;          // 안구질환 질문 1 (Y/N)
    private String eye2;          // 안구질환 질문 2
    private String eye3;          // 안구질환 질문 3
    private String eye4;          // 안구질환 질문 4
    private String eye5;          // 안구질환 질문 5
    private String eyeColor;      // 안구 색상 (녹색, 빨간색, 흰색, 검은색)

    // 피부질환 질문
    private String skin1;         // 피부질환 질문 1 (Y/N)
    private String skin2;         // 피부질환 질문 2
    private String skin3;         // 피부질환 질문 3
    private String skin4;         // 피부질환 질문 4
    private String skin5;         // 피부질환 질문 5

    // birth를 java.sql.Date로 변환하는 메서드
    public java.sql.Date getBirthAsDate() {
        if (birth == null || birth.isEmpty()) {
            return null;
        }
        try {
            return java.sql.Date.valueOf(birth);
        } catch (IllegalArgumentException e) {
            // 잘못된 날짜 형식 처리
            return null;
        }
    }

    // weight를 float로 변환하는 메서드
    public float getWeightAsFloat() {
        if (weight == null || weight.isEmpty()) {
            return 0.0f;
        }
        try {
            return Float.parseFloat(weight);
        } catch (NumberFormatException e) {
            // 잘못된 숫자 형식 처리
            return 0.0f;
        }
    }
}

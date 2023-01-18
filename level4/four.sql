/*
PATIENT, DOCTOR 그리고 APPOINTMENT 테이블에서 2022년 4월 13일 취소되지 않은 흉부외과(CS) 진료 예약 내역을 조회하는 
SQL문을 작성해주세요. 진료예약번호, 환자이름, 환자번호, 진료과코드, 의사이름, 진료예약일시 항목이 출력되도록 작성해주세요. 
결과는 진료예약일시를 기준으로 오름차순 정렬해주세요.
*/

SELECT
a.APNT_NO, p.PT_NAME, p.PT_NO, d.MCDP_CD, d.DR_NAME, a.APNT_YMD
FROM PATIENT p, DOCTOR d, APPOINTMENT a
WHERE a.PT_NO=p.PT_NO AND 
      d.DR_ID=a.MDDR_ID AND 
      a.APNT_CNCL_YMD IS NULL AND
      a.APNT_YMD LIKE '2022-04-13%'
ORDER BY APNT_YMD

/*
보호소에서 중성화 수술을 거친 동물 정보를 알아보려 합니다. 
보호소에 들어올 당시에는 중성화1되지 않았지만, 보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종, 
이름을 조회하는 아이디 순으로 조회하는 SQL 문을 작성해주세요.
*/

SELECT i.ANIMAL_ID, i.ANIMAL_TYPE, i.NAME
FROM ANIMAL_INS i, ANIMAL_OUTS o
WHERE i.animal_id=o.animal_id AND
      i.sex_upon_intake LIKE 'Intact%' AND
      (o.sex_upon_outcome LIKE 'Spayed%' OR o.sex_upon_outcome LIKE 'Neutered%')
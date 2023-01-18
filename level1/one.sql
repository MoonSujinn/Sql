/*
 * CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 대여 시작일이 2022년 9월에 속하는 대여 기록에 대해서 
 * 대여 기간이 30일 이상이면 '장기 대여' 그렇지 않으면 '단기 대여' 로 표시하는 컬럼(컬럼명: RENT_TYPE)을 추가하여 
 * 대여기록을 출력하는 SQL문을 작성해주세요. 결과는 대여 기록 ID를 기준으로 내림차순 정렬해주세요.
 */


SELECT
HISTORY_ID, CAR_ID, DATE_FORMAT(START_DATE,"%Y-%m-%d") START_DATE, DATE_FORMAT(END_DATE,"%Y-%m-%d") END_DATE,
CASE WHEN DATEDIFF(END_DATE, START_DATE) < 29 then '단기 대여' 
            ELSE '장기 대여' 
            END AS  RENT_TYPE
FROM
CAR_RENTAL_COMPANY_RENTAL_HISTORY 
WHERE START_DATE LIKE '2022-09-%'
ORDER BY HISTORY_ID DESC

/*
CAR_RENTAL_COMPANY_CAR 테이블에서 자동차 종류가 'SUV'인 자동차들의 평균 일일 대여 요금을 출력하는 SQL문을 작성해주세요.
이때 평균 일일 대여 요금은 소수 첫 번째 자리에서 반올림하고, 컬럼명은 AVERAGE_FEE 로 지정해주세요.
*/

SELECT ROUND(AVG(daily_fee),0) AVERAGE_FEE
FROM car_rental_company_car
WHERE CAR_TYPE= 'SUV'

/*
USER_INFO 테이블에서 나이 정보가 없는 회원이 몇 명인지 출력하는 SQL문을 작성해주세요. 
이때 컬럼명은 USERS로 지정해주세요.
*/

SELECT
COUNT(USER_ID) USERS
FROM USER_INFO
WHERE AGE IS NULL

/*
가장 최근에 들어온 동물은 언제 들어왔는지 조회하는 SQL 문을 작성해주세요.
*/

SELECT
MAX(DATETIME) 시간
FROM ANIMAL_INS



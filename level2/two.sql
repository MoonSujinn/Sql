/*
CAR_RENTAL_COMPANY_CAR 테이블에서 '통풍시트', '열선시트', '가죽시트' 중 하나 이상의 옵션이 포함된 자동차가 
자동차 종류 별로 몇 대인지 출력하는 SQL문을 작성해주세요. 이때 자동차 수에 대한 컬럼명은 CARS로 지정하고, 
결과는 자동차 종류를 기준으로 오름차순 정렬해주세요.
*/

SELECT
CAR_TYPE, COUNT(CAR_ID) CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE '%통풍시트%' OR OPTIONS LIKE '%열선시트%' OR OPTIONS LIKE '%가죽시트%'
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE

/*
'경제' 카테고리에 속하는 도서들의 도서 ID(BOOK_ID), 저자명(AUTHOR_NAME), 출판일(PUBLISHED_DATE) 리스트를 출력하는
 SQL문을 작성해주세요. 결과는 출판일을 기준으로 오름차순 정렬해주세요.
*/

SELECT b.BOOK_ID, a.AUTHOR_NAME, DATE_FORMAT(b.PUBLISHED_DATE,'%Y-%m-%d') PUBLISHED_DATE
FROM book b, author a
WHERE b.author_id=a.author_id AND
      b.category='경제'
ORDER BY published_date ASC

/*
MEMBER_PROFILE 테이블에서 생일이 3월인 여성 회원의 ID, 이름, 성별, 생년월일을 조회하는 SQL문을 작성해주세요. 
이때 전화번호가 NULL인 경우는 출력대상에서 제외시켜 주시고, 결과는 회원ID를 기준으로 오름차순 정렬해주세요.
*/

SELECT
MEMBER_ID, MEMBER_NAME, GENDER, DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d') DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE MONTH(DATE_OF_BIRTH)=3 AND
     GENDER = 'W' AND
     TLNO IS NOT NULL
ORDER BY MEMBER_ID

/*
FOOD_PRODUCT 테이블에서 가격이 제일 비싼 식품의 식품 ID, 식품 이름, 식품 코드, 식품분류, 식품 가격을 조회하는 
SQL문을 작성해주세요.
*/

SELECT *
FROM FOOD_PRODUCT
ORDER BY PRICE DESC
LIMIT 1

/*
보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 
09:00부터 19:59까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 
이때 결과는 시간대 순으로 정렬해야 합니다.
*/

SELECT
HOUR(DATETIME) HOUR, COUNT(HOUR(DATETIME)) COUNT
FROM ANIMAL_OUTS
GROUP BY HOUR
HAVING HOUR BETWEEN 9 AND 19
ORDER BY HOUR

/*
동물 보호소에 들어온 동물의 이름은 몇 개인지 조회하는 SQL 문을 작성해주세요. 
이때 이름이 NULL인 경우는 집계하지 않으며 중복되는 이름은 하나로 칩니다.
*/

SELECT
COUNT(DISTINCT NAME) count
FROM ANIMAL_INS
WHERE NAME IS NOT NULL

/*
보호소에 돌아가신 할머니가 기르던 개를 찾는 사람이 찾아왔습니다. 
이 사람이 말하길 할머니가 기르던 개는 이름에 'el'이 들어간다고 합니다. 
동물 보호소에 들어온 동물 이름 중, 이름에 "EL"이 들어가는 개의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 
이때 결과는 이름 순으로 조회해주세요. 단, 이름의 대소문자는 구분하지 않습니다.
*/

SELECT
ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE NAME LIKE '%EL%' AND
     ANIMAL_TYPE = 'Dog'
ORDER BY NAME


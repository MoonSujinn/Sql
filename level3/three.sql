/*
이 서비스에서는 공간을 둘 이상 등록한 사람을 "헤비 유저"라고 부릅니다. 
헤비 유저가 등록한 공간의 정보를 아이디 순으로 조회하는 SQL문을 작성해주세요.
*/

SELECT
ID, NAME, HOST_ID
FROM PLACES
WHERE HOST_ID IN (SELECT
               HOST_ID
               FROM PLACES
               GROUP BY HOST_ID
               HAVING COUNT(HOST_ID)>=2
            )
ORDER BY ID

/*
입양을 간 동물 중, 보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 
이때 결과는 보호 기간이 긴 순으로 조회해야 합니다.
*/

SELECT
i.ANIMAL_ID, i.NAME
FROM ANIMAL_INS i, ANIMAL_OUTS o
WHERE i.ANIMAL_ID = o.ANIMAL_ID 
ORDER BY DATEDIFF(o.DATETIME,i.DATETIME) DESC
LIMIT 2

/*
아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 
이때 결과는 보호 시작일 순으로 조회해야 합니다.
*/

SELECT
NAME, DATETIME
FROM ANIMAL_INS 
WHERE ANIMAL_ID NOT IN(
                        SELECT ANIMAL_ID
                        FROM ANIMAL_OUTS )
ORDER BY DATETIME 
LIMIT 3

/*
관리자의 실수로 일부 동물의 입양일이 잘못 입력되었습니다. 
보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 
이때 결과는 보호 시작일이 빠른 순으로 조회해야합니다.
*/

SELECT
i.ANIMAL_ID, i.NAME
FROM ANIMAL_INS i, ANIMAL_OUTS o
WHERE i.animal_id=o.animal_id AND
    i.datetime>o.datetime
ORDER BY i.datetime

/*
천재지변으로 인해 일부 데이터가 유실되었습니다. 
입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문을 작성해주세요.
*/

SELECT
o.ANIMAL_ID,o.NAME
FROM ANIMAL_outs o
LEFT JOIN ANIMAL_INS i
ON i.ANIMAL_ID=o.ANIMAL_ID
WHERE i.ANIMAL_ID IS NULL
ORDER BY ANIMAL_ID


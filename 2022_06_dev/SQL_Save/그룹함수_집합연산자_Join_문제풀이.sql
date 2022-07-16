

--[EMPLOYEE] 테이블에서 부서코드 그룹별 급여의 합계,그룹별 급여의 평균(정수처리),
--인원수를 조회하고,부서코드 순으로 정렬

select dept_code,  sum(salary), ceil(avg(salary)), count(*) from employee
group by dept_code
order by dept_code;


--[EMPLOYEE] 테이블에서 부서코드 그룹별,보너스를 지급받는 사원 수를 조회하고 부서코드 순으로 정렬
--BONUS컬럼의 값이 존재한다면,그 행을 1로 카운팅.
--보너스를 지급받는 사원이 없는 부서도 있음.
select dept_code, count(bonus) from employee
group by dept_code
order by dept_code;




--@실습문제
--EMPLOYEE 테이블에서 직급이 J1을 제외하고,직급별 사원수 및 평균급여를 출력하세요.

select job_name"직급", trunc(avg(salary),2)"급여평균" from employee
join job
using(job_code)
group by job_name
having job_name != '대표';



--EMPLOYEE테이블에서 직급이 J1을 제외하고, 입사년도별 인원수를 조회해서,입사년 기준으로 오름차순 정렬하세요.

select extract(year from hire_date)"입사년도", count(*)"인원수" from employee
group by extract(year from hire_date)
order by 1;


--[EMPLOYEE] 테이블에서 EMP_NO의 8번째 자리가 1,3 이면 '남',2,4 이면 '여'로 결과를 조회하고,
-- 성별별 급여의 평균(정수처리),급여의 합계,인원수를 조회한 뒤 인원수로 내림차순을 정렬 하시오
select decode(substr(emp_no,8,1),1,'남',2,'여',3,'남',4,'여')"성별",
round(avg(salary),1)"평균", sum(salary)"합계", count(*)"인원" from employee
group by decode(substr(emp_no,8,1),1,'남',2,'여',3,'남',4,'여')
order by 4 desc;



--@실습문제
--부서내 성별 인원수를 구하세요.
select decode(substr(emp_no,8,1),1,'남',2,'여',3,'남',4,'여')"성별", count(*) from employee
group by decode(substr(emp_no,8,1),1,'남',2,'여',3,'남',4,'여');


--부서별 급여 평균이 3,000,000원(버림적용) 이상인  부서들에 대해서 부서명, 급여평균을 출력하세요.
-- 부서별로 그룹을 나누고, 그룹별 급여평균을 구한후, 조건을 제시함.
select dept_title"부서명", trunc(avg(salary),2)"평균급여" from employee
join department
on dept_code=dept_id
group by dept_title
having floor(avg(salary))>3000000;






--@실습문제
--부서별 인원이 5명보다 많은 부서와 인원수를 출력하세요.

select dept_code,count(*) from employee
group by dept_code
having count(*) >5;



--부서별 직급별 인원수가 3명이상인 직급의 부서코드, 직급코드, 인원수를 출력하세요.
select dept_code, job_code, count(*) from employee
group by dept_code, job_code
having count(*)>=3;




--매니져가 관리하는 사원이 2명이상인 매니져아이디와 관리하는 사원수를 출력하세요.

select manager_id, count(*) from employee
group by manager_id 
having count(*)>2 and manager_id is not null;




-- rollup() : 괄호속 그룹의 숫자코드를 출력 
-- 부서별, 직급별 급여의 합계와 부서의 합계 구하기

select dept_code, job_code, trunc(avg(salary)) from employee
group by rollup(dept_code,job_code)
order by dept_code;



--cube() 그룹(1,2)에서 1의 합 2합 1+2의 합 출력
--부서별, 직급별 급여의 합계와 부서의 합계, 직급의 합계구하기

select dept_code, job_code, sum(salary) from employee
group by cube(dept_code,job_code)
order by dept_code;

--grouping
--구한 합계의 직급별 부서별 구분붙이기
select dept_code, job_code, sum(salary) ,
(case when grouping (dept_code)=0 and grouping(job_code)=1 then '부서별합계'
when grouping(dept_code)=1 and grouping(job_code)=0 then '직급별합계'
when grouping (dept_code)=1 and grouping(job_code)=1 then '총합계'
else '부서+직급합계'
end) "구분"
from employee
group by cube(dept_code,job_code)
order by dept_code;

-- JOIN 사용법
-- SELECT FROM 
-- JOIN 테이블명 ON (컬럼1 = 컬럼2)
-- > ANSI 표준 구문(어느 DBMS에서나 사용 가능)



-- > Oracle 전용 구문 (오라클 DBMS에서만 사용 가능)



--@조인실습문제_kh
--1. 2020년 12월 25일이 무슨 요일인지 조회하시오.
select to_char(to_date(20201225),'DAY') from dual;


--2. 주민번호가 1970년대 생이면서 성별이 여자이고, 성이 전씨인 직원들의 사원명, 주민번호, 부서명, 직급명을 조회하시오.
select emp_name"이름", emp_no"주민번호", dept_title"부서명", job_name"직급" from employee
join department
on dept_code= dept_id
join job
using (job_code)
where substr(emp_no,8,1) in (2,4);




--3. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.

select emp_id, emp_name, dept_title from employee
join department
on dept_code = dept_id
where emp_name like '%형%';




--5. 해외영업부에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.

select emp_name, dept_code, job_name, dept_title from employee
join department
on dept_code = dept_id
join job
using (job_code)
where location_id not like 'L1';




--6. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.

select emp_name,bonus,dept_title,national_name from employee
join department
on dept_code =dept_id
join location
on location_id = local_code
join national
using (national_code)
where bonus is not null;



--7. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.

select emp_name, job_name, dept_title, national_name from employee
join department
on dept_code = dept_id
join job
using(job_code)
join location
on location_id = local_code
join national
using(national_code)
where dept_code = 'D2';





--8. 급여등급테이블의 최대급여(MAX_SAL)보다 많이 받는 직원들의 사원명, 직급명, 급여, 연봉을 조회하시오.
-- (사원테이블과 급여등급테이블을 SAL_LEVEL컬럼기준으로 조인할 것)
select emp_name"사원명" , job_name "직급명" , salary"급여" , salary*12"연봉" from employee
join job
using(job_code)
join department
on dept_code=dept_id
join sal_grade
using(sal_level)
where salary>max_sal;





--9. 한국(KO)과 일본(JP)에 근무하는 직원들의 사원명, 부서명, 지역명, 국가명을 조회하시오.
select emp_name"사원명", dept_title"부서명",local_name"지역명",national_name"국가명" from employee
join department
on dept_code = dept_id
join location
on location_id =local_code
join national
using(national_code)
where national_code in ('KO','JP');



--10. 보너스포인트가 없는 직원들 중에서 직급이 차장과 사원인 직원들의 사원명, 직급명, 급여를 조회하시오. 단, join과 IN 사용할 것
select emp_name, job_name, salary from employee
join job
using (job_code)
where bonus is null and job_code in('J4','J7');



--11. 재직중인 직원과 퇴사한 직원의 수를 조회하시오.

select ent_yn, count(ent_yn) from employee
group by ent_yn;




--[EMPLOYEE] 테이블에서 부서코드 그룹별 급여의 합계,그룹별 급여의 평균(정수처리),
--인원수를 조회하고,부서코드 순으로 정렬
select dept_code, sum(salary), ceil(avg(salary)), count(dept_code) from employee
group by dept_code;


--[EMPLOYEE] 테이블에서 부서코드 그룹별,보너스를 지급받는 사원 수를 조회하고 부서코드 순으로 정렬
--BONUS컬럼의 값이 존재한다면,그 행을 1로 카운팅.
--보너스를 지급받는 사원이 없는 부서도 있음.

select dept_code, count(bonus) from employee
group by dept_code;







--@실습문제
--EMPLOYEE 테이블에서 직급이 J1을 제외하고,직급별 사원수 및 평균급여를 출력하세요.
select job_code, round(avg(salary),1), count(*) from employee
group by job_code
having job_code != 'J1';






--EMPLOYEE테이블에서 직급이 J1을 제외하고, 입사년도별 인원수를 조회해서,입사년 기준으로 오름차순 정렬하세요.
select extract(year from hire_date)"입사년도", count(*) from employee
where job_code != 'J1'
group by extract(year from hire_date)
order by 1;



--[EMPLOYEE] 테이블에서 EMP_NO의 8번째 자리가 1,3 이면 '남',2,4 이면 '여'로 결과를 조회하고,
-- 성별별 급여의 평균(정수처리),급여의 합계,인원수를 조회한 뒤 인원수로 내림차순을 정렬 하시오
SELECT decode(substr(emp_no,8,1),1,'남',3,'남',2,'여',4,'여')"성별", ceil(avg(salary))"평균",sum(salary)"합계",count(*) from EMPLOYEE
group by decode(substr(emp_no,8,1),1,'남',3,'남',2,'여',4,'여')
order by 4 desc;

--@실습문제
--부서내 성별 인원수를 구하세요.

select decode(substr(emp_no,8,1),1,'남',3,'남',2,'여',4,'여')"성별", count(*)from EMPLOYEE
group by decode(substr(emp_no,8,1),1,'남',3,'남',2,'여',4,'여');



--부서별 급여 평균이 3,000,000원(버림적용) 이상인  부서들에 대해서 부서명, 급여평균을 출력하세요.
-- 부서별로 그룹을 나누고, 그룹별 급여평균을 구한후, 조건을 제시함.
select dept_code, ceil(avg(salary)) from employee
group by dept_code
having ceil(avg(salary))>=3000000;




--@실습문제
--부서별 인원이 5명보다 많은 부서와 인원수를 출력하세요.

select dept_code, count(*) from employee
group by dept_code
having count(*)>5;



--부서별 직급별 인원수가 3명이상인 직급의 부서코드, 직급코드, 인원수를 출력하세요.

select dept_code,job_code, count(*) from employee
group by dept_code, job_code
having count(*)>=3;


--매니져가 관리하는 사원이 2명이상인 매니져아이디와 관리하는 사원수를 출력하세요.

select manager_id, count(*) from employee
group by manager_id
having count(*)>2 and manager_id is not null;

-- rollup() : 괄호속 그룹의 숫자코드를 출력 
-- 부서별, 직급별 급여의 합계와 부서의 합계 구하기

select dept_code, job_code, sum(salary) from employee
group by dept_code, job_code;


select dept_code, job_code, sum(salary) from employee
group by rollup(dept_code, job_code);



--cube() 그룹(1,2)에서 1의 합 2합 1+2의 합 출력
--부서별, 직급별 급여의 합계와 부서의 합계, 직급의 합계구하기
select dept_code, job_code, sum(salary) from employee
group by cube(dept_code, job_code)
order by 1;


--grouping
--구한 합계의 직급별 부서별 구분붙이기
select dept_code, job_code, sum(salary),
case 
when grouping(dept_code)=0 and grouping(job_code)=1 then '부서합계'
when grouping(dept_code)=1 and grouping(job_code)=0 then '직급합계'
when grouping(dept_code)=1 and grouping(job_code)=1 then '총합계'
else '부서별직급합계' end
from employee
group by rollup(dept_code, job_code);


-- JOIN 사용법
-- SELECT FROM 
-- JOIN 테이블명 ON (컬럼1 = 컬럼2)
-- > ANSI 표준 구문(어느 DBMS에서나 사용 가능)


-- > Oracle 전용 구문 (오라클 DBMS에서만 사용 가능)



--@조인실습문제_kh
--1. 2020년 12월 25일이 무슨 요일인지 조회하시오.
 select to_char(to_date(20201225),'DAY') from dual;


--2. 주민번호가 1970년대 생이면서 성별이 여자이고, 성이 전씨인 직원들의 사원명, 주민번호, 부서명, 직급명을 조회하시오.

select emp_name, emp_no,dept_title,job_name from employee
join department
on dept_code=dept_id
join job
using (job_code)
where substr(emp_no,8,1) in(2,4) and emp_name like '전%';



--3. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.
select emp_id, emp_name,dept_title from employee
join department
on dept_code= dept_id
where emp_name like '%형&';






--5. 해외영업부에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.


select emp_name, job_name, dept_code, dept_title from employee
join department
on dept_code=dept_id
join job
using (job_code)
where dept_code in('D5','D6','D7');



--6. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.
select emp_name, bonus, dept_title, local_name from employee
join department
on dept_code=dept_id
join location
on location_id = local_code
where bonus is not null;




--7. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.
select emp_name, job_name,dept_title, local_name from employee
join job
using(job_code)
join department
on dept_code = dept_id
join location
on location_id=local_code
where dept_code = 'D2';






--8. 급여등급테이블의 최대급여(MAX_SAL)보다 많이 받는 직원들의 사원명, 직급명, 급여, 연봉을 조회하시오.
-- (사원테이블과 급여등급테이블을 SAL_LEVEL컬럼기준으로 조인할 것)

select emp_name, dept_title, salary, salary*12, sal_level, max_sal from employee
join sal_grade
using (sal_level)
join department
on dept_code=dept_id
where salary>max_sal;


--9. 한국(KO)과 일본(JP)에 근무하는 직원들의 사원명, 부서명, 지역명, 국가명을 조회하시오.

select emp_name, dept_title, local_name, national_name from employee
join department
on dept_code=dept_id
join location
on location_id=local_code
join national
using (national_code)
where national_code in ('KO','JP');


--10. 보너스포인트가 없는 직원들 중에서 직급이 차장과 사원인 직원들의 사원명, 직급명, 급여를 조회하시오. 단, join과 IN 사용할 것
select emp_name, job_name, salary from employee
join job
using (job_code)
where bonus is null and job_name in ('차장','사원');

--11. 재직중인 직원과 퇴사한 직원의 수를 조회하시오.

select ent_yn, count(*) from employee
group by ent_yn;







--[EMPLOYEE] 테이블에서 부서코드 그룹별 급여의 합계,그룹별 급여의 평균(정수처리),
--인원수를 조회하고,부서코드 순으로 정렬

select dept_code, sum(salary), round(avg(salary)), count(*) from employee
group by dept_code
order by dept_code;


--[EMPLOYEE] 테이블에서 부서코드 그룹별,보너스를 지급받는 사원 수를 조회하고 부서코드 순으로 정렬
--BONUS컬럼의 값이 존재한다면,그 행을 1로 카운팅.
--보너스를 지급받는 사원이 없는 부서도 있음.

select dept_code, count(bonus) from employee
group by dept_code
order by 1;




--@실습문제
--EMPLOYEE 테이블에서 직급이 J1을 제외하고,직급별 사원수 및 평균급여를 출력하세요.
select job_code, round(avg(salary)), count(*) from employee
--where job_code !='J1'
group by job_code
having job_code != 'J1';




--EMPLOYEE테이블에서 직급이 J1을 제외하고, 입사년도별 인원수를 조회해서,입사년 기준으로 오름차순 정렬하세요.
select extract(year from hire_date), count(*) from employee
where job_code!='J1'
group by extract(year from hire_date)
order by 1;




--[EMPLOYEE] 테이블에서 EMP_NO의 8번째 자리가 1,3 이면 '남',2,4 이면 '여'로 결과를 조회하고,
-- 성별별 급여의 평균(정수처리),급여의 합계,인원수를 조회한 뒤 인원수로 내림차순을 정렬 하시오
select 
decode( substr(emp_no,8,1),1,'남',2,'여',3,'남',4,'여')"성별",
round(avg(salary)), sum(salary),count(*) from employee
group by decode( substr(emp_no,8,1),1,'남',2,'여',3,'남',4,'여')
order by 1 desc;



--@실습문제
--부서내 성별 인원수를 구하세요.

select decode( substr(emp_no,8,1),1,'남',2,'여',3,'남',4,'여')"성별", count(*) from employee
group by decode( substr(emp_no,8,1),1,'남',2,'여',3,'남',4,'여');



--부서별 급여 평균이 3,000,000원(버림적용) 이상인  부서들에 대해서 부서명, 급여평균을 출력하세요.
-- 부서별로 그룹을 나누고, 그룹별 급여평균을 구한후, 조건을 제시함.

select dept_code, trunc(avg(salary)) from employee
group by dept_code
having trunc(avg(salary))>=3000000;





--@실습문제
--부서별 인원이 5명보다 많은 부서와 인원수를 출력하세요.

select dept_code , count(*) from employee
group by dept_code
having count(*)>5;


--부서별 직급별 인원수가 3명이상인 직급의 부서코드, 직급코드, 인원수를 출력하세요.

select dept_code, count(*), job_code from employee
group by dept_code, job_code
having count(*)>=3;



--매니져가 관리하는 사원이 2명이상인 매니져아이디와 관리하는 사원수를 출력하세요.

select manager_id, count(*) from employee
group by manager_id
having count(*)>=2 and manager_id is not null;


-- rollup() : 괄호속 그룹의 숫자코드를 출력 
-- 부서별, 직급별 급여의 합계와 부서의 합계 구하기

select dept_code, job_code, sum(salary) from employee
group by rollup(dept_code, job_code)
order by 1;




--cube() 그룹(1,2)에서 1의 합 2합 1+2의 합 출력
--부서별, 직급별 급여의 합계와 부서의 합계, 직급의 합계구하기
select dept_code, job_code, sum(salary) from employee
group by cube(dept_code, job_code)
order by 1;




--grouping
--구한 합계의 직급별 부서별 구분붙이기

select dept_code, job_code, sum(salary),
case 
when grouping(dept_code)=1 and grouping(job_code)=0 then '직급합계'
when grouping(dept_code)=0 and grouping(job_code)=1 then '부서합계'
when grouping(dept_code)=1 and grouping(job_code)=1 then '총합계'
else '부서별 직급합계' end

from employee
group by cube(dept_code, job_code)
order by 1;

-- JOIN 사용법
-- SELECT FROM 
-- JOIN 테이블명 ON (컬럼1 = 컬럼2)
-- > ANSI 표준 구문(어느 DBMS에서나 사용 가능)


-- > Oracle 전용 구문 (오라클 DBMS에서만 사용 가능)



--@조인실습문제_kh
--1. 2020년 12월 25일이 무슨 요일인지 조회하시오.

select to_char(to_date(20201225),'DAY') from dual;



--2. 주민번호가 1970년대 생이면서 성별이 여자이고, 성이 전씨인 직원들의 사원명, 주민번호, 부서명, 직급명을 조회하시오.
select emp_name, emp_no, dept_title, job_name from employee
join department
on dept_code=dept_id
join job
using(job_code)
where substr(emp_no,8,1) in(2,4) and
(extract(year from to_date(substr(emp_no,1,6))) between 1970 and 1979) and
--(substr(emp_no,1,6) between 70 and 79) and
emp_name like '전%';




--3. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.

select emp_id, emp_name, dept_title from employee
join department
on dept_code= dept_id
where emp_name like '%형%';






--5. 해외영업부에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.
select emp_name, job_name, dept_code, dept_title from employee
join job
using (job_code)
join department
on dept_code =dept_id
where dept_title like '해외영업%부';





--6. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.
select emp_name, bonus,dept_title, local_name from employee
join department
on dept_code= dept_id
join location
on location_id = local_code
where bonus is not null;




--7. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.

select emp_name, dept_title, job_name, local_name from employee
join department
on dept_code= dept_id
join job
using (job_code)
join location
on location_id = local_code
where dept_code= 'D2';







--8. 급여등급테이블의 최대급여(MAX_SAL)보다 많이 받는 직원들의 사원명, 직급명, 급여, 연봉을 조회하시오.
-- (사원테이블과 급여등급테이블을 SAL_LEVEL컬럼기준으로 조인할 것)
select emp_name, dept_title, salary, salary*12 from employee
join department
on dept_id=dept_code
join sal_grade
using (sal_level)
where salary>max_sal;





--9. 한국(KO)과 일본(JP)에 근무하는 직원들의 사원명, 부서명, 지역명, 국가명을 조회하시오.

select emp_name, dept_title, local_name, national_name from employee
join department
on dept_code=dept_id
join location
on local_code=location_id
join national
using (national_code)
where national_code in ('KO','JP');



--10. 보너스포인트가 없는 직원들 중에서 직급이 차장과 사원인 직원들의 사원명, 직급명, 급여를 조회하시오. 단, join과 IN 사용할 것

select emp_name, job_name, salary from employee
join job
using (job_code)
where bonus is null and job_name in ('차장','사원');


--11. 재직중인 직원과 퇴사한 직원의 수를 조회하시오.
select ent_yn, count(*) from employee
group by ent_yn;




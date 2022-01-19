--select employee_id, first_name || ' ' ||  last_name "FULLNAME" , manager_id from employees;
--
--select employee_id, first_name || ' ' ||  last_name "FULLNAME" , manager_id from employees
--where manager_id=145;
--
--select employee_id, first_name || ' ' ||  last_name "FULLNAME" , manager_id from employees
--where employee_id=123;

--select e.employee_id, e.first_name || ' '|| e.last_name "Employee Name",d.department_id, d.department_name,l.location_id,l.state_province,
--l.city
--from employees e ,departments d , locations l where e.department_id =d.department_id 
--and d.location_id = l.location_id
----and e.employee_id=164
--order by e.employee_id, d.department_id asc;

SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE last_name = 'Kochhar');
-- 문제2) EMPLOYEES 테이블에서 급여의 평균보다 적은 사원의 사원번호,이름,담당업무,급여,부서번호를 출력하여라.  
select employee_id, first_name, job_id, salary
from employees
where salary < (select salary
                from employees
                where last_name = 'Kochhar');

-- 문제3) EMPLOYEES 테이블에서 100번 부서의 최소 급여보다 최소 급여가 많은 다른 모든 부서를 출력하라

select department_id
from employees
GROUP by department_id
having min(salary)>(select min(salary) from employees
                    where department_id=100);
                    
-- 문제4) 업무별로 최소 급여를 받는 사원의 정보를 사원번호,이름,업무,부서번호를 출력하여라. 
-- 단 업무별로 정렬하여라.
-- 서브쿼리 사용 이유 : 그룹으로 묶을경우 그룹컬럼과 그룹함수밖에 못쓰기 때문에.. 서브쿼리를 그룹으로 묶어주고 
-- 메인쿼리에선 모든 컬럼을 불러줄 수 있다.

select employee_id, first_name || ' ' || last_name "Ename", job_id, department_id
from employees
where (job_id, salary) IN (select job_id, min(salary) from employees group by job_id)
order by job_id;

-- 문제5) EMPLOYEES 과 DEPARTMENTS 테이블에서 업무가 SA_MAN 사원의 정보를 이름,업무,부서명,근무지를 출력하라.

select e.employee_id, e.first_name, e.job_id, d.department_id, d.department_name, l.city
from (select employee_id, job_id, department_id, first_name from employees where job_id='SA_MAN') e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
order by e.employee_id;

-- 문제6) EMPLOYEES 테이블에서 (가장 많은 사원)을 갖는 MANAGER의 사원번호를 출력하라.

select manager_id
from employees
group by manager_id
having count(manager_id) = (select max(count(*)) from employees group by manager_id);

-- 문제7) EMPLOYEES 테이블에서 (가장 많은 사원이 속해 있는 부서 번호)와 사원수를  출력하라.

select department_id, count(employee_id)
from employees
group by department_id
having count(department_id)=(select max(count(*)) from employees group by department_id); 

-- 문제8) EMPLOYEES 테이블에서 (사원번호가 123인 사원의 직업)과 같고 (사원번호가 192인 사원의 급여(SAL))보다 많은 사원의 
-- 사원번호,이름,직업,급여를 출력하라.

select employee_id, first_name, job_id, salary
from employees
where job_id = (select job_id from employees where employee_id=123)
and salary > (select salary from employees where employee_id=192);

-- 문제9)직업(JOB)별로 최소급여를 받는 사원의 정보를 사원번호,이름,업무,부서명을 출력하라.
-- 조건1 :직업별로 내림차순정렬

select e.employee_id, e.first_name, e.job_id, d.department_name
from employees e, departments d
WHERE (e.job_id, e.salary) IN (SELECT job_id, MIN(salary)
                                FROM employees
                                GROUP BY job_id)
AND e.department_id = d.department_id
ORDER BY e.job_id DESC;   

-- 문제10) EMPLOYEES 테이블에서 (50번 부서의 최소 급여)를 받는 사원보다 많은 급여를 받는 
-- 사원의 사원번호,이름,업무,입사일자,급여,부서번호를 출력하라. 
-- 단 50번은 제외

SELECT employee_id, first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MIN(salary)
                FROM employees
                WHERE department_id = 50)
AND department_id <> 50;                


-- 문제11) EMPLOYEES 테이블에서 (50번 부서의 최고 급여)를 받는 사원 보다 많은 급여를 받는 사원의 
-- 사원번호,이름,업무,입사일자,급여,부서번호를 출력하라. 
-- 단50번은 제외

SELECT  employee_id, first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MAX(salary)
                FROM employees
                WHERE department_id = 50)
AND department_id <> 50;   
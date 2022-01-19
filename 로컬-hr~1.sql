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
-- ����2) EMPLOYEES ���̺��� �޿��� ��պ��� ���� ����� �����ȣ,�̸�,������,�޿�,�μ���ȣ�� ����Ͽ���.  
select employee_id, first_name, job_id, salary
from employees
where salary < (select salary
                from employees
                where last_name = 'Kochhar');

-- ����3) EMPLOYEES ���̺��� 100�� �μ��� �ּ� �޿����� �ּ� �޿��� ���� �ٸ� ��� �μ��� ����϶�

select department_id
from employees
GROUP by department_id
having min(salary)>(select min(salary) from employees
                    where department_id=100);
                    
-- ����4) �������� �ּ� �޿��� �޴� ����� ������ �����ȣ,�̸�,����,�μ���ȣ�� ����Ͽ���. 
-- �� �������� �����Ͽ���.
-- �������� ��� ���� : �׷����� ������� �׷��÷��� �׷��Լ��ۿ� ������ ������.. ���������� �׷����� �����ְ� 
-- ������������ ��� �÷��� �ҷ��� �� �ִ�.

select employee_id, first_name || ' ' || last_name "Ename", job_id, department_id
from employees
where (job_id, salary) IN (select job_id, min(salary) from employees group by job_id)
order by job_id;

-- ����5) EMPLOYEES �� DEPARTMENTS ���̺��� ������ SA_MAN ����� ������ �̸�,����,�μ���,�ٹ����� ����϶�.

select e.employee_id, e.first_name, e.job_id, d.department_id, d.department_name, l.city
from (select employee_id, job_id, department_id, first_name from employees where job_id='SA_MAN') e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
order by e.employee_id;

-- ����6) EMPLOYEES ���̺��� (���� ���� ���)�� ���� MANAGER�� �����ȣ�� ����϶�.

select manager_id
from employees
group by manager_id
having count(manager_id) = (select max(count(*)) from employees group by manager_id);

-- ����7) EMPLOYEES ���̺��� (���� ���� ����� ���� �ִ� �μ� ��ȣ)�� �������  ����϶�.

select department_id, count(employee_id)
from employees
group by department_id
having count(department_id)=(select max(count(*)) from employees group by department_id); 

-- ����8) EMPLOYEES ���̺��� (�����ȣ�� 123�� ����� ����)�� ���� (�����ȣ�� 192�� ����� �޿�(SAL))���� ���� ����� 
-- �����ȣ,�̸�,����,�޿��� ����϶�.

select employee_id, first_name, job_id, salary
from employees
where job_id = (select job_id from employees where employee_id=123)
and salary > (select salary from employees where employee_id=192);

-- ����9)����(JOB)���� �ּұ޿��� �޴� ����� ������ �����ȣ,�̸�,����,�μ����� ����϶�.
-- ����1 :�������� ������������

select e.employee_id, e.first_name, e.job_id, d.department_name
from employees e, departments d
WHERE (e.job_id, e.salary) IN (SELECT job_id, MIN(salary)
                                FROM employees
                                GROUP BY job_id)
AND e.department_id = d.department_id
ORDER BY e.job_id DESC;   

-- ����10) EMPLOYEES ���̺��� (50�� �μ��� �ּ� �޿�)�� �޴� ������� ���� �޿��� �޴� 
-- ����� �����ȣ,�̸�,����,�Ի�����,�޿�,�μ���ȣ�� ����϶�. 
-- �� 50���� ����

SELECT employee_id, first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MIN(salary)
                FROM employees
                WHERE department_id = 50)
AND department_id <> 50;                


-- ����11) EMPLOYEES ���̺��� (50�� �μ��� �ְ� �޿�)�� �޴� ��� ���� ���� �޿��� �޴� ����� 
-- �����ȣ,�̸�,����,�Ի�����,�޿�,�μ���ȣ�� ����϶�. 
-- ��50���� ����

SELECT  employee_id, first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MAX(salary)
                FROM employees
                WHERE department_id = 50)
AND department_id <> 50;   
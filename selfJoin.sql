connect hr/hr

select employee_id, first_name || ' ' ||  last_name "FULLNAME" , manager_id from employees;

select employee_id, first_name || ' ' ||  last_name "FULLNAME" , manager_id from employees
-where manager_id=145;

select employee_id, first_name || ' ' ||  last_name "FULLNAME" , manager_id from employees
where employee_id=123;

select e.employee_id, e.first_name || ' '|| e.last_name "Employee Name",
d.department_id, d.department_name,l.location_id,l.state_province,l.city
from employees e ,departments d , locations l where e.department_id =d.department_id 
and d.location_id = l.location_id
--and e.employee_id=164
order by e.employee_id, d.department_id asc;

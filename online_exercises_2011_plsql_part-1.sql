-- Write a program to interchange the salaries of employee 120 and 122 ?
-- Other guy 
Declare
   V_salary_120   employees.salary%type;
Begin
  Select  salary into v_salary_120
  From employees where  employee_id = 120;

  Update employees set salary  = ( select salary from employees where employee_id = 122)
  Where employee_id = 120;

  Update employees set salary  =  v_salary_120  Where employee_id = 122;

  Commit;
End;

DECLARE 

TYPE emp_infor IS RECORD(
lower_salary o_salgrade.LOSAL%TYPE,  
high_salary  o_salgrade.HISAL%TYPE,                              
total_salary   O_EMP.SAL%TYPE,
number_employees NUMBER);

emp_record emp_infor;
salary_grade  o_salgrade.GRADE%TYPE:=&GRADE;

BEGIN 

SELECT LOSAL,HISAL,SUM(SAL),COUNT(empno)
INTO emp_record 
FROM O_EMP,o_salgrade
WHERE GRADE=salary_grade 
AND SAL BETWEEN LOSAL AND HISAL
GROUP BY LOSAL,HISAL;


DBMS_OUTPUT.PUT_LINE('=================================================================================================');

                                                                                                                       
DBMS_OUTPUT.PUT_LINE('Grade '|| salary_grade || ' salary is between '|| TRIM(TO_CHAR(emp_record.lower_salary,'L99999.99')) || ' and ' || TRIM(TO_CHAR(emp_record.high_salary,'L99999.99'))|| ' with total salary for '|| emp_record.number_employees  ||' employee(s) in this grade as '|| TRIM(TO_CHAR(emp_record.total_salary,'L99,999.99')));

DBMS_OUTPUT.PUT_LINE('=============================================================================================');

END;
/

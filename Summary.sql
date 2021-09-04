-- Question 1
USE bike;
SELECT ROUND(AVG(quantity))
FROM stock;

-- Question 2
USE bike;
SELECT MIN(quantity) AS quantitiy, product_name , store_id
FROM product p
JOIN stock s
ON p.product_id = s.product_id
HAVING quantity = 0
ORDER BY store_id;

-- Question 3
USE bike;
SELECT category_name, COUNT(p.category_id) AS instock
FROM category c
JOIN product p
ON c.category_id = p.category_id
JOIN stock s 
ON p.product_id = s.product_id
WHERE store_id = 2 
GROUP BY category_name
ORDER BY COUNT(p.category_id);

-- Question 4
USE employees;
SELECT COUNT(emp_no) AS "Number of employees"
FROM employees;

-- Question 5
USE employees;
SELECT dept_name , FORMAT (AVG(salary , 2)) AS 'average_salary'
FROM salaries s
JOIN employees e
ON d.emp_no = s.emp_no
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
GROUP BY dept_name
HAVING AVG(salary) < 60000;

-- Question 6
USE employees;
SELECT dept_name , COUNT(gender) AS 'Number of Females'
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN employees e
ON de. emp_no = e.emp_no
WHERE gender = 'f'
GROUP BY dept_name
ORDER BY dept_name;






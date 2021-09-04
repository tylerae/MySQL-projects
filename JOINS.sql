-- Question 1 
SELECT artfile
FROM artwork
WHERE arttype = 'impressionism';

-- Question 2
SELECT artfile
FROM artwork
WHERE artdescription in ('flowers' , 'flower');

-- Question 3 
SELECT fname , lname , artist.title
FROM artist 
INNER JOIN artwork ON artist.title = artwrok.title;

-- Question 4 
SELECT magazine.magazineName , magazine.subscriberLastName , magazine.subscriberFirstName
FROM magazine 
LEFT JOIN subscriber ON magzine.subscriberLastName = subscriber.subscriberLastName , magazine.subscriberFirstName = subscriber.subscriberFirstName;
ORDER BY magazineName decs;

-- Question 5
SELECT magazine.magazineName
FROM magazine
RIGHT JOIN subscriber ON magazine.magazineName = subscriber.subscriptions;

-- Question 6
SELECT employees.last_name , employeesfirst_name
FROM employees
LEFT JOIN dept_emp.emp_no = employees.last_name AND employees.first_name;

-- Question 7
SELECT first_name 
FROM employees 
WHERE first_name = 'Berni'
ORDER BY salary asc;




















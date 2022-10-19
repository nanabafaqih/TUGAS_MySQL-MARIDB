USE pos;
SHOW TABLES;
DESC offices;
DESC employees;
--  tugas 1 INNER JOIN  4 TABLE 
SELECT offices.addressLine1,offices.phone,offices.city AS kota, employees.firstName,employees.email,employees.jobTitle,
customers.customerName,customers.phone AS telp,customers.city,payments.paymentDate,payments.amount
FROM offices INNER JOIN employees ON employees.employeeNumber = offices.officeCode
INNER JOIN customers ON  customerNumber = employees.employeeNumber
INNER JOIN payments ON  checkNumber = customers.customerNumber

-- tugas 2 buat tabel viewnya: customer_vw
CREATE VIEW customer_vw AS SELECT offices.addressLine1,offices.phone,offices.city AS kota, employees.firstName,employees.email,employees.jobTitle,
customers.customerName,customers.phone AS telp,customers.city,payments.paymentDate,payments.amount
FROM offices INNER JOIN employees ON employees.employeeNumber = offices.officeCode
INNER JOIN customers ON  customerNumber = employees.employeeNumber
INNER JOIN payments ON  checkNumber = customers.customerNumber

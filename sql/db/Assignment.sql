use scaler_class;

-- CS: DBMS 9: Assignment
-- Q1
create table customer (
	customer_id int,
    product_key int
);

create table product (
    product_key int
);

insert into customer
values (3,7), (1, 8),(3,8),(3,7),(2,7),(2,7),(1,7);

select * from customer;

insert into product
values (7),(8);

select customer_id
from customer
group by customer_id
having count(distinct product_key) = (select count(*) from product);

-- Q2
create table Employees (
	employee_id int primary key,
    name varchar(20)
);

create table Salaries (
    employee_id int,
    salary int,
    constraint Fk_EmpId foreign key (employee_id) references Employees(employee_id)
);

ALTER TABLE Salaries
DROP FOREIGN KEY Fk_EmpId;

insert into Employees
values (104,"A"), (106, "B"), (103,"C");

insert into Salaries
values (104,7), (106, 8), (105,8);

select * from employees;
select * from salaries;

/*
Report the IDs of all the employees with missing information. The information of an employee is missing if:
The employee's name is missing, or
The employee's salary is missing.
*/


select employee_id
from employees where employee_id not in (select employee_id from salaries)
union
select employee_id
from salaries where employee_id not in (select employee_id from employees) ;

-- Q3

/*
report all the consecutive available seats in the cinema.

Return the result table ordered by seat_id in ascending order.
*/

create table cinemas (
	seat_id int primary key auto_increment,
    free bool
);

insert into cinemas (free)
values (0);

select * from cinemas;

SELECT distinct c1.seat_id
from cinemas c1
inner join cinemas c2
where (c2.seat_id = (c1.seat_id + 1) or c2.seat_id = (c1.seat_id - 1)) and c1.free = 1 and c2.free = 1;

-- Q4
/*
report all customers who never order anything.
*/


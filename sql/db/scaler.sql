create database db_scaler;
use db_scaler;

create table batches (
	batch_id int primary key auto_increment,
    name varchar(20),
    start_date date,
    end_date date,
    current_timings time
);

create table students (
	std_id int primary key auto_increment,
    name varchar(20),
    email_id varchar(30),
    phone_num char(10),
    grad_year year,
    company varchar(20),
    college varchar(30),
    dob date,
    current_batch_id int,
    constraint Fk_batchId1 foreign key (current_batch_id) references batches(batch_id)
);

create table classes (
	class_id int primary key auto_increment,
    prelecture_content blob,
    class_notes blob,
    link varchar(50),
    assignment_id int,
    howework_id int,
    status enum ('COMPLETED', 'IN PROGRESS', 'PLANNED')
);

create table instructors (
	instructor_id int primary key auto_increment,
    name varchar(20),
    email_id varchar(30),
    phone_num char(10),
    grad_year year,
    company varchar(20),
    college varchar(30),
    dob date
);

create table previous_batches (
	std_id int,
    previous_batch_id int,
    constraint Fk_stdId foreign key (std_id) references students(std_id),
    constraint Fk_batchId2 foreign key (previous_batch_id) references batches(batch_id)
);

create table batches_classes (
	batch_id int,
    class_id int,
    constraint Fk_classId1 foreign key (class_id) references classes(class_id),
    constraint Fk_batchId3 foreign key (batch_id) references batches(batch_id)
);

create table classes_instructors (
	class_id int,
    instructor_id int,
    constraint Fk_classId2 foreign key (class_id) references classes(class_id),
    constraint Fk_instructorId foreign key (instructor_id) references instructors(instructor_id)
);

create table problems (
	problem_id int primary key auto_increment,
    problem_complexity enum ('EASY', 'MEDIUM', 'HARD'),
    topic varchar(20),
    problem_statement text,
    total_score int
);

create table assignments (
	assignment_id int primary key auto_increment
);

create table homeworks (
	homework_id int primary key auto_increment
);

create table problems_assignments (
	assignment_id int,
	problem_id int,
    constraint Fk_assignmentId foreign key (assignment_id) references assignments(assignment_id),
    constraint Fk_problemId1 foreign key (problem_id) references problems(problem_id)
);

create table problems_homeworks (
	homework_id int,
	problem_id int,
    constraint Fk_homeworkId foreign key (homework_id) references homeworks(homework_id),
    constraint Fk_problemId2 foreign key (problem_id) references problems(problem_id)
);

create table students_problems (
	student_id int,
    problem_id int,
    status enum ('Not attempted', 'Attempted', 'Solved'),
    student_score int,
    solved_date date,
    constraint Fk_studentId1 foreign key (student_id) references students(std_id),
    constraint Fk_problemId3 foreign key (problem_id) references problems(problem_id)
);

create table students_classes_rating (
	student_id int,
    class_id int,
    rating int,
    feedback text,
    constraint Fk_studentId2 foreign key (student_id) references students(std_id),
	constraint Fk_classId3 foreign key (class_id) references classes(class_id)
);

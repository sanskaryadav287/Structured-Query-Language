create database class;
use class;


create  table Student1(
std_id int primary key,
std_Name varchar(50),
course_id int);

insert into Student1(std_id,std_Name,course_id) values
(1,"John",101),
(2,"Emma",102),
(3,"Raj",103),
(4,"Sara",null),
(5,"Alex",101);

select*from Student1;


create table Course(
course_id int primary key,
course_name varchar(50),
instructor_id int);

insert into course(course_id,course_name,instructor_id) values
(101,"Data Science",1),
(102,"Machine learning",2),
(103,"Database System",3),
(104,"Web Develoupment",4);

select*from course;

create table instructors(
instructor_id int primary key,
instructor_name varchar(50));

insert into instructors(instructor_id,instructor_name) values
(1,"Dr. SMith"),
(2,"Dr. Miller"),
(3,"Dr. Patel"),
(4,"Dr. Brown"),
(5,"Dr. Jones");

select*from instructors;



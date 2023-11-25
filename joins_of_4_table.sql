#data is given for the various details of the students like name, school id , hometown , email id , 
# accomplishments etc......


create database students_record;
use students_record;
create table student
(
student_Num int primary key, student_name varchar(20)
);
insert into student
values
(1, 'rajvi'),(2, 'prachi'),(3, 'harsh'),(4, 'kaushal'),(5, 'raj'),(6, 'prince');

create table marks
(school_id int primary key, 
student_num int, 
score int, status varchar(20)
);
insert into marks 
values
(1004, 1, 23, 'fail'),(1012, 2, 97, 'pass'),(1016, 7, 67, 'pass'),(1020, 3, 100, 'pass'),
(1025, 8, 73, 'pass'),(1030, 4, 88, 'pass'),(1035, 9,  13, 'fail'),(1040, 5,  16, 'fail'),
(1050, 10, 53, 'pass');


create table details
(address_city varchar(20),
email_ID varchar(20), 
school_id int, 
accomplishments varchar(50)
);
insert into details 
values
('Banglore',  'harsh@geeks.com',1020, 'ACM ICPC selected'),
('Hyderabad', 'kaushal@geeks.com',1030, 'Geek of the month'),
('Delhi',     'prachi@geeks.com',1012, 'IOI finalist'),
('Chennai',   'om@geeks.com',1111, 'Geek of the year'),
('Banglore', ' prince@geeks.com',1008, 'IMO finalist'),
('Mumbai',    'sasukeh@geeks.com',2211, 'Made a robot'),
('Ahmedabad', 'itachi@geeks.com',1172, 'Code Jam finalist'),
('Jaipur',    'kumar@geeks.com',1972, 'KVPY finalist');

create table age
(
student_age int,
hometown varchar(20)
);
insert into age (student_age,hometown) values
(23,'Banglore'),(25,'hyderabad'),(26,'jaipur'),(28,'delhi'),(30,'mumbai'),(24,'ahmedabad'),(21,'chennai');

select * from student;
select * from marks;
select * from details;
select * from age;

 #   QUESTION-1 : show the students name with their Sr. number and school id. (__INNER JOIN__)
  
select m.student_Num as Sr_No,s.student_name,m.school_id
from student s
inner join marks m on s.student_num=m.student_num
order by sr_no asc;

#   QUESTION-2 : show ALL the students name with their Sr. number and school id.(__LEFT JOIN__)

select m.student_Num as Sr_No,s.student_name,m.school_id
from student s
left join marks m on s.student_num=m.student_num
order by sr_no asc;

#  QUESTION-3 : show ALL the studetns Sr.number with their names ,school id. (__RIGHT JOIN__)

select m.student_Num as Sr_No,s.student_name,m.school_id
from student s
right join marks m on s.student_num=m.student_num
order by sr_no asc;

 #  QUESISTION:4- how the student name (TABLE-1) and marks(TABLE-2) with accomplishments (TABLE-3),
 #                Who has passed the test.(TABLE-2)
 #               (__MULTIPLE JOINS WITH OTHER CONDITIONS__)
 
 select s.student_name,m.score, status,m.school_id,d.accomplishments
from marks m inner join student s
on s.student_num= m.student_num
join details d 
on d.school_id=m.school_id 
where status = 'pass';


#  QUESTION-5 :show the accomplishment of students with their Sr_number who belongs to the city other than jaipur.
#                           (__MULTIPLE JOINS WITH OTHER CONDITIONS__)
select m.student_num as Sr_no, a.hometown,d.accomplishments
from details d join marks m on d.school_id=m.school_id
left join age a on a.hometown=d.address_city
where a.hometown != 'jaipur'
order by sr_no asc;

#   QUESTION-6 : show the student name, Sr. no and score status where ,
#   if they score more than 80 then grade-1, between 40 and 80 then grade-2 ,  below 40 then grade-3
#                            ( __MULTIPLE JOINS WITH CASE__)
select m.student_num as Sr_no, s.student_name, m.score,
case
    when m.score > 80 then 'grade-1'
    when m.score between 40 and 80 then 'grade-2'
    when m.score < 40 then 'grade-3'
end status
from student s join marks m
on s.student_num=m.student_num;

#                                      (__SELF JOIN__)

create database family;
use family;
create table family
(
member_id varchar(50),name varchar(50),age int,parent_id varchar(50)
);
insert into family
values
('f1','sachin',4,'f5'),('f2','raj',10,'f5'),('f3','prince',12,'f5'),('f4','amruta',36,' '),
('f5','anjali',40,'f6'),('f6','rohan',70,' '),('f7','jigar',6,'f4'),('f8','asha',8,'f4');
select * from family;

#  QUESTION : show the child name and age according to their parant name with parant age.

select child.name as child_name,child.age as child_age,parent.name as parent_name,parent.age as parent_age
from family child join family parent on
parent.member_id=child.parent_id;






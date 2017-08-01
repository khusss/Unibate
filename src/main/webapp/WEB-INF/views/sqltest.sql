
truncate CompetitionInfo;
truncate NoticeBoard;
truncate reply;
truncate ad_board_list;
truncate proposal;
truncate SuggestionBoard;
truncate suggest_reply;
truncate sg_likechk;
truncate fBoard;
truncate fBoard_reply;
truncate f_likechk;
truncate f_r_likechk;
truncate qna;
truncate club;
truncate club_mem;
truncate recruiting;
truncate MEMBER1;
truncate rt_opinion;
truncate rt_debate;
truncate rt_result;
truncate temp_like;
=============================================================================대회정보
show variables like ‘c%’

ALTER DATABASE javadb DEFAULT CHARACTER SET utf8

select count(opinion_num) from rt_opinion where d_num=1 and group_num = 1;

SELECT CLUB_NUM FROM MEMBER1 WHERE ID LIKE 'fdfdfdfdfd'
create table CompetitionInfo(
	info_code int AUTO_INCREMENT primary key,
	competition_date date,
	competition_url varchar(100),
	competition_name varchar(40),
	competition_local varchar(30)
)ENGINE=InnoDB DEFAULT charset=utf8;
select * from member1
select info_code from CompetitionInfo where competition_date < now()

drop table CompetitionInfo
select info_code from CompetitionInfo where competition_date < now()

delete from CompetitionInfo where info_code in (SELECT * FROM(select info_code from CompetitionInfo where competition_date < now()) a)

alter table CompetitionInfo MODIFY competition_url VARCHAR(100);

insert into CompetitionInfo(competition_date, competition_name, competition_local, competition_url) values('2017.10.15','제16회 대한민국 독서토론·논술대회','서울교육대학교','http://www.readingkorea.org/board/phtm/view.phtm?giUid=769&table=_bbs21&order=addref')

SELECT * FROM CompetitionInfo

============================================================================공지사항
create table NoticeBoard(
notice_board_num int auto_increment primary key,
notice_content varchar(1000) not null,
notice_subject varchar(100) not null,
notice_date datetime not null,
notice_hits int default 0
)ENGINE=InnoDB character set=utf8;

drop table NoticeBoard

select * from NoticeBoard



============================================================================ID분야 찬반 board


create table reply(
ad_reply_num int primary key auto_increment,
ad_board_num int not null,
id varchar(20) not null,
ad_reply varchar(500) not null,
ad_like int,
ad_dislike int,
reply_date datetime
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into reply(id, ad_board_num, ad_reply, reply_date) values('1',1,'1',now())

select * from reply

create table ad_board_list(
ad_board_num int primary key auto_increment,
ad_subject varchar(50) not null,
board_date datetime,
board_count int
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

UPDATE MEMBER1 set CLUB_NUM=(SELECT club_num FROM CLUB_MEM WHERE id LIKE 'dkssudgktpdy' )

============================================================================신고함
create table proposal(
	proposal_num int primary key auto_increment,
	proposal_flag int not null,
	proposal_subject varchar(50), 
	proposal_content varchar(500),
	id varchar(20),
	proposal_date	 date
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from proposal

============================================================================
create table SuggestionBoard(
	suggestion_board_num int primary key auto_increment,
	suggestion_content varchar(600) not null,
	suggestion_subject varchar(100) not null ,
	suggestion_date datetime,
	id varchar(40),
	suggestion_hit int
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


select * from SuggestionBoard

drop table SuggestionBoard

drop table suggest_reply

select * from suggest_reply

create table suggest_reply(
	suggestion_board_num int,
	sg_reply_num int primary key auto_increment,
	sg_reply varchar(500),
	sg_like int default 0,
	sg_dislike int default 0,
	sg_reply_date datetime,
	id varchar(50)
);
create table sg_likechk(
	suggestion_board_num int,
	sg_reply_num int,
	id varchar(50)
);

=====================================================================================
create table fBoard(
	fboard_num int primary key auto_increment,
	fboard_content varchar(600) not null,
	fboard_subject varchar(100) not null ,
	fboard_date datetime,
	id varchar(40),
	fboard_hit int,
	URLdata varchar(50),
	f_like int default 0,
	f_dislike int default 0
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from fboard

drop table fBoard_reply

create table fboard_reply(
	fboard_num int,
	f_reply_num int primary key auto_increment,
	f_reply varchar(500),
	id varchar(50),
	f_like int default 0,
	f_dislike int default 0,
	f_reply_date datetime
);

select * from fboard_reply

create table f_likechk(
	fboard_num int,
	id varchar(50)
);

create table f_r_likechk(
	fboard_num int,
	f_reply_num int,
	id varchar(50)
);

drop table f_r_likechk


select * from f_r_likechk
====================================================================================Q&A

create table qna(
	qna_num int auto_increment primary key,	
	qna_content varchar(700) not null,
	qna_subject varchar(100) not null,
	qna_date datetime,
	id varchar(40)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table qna

----------------------------------------------------------------------------------------동아리
SELECT * FROM CLUB
create table club(
	club_num int auto_increment primary key,
	club_name varchar(40) not null,
	club_make_date datetime,
	club_introduce_text varchar(500) not null,
	id varchar(50) not null,
	club_img varchar(40),
	club_mem int default 1
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT COUNT(*) FROM club WHERE CLUB_NUM > 1 AND id LIKE ''

SELECT COUNT(*) FROM CLUB_MEM GROUP BY club_num HAVING club_num=1

select a.club_name, sum(b.score) as score,( @rank := @rank + 1 ) AS rank from club as a join MEMBER1 as b 
on a.club_num=b.club_num,( SELECT @rank := 0 ) AS c group by a.club_name order by sum(b.score) DESC limit 0,9

insert into club(club_name,club_introduce_text,id,club_mem,club_make_date) values('가입클럽 없음','냉무','admin',0,now())

SELECT * from MEMBER1 where club_num=2

select * from club

drop table club

delete from club where club_num=1;

drop table club_mem

UPDATE CLUB SET club_mem=1 where club_name='f'


select * from club_mem

UPDATE CLUB SET club_mem=club_mem+1 where club_name ='1'
delete from club where club_name = 'fdfd'
delete from club_mem where id='bergkamp10'

insert into club_mem values('ff',3,'iddd',1)
create table club_mem(
	club_flag int,
	id varchar(50),
	club_num int
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



select *  from (SELECT m.id, m.name, c.club_flag, m.club_num from MEMBER1 as M INNER JOIN CLUB_mem as c where m.id=c.id order by club_num) as d where d.club_num=1;

=========================================================================

create table recruiting(
recruit_board_num int auto_increment primary key,
recruit_content varchar(1000) not null,
recruit_subject varchar(100) not null,
recruit_date datetime not null,
recruit_hits int not null,
id varchar(40),
img varchar(50)
)ENGINE=InnoDB character set=utf8;

select * from recruiting

SELECT * FROM recruiting ORDER BY recruit_board_num DESC LIMIT 0 ,15

drop table recruiting

=======================================================================

DELETe FROM MEMBER1 WHERE id='aaaaaaaaaa'

select * from member1

DELETE FROM MEMBER1 WHERE ID='dhtkakqlrfkeps'

create table MEMBER1(
id varchar(15), 
pwd varchar(15) not null,
name varchar(10) not null,
gender char(1) not null,
area varchar(15) not null,
school varchar(20) not null,
major varchar(20) not null,
email varchar(20) not null,
score int default 0,
club_num int default 0,
primary key(ID)
)
drop table member1

desc member1
UPDATE MEMBER1 set CLUB_NUM=

SELECT * FROM MEMBER1
insert into club(club_name,club_num,club_introduce_text,id) values('없음', 0,'0','admin')

delete from club where club_num=2;

SELECT CLUB_NU

SELECT id, name, gender, school, school, c.club_name from MEMBER1 as m INNER JOIN club c
WHERE c.club_num=m.club_num;

UPDATE MEMBER1 set CLUB_NUM=(SELECT club_num FROM CLUB_MEM WHERE id LIKE 'qksrkqtmqslek' ) where id ='qksrkqtmqslek'

drop table MEMBER1

select * from member1
===============================================================================================================

insert into reply values(2,2,'bb','hello hello',100,50,now());
insert into reply values(2,'bb','hello hello',100,50,now());
insert into reply values(3,'cc','����',300,40,now());
insert into reply values(3,'cc','����',70,150,now());
insert into reply values(3,'cc','��������',500,250,now());
commit

insert into reply(ad_board_num,id,ad_reply) values(3,'aa','��������');
select * from reply;


update reply set ad_like = ad_like+1 where id = 'bb' and ad_reply_num = 1;

drop table reply;

create table reply(
ad_reply_num int primary key auto_increment,
ad_board_num int not null,
board_group_num int not null,
id varchar(20) not null,
ad_reply varchar(500) not null,
ad_like int,
ad_dislike int,
reply_date datetime
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO reply (ad_reply_num,ad_board_num,id,ad_reply,board_group_num) values(1,1,'bb','sdf',11);
select * from reply;
create sequence 


select * from reply where ad_reply like "%ds%";


	
create table ad_board_list(
ad_board_num int primary key auto_increment,
array_num int not null,
board_group_num int not null,
ad_subject varchar(50) not null,
board_img varchar(100),
board_content varchar(2000),
board_date datetime,
board_count int)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table ad_board_list;

insert into ad_board_list values(1,1,11,"인공지능에 대해서","이미지","인공지능이란 블라브라브라브랍르브라바라",now(),0);
insert into ad_board_list values(2,2,11,"하둡이란","이미지","두두두두두둗두ㅜ두두두두",now(),0);
insert into ad_board_list values(3,1,12,"정치란","이미지","정투더치",now(),0);


select * from ad_board_list;

insert into ad_board_list values(4,1,21,"독서 it","이미지","아이티 독서",now(),0);



create table mem(
id varchar(100) not null,
name varchar(100) not null,
id_num int primary key,
password varchar(100) not null,
email_address varchar(100) not null,
score int,
club_num int)ENGINE=InnoDB DEFAULT CHARSET=euckr;



create table club(
club_num int primary key,
club_name varchar(100) not null,
club_introduce_text varchar(1000),
club_img varchar(200))ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into club values(1,'활빈당','토론동아리 입니다.','이미지');
insert into club values(2,'블랙','토론동아리.','이미지');
insert into club values(3,'kkk','토론동아리.','이미지');
drop table club;

create table club_mem(
club_num int,
id varchar(50),
club_flag int
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from mem where club_num=2;
insert into club_mem values(1,'aaa',1);
insert into club_mem values(1,'bbb',2);
insert into club_mem values(1,'ccc',2);
insert into club_mem values(1,'adk',2);
insert into club_mem values(2,'ccc',1);


select a.id,a.name from mem as a join club_mem as b on a.club_num = b.club_num where b.club_flag =1 and b.club_num = 1 group by b.club_num;

select a.club_name,sum(b.score) as score,( @rank := @rank + 1 ) AS rank from club as a join mem as b on a.club_num=b.club_num,( SELECT @rank := 0 ) AS c group by a.club_name order by sum(b.score) DESC;

SELECT id, score,name,( @rank := @rank + 1 ) AS rank FROM mem AS a, ( SELECT @rank := 0 ) AS b ORDER BY a.score DESC;


SELECT * from mem order by score DESC;
insert into mem values('aaa','홍홍홍',1,'123','qqq',0,1);
insert into mem values('bbb','카카카',2,'123','qqq',100,1);
insert into mem values('ccc','차차차차',3,'123','qqq',500,1);


insert into mem values('adk','sdfsd',4,'123','qqq',300,1);
insert into mem values('dfkfk','dfkld',5,'123','qqq',100,1);
insert into mem values('www','www',6,'123','qqq',1,1);
insert into mem values('zzzz','zz차차차',7,'123','qqq',1500,1);
insert into mem values('kkk','kkk',8,'123','qqq',2200,1);
insert into mem values('g','h',9,'123','qqq',6500,1);
insert into mem values('sa','차차차차',10,'123','qqq',500,1);
insert into mem values('ccc','차차차차',11,'123','qqq',500,1);
insert into mem values('ccc','차차차차',12,'123','qqq',500,2);
insert into mem values('ccc','차차차차',13,'123','qqq',500,2);
insert into mem values('ccc','차차차차',14,'123','qqq',500,2);
insert into mem values('ccc','차차차차',15,'123','qqq',500,3);
insert into mem values('ccc','차차차차',16,'123','qqq',500,3);
)


SELECT id, score,name,( @rank := @rank + 1 ) AS rank FROM mem AS a, ( SELECT @rank := 0 ) AS b ORDER BY a.score DESC;
select * from reply;  
SELECT * from (SELECT id, score,name, ( @rank := @rank + 1 ) AS rank FROM mem AS a, ( SELECT @rank := 0 ) AS b ORDER BY a.score DESC) as c where c.id like 'aaa';    
SELECT * from (select a.club_name,sum(b.score) as score,( @rank := @rank + 1 ) AS rank from club as a join mem as b on a.club_num=b.club_num,( SELECT @rank := 0 ) AS c group by a.club_name order by sum(b.score) DESC) as d where d.club_name like '블랙'; 
SELECT * from (select a.club_name,sum(b.score) as score,( @rank := @rank + 1 ) AS rank,a.club_num from club as a join mem as b on a.club_num=b.club_num,( SELECT @rank := 0 ) AS c group by a.club_name order by sum(b.score) DESC) as d where d.club_num=1;
select * from ad_board_list;
select club_num from mem where id='g';
select * from mem;
SELECT id, score,name, ( @rank := @rank + 1 ) AS rank FROM mem AS a, ( SELECT @rank := 0 ) AS b ORDER BY a.score DESC limit 0,9;

select club_num from mem where id='kkk';

SELECT id,score,( @rank := @rank + 1 ) AS rank  FROM mem AS a, ( SELECT @rank := 0 ) AS b order by score DESC;
SELECT score,rank from (SELECT id,score,( @rank := @rank + 1 ) AS rank  FROM mem AS a, ( SELECT @rank := 0 ) AS b order by score DESC) as c where id ='kkk';

select * from club;

select count(*) from mem where club_num = 2;

select id,name from mem where club_num=2;
SELECT id,name from mem where club_num=1;

select id,name from mem 

============================================================실시간 토론
	
create table rt_opinion(
group_num int,
opinion_num int,
d_num int,
id varchar(50),
d_opinion varchar(1000),
opinion_date datetime)ENGINE=InnoDB DEFAULT CHARSET=utf8;

select * from rt_opinion

insert into rt_opinion values(1,0,1,'g','나는 찬성이다!!!',now());
insert into rt_opinion values(2,0,1,'kkk','나는 반대이다!!!',now());
insert into rt_opinion values(3,0,1,'ccc','나는 모르겠이다!!!',now());



create table rt_debate(
d_num int primary key auto_increment,
d_subject varchar(500),
d_content varchar(1000),
d_date datetime)ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT MAX(d_num) FROM rt_debate;

drop table rt_debate;

select * from rt_debate;

insert into rt_debate(d_subject, d_content, d_date) values ('사드배치에 대한 당신의 생각은?!!?!?','http://www.fnnews.com/news/201707211140361315',now())



============================================================실시간 토론
===================실시간 토론 댓글
create table rt_opinion(
group_num int,
opinion_num int default 0,
d_num int,
id varchar(50),
d_opinion varchar(1000),
opinion_date datetime)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table rt_opinion

insert into rt_opinion values(1,0,1,'dkssudgktpdy','안녕', now())


=======================실시간 토론 주제
create table rt_debate(
d_num int primary key,
d_subject varchar(500),
d_content varchar(1000),
d_date datetime)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table rt_result
========================실시간 토론 결과 저장
create table rt_result(
d_num int primary key,
d_subject varchar(500) not null,
best_mem varchar(50),
agree_score int,				
disagree_score int,
start_date datetime,
end_date datetime)ENGINE=InnoDB DEFAULT CHARSET=utf8;

========================하루에 한번 좋아요 가능하게
create table temp_like(
id varchar(50) not null,
tmp_date datetime
)
select * from temp_like


======================================

create table tmp_best(
d_num int,
best_month varchar(10),
best_year varchar(10))ENGINE=InnoDB DEFAULT CHARSET=utf8;

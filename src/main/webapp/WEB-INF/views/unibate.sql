use '여기에디비 이름을 넣어줘요!';

create table CompetitionInfo(
	info_code int AUTO_INCREMENT primary key,
	competition_date date,
	competition_url varchar(100),
	competition_name varchar(40),
	competition_local varchar(30)
)ENGINE=InnoDB DEFAULT charset=utf8;

create table NoticeBoard(
notice_board_num int auto_increment primary key,
notice_content varchar(1000) not null,
notice_subject varchar(100) not null,
notice_date datetime not null,
notice_hits int default 0
)ENGINE=InnoDB character set=utf8;


create table proposal(
	proposal_num int primary key auto_increment,
	proposal_flag int not null,
	proposal_subject varchar(50), 
	proposal_content varchar(500),
	id varchar(20),
	proposal_date	 date
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table SuggestionBoard(
	suggestion_board_num int primary key auto_increment,
	suggestion_content varchar(600) not null,
	suggestion_subject varchar(100) not null ,
	suggestion_date datetime,
	id varchar(40),
	suggestion_hit int
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

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


create table fboard_reply(
	fboard_num int,
	f_reply_num int primary key auto_increment,
	f_reply varchar(500),
	id varchar(50),
	f_like int default 0,
	f_dislike int default 0,
	f_reply_date datetime
);

create table f_likechk(
	fboard_num int,
	id varchar(50)
);

create table f_r_likechk(
	fboard_num int,
	f_reply_num int,
	id varchar(50)
);

create table qna(
	qna_num int auto_increment primary key,	
	qna_content varchar(700) not null,
	qna_subject varchar(100) not null,
	qna_date datetime,
	id varchar(40)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table club(
	club_num int auto_increment primary key,
	club_name varchar(40) not null,
	club_make_date datetime,
	club_introduce_text varchar(500) not null,
	id varchar(50) not null,
	club_img varchar(40),
	club_mem int default 1
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table club_mem(
	club_flag int,
	id varchar(50),
	club_num int
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table recruiting(
recruit_board_num int auto_increment primary key,
recruit_content varchar(1000) not null,
recruit_subject varchar(100) not null,
recruit_date datetime not null,
recruit_hits int not null,
id varchar(40),
img varchar(50)
)ENGINE=InnoDB character set=utf8;

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
)ENGINE=InnoDB character set=utf8;

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

create table ad_board_list(
ad_board_num int primary key auto_increment,
array_num int not null,
board_group_num int not null,
ad_subject varchar(50) not null,
board_img varchar(100),
board_content varchar(2000),
board_date datetime,
board_count int)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table rt_debate(
d_num int primary key auto_increment,
d_subject varchar(500),
d_content varchar(1000),
d_date datetime)ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table rt_debate
create table rt_opinion(
group_num int,
opinion_num int default 0,
d_num int,
id varchar(50),
d_opinion varchar(1000),
opinion_date datetime)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table rt_result(
d_num int primary key,
d_subject varchar(500) not null,
best_mem varchar(50),
agree_score int,				
disagree_score int,
start_date datetime,
end_date datetime)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table temp_like(
id varchar(50) not null,
tmp_date datetime
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table tmp_best(
d_num int,
best_month varchar(10),
best_year varchar(10))ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table sc_info(
sc_num int primary key,
sc_class varchar(10),
sc_class2 varchar(10),
sc_place varchar(10),
sc_code varchar(10),
sc_name varchar(20),
major_code int,
major_name varchar(10),
major_class varchar(10),
major_class2 varchar(15),
major_class3 varchar(15),
class varchar(10))ENGINE=InnoDB DEFAULT CHARSET=utf8;
drop table sc_info
select * from sc_info

create table sc_info(
sc_num int primary key,
sc_name varchar(10),
sc_place varchar(10)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into sc_info values(1,'인하대','인천')
insert into sc_info values(2,'서울대','서울')
insert into sc_info values(3,'서울여대','서울')
insert into sc_info values(4,'inha','incheon')

## csv -> mysql 한글 깨짐..
LOAD DATA local INFILE "C:\\Users\\Administrator\\Desktop\\Unibate\\data\\school_data3.csv" 
INTO TABLE javadb.sc_info FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"' ;

select * from sc_info
SELECT sc_name from sc_info where sc_name like CONCAT('%',#{sc_name},'%');

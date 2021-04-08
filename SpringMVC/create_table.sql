/****************************************************************
+ 게시판 그룹 테이블
****************************************************************/
DROP TABLE IF EXISTS $table[board_group];
CREATE TABLE $table[board_group] (
bgr_idx					INT(11) NOT NULL AUTO_INCREMENT,
bgr_name					VARCHAR(30) NOT NULL,
bgr_title					VARCHAR(50) NOT NULL,
bgr_code					VARCHAR(16) NOT NULL,
bgr_regdate 				VARCHAR(10) NOT NULL,
PRIMARY KEY (bgr_idx)
);

/****************************************************************
+ 게시판 카테고리 테이블
****************************************************************/
DROP TABLE IF EXISTS $table[board_category];
CREATE TABLE $table[board_category] (
bca_idx					INT(4) NOT NULL AUTO_INCREMENT,
bco_idx					VARCHAR(50) NOT NULL,
bca_name 					VARCHAR(20) NOT NULL,
bca_total					INT(11) NOT NULL,
bca_order					INT(11) NOT NULL,
bca_depth 					INT(2) NOT NULL,
bca_sortno					INT(2) NOT NULL,      
bca_regdate 				VARCHAR(10) NOT NULL,
PRIMARY KEY (bca_idx)
);

/****************************************************************
+ 게시판 환경설정 테이블
****************************************************************/
DROP TABLE IF EXISTS $table[board_config];
CREATE TABLE $table[board_config] (
bco_idx					INT(11) NOT NULL AUTO_INCREMENT,
bgr_idx					VARCHAR(255) NOT NULL,
bco_id					VARCHAR(50) NOT NULL,
bco_name					VARCHAR(50) NOT NULL DEFAULT '',
bco_title					VARCHAR(100) NOT NULL,
bco_m_type				VARCHAR(30) NOT NULL,
bco_type					VARCHAR(10) NOT NULL,
bco_skin					VARCHAR(255) NOT NULL,
bco_tbalign					VARCHAR(30) NOT NULL,
bco_tbwidth				VARCHAR(30) NOT NULL,
bco_head_file				VARCHAR(200) NOT NULL,
bco_head_text				TEXT NOT NULL,
bco_foot_file				VARCHAR(200) NOT NULL,
bco_foot_text				TEXT NOT NULL,
bco_use_secret				INT(1) NOT NULL DEFAULT '0',
bco_use_category			INT(1) NOT NULL DEFAULT '0',
bco_use_good				INT(1) NOT NULL DEFAULT '0',
bco_use_comment			INT(1) NOT NULL DEFAULT '0',
bco_use_nickname			INT(1) NOT NULL DEFAULT '0',
bco_use_accusation			INT(1) NOT NULL DEFAULT '0',
bco_use_state				INT(1) NOT NULL DEFAULT '0',
bco_use_restate				INT(1) NOT NULL DEFAULT '0',
bco_use_approval			INT(1) NOT NULL DEFAULT '0',
bco_use_point				INT(1) NOT NULL DEFAULT '0',
bco_filterword				TEXT NOT NULL,
bco_intercept_ip				TEXT NOT NULL,

bco_use_gallery				INT(11) NOT NULL DEFAULT '0',
bco_gallery_cols				INT(11) NOT NULL DEFAULT '0',
bco_gallery_rows				INT(11) NOT NULL DEFAULT '0',
bco_gallery_w_size			INT(11) NOT NULL DEFAULT '0',
bco_gallery_h_size			INT(11) NOT NULL DEFAULT '0',
bco_subject_len				INT(11) NOT NULL DEFAULT '0',
bco_content_len				INT(11) NOT NULL DEFAULT '0',
bco_name_len				INT(11) NOT NULL DEFAULT '0',
bco_use_mouse_over			INT(1) NOT NULL DEFAULT '0',
bco_use_view_cate			INT(1) NOT NULL DEFAULT '0',
bco_use_view_file			INT(1) NOT NULL DEFAULT '0',
bco_use_view_down			INT(1) NOT NULL DEFAULT '0',
bco_use_view_up			INT(1) NOT NULL DEFAULT '0',
bco_use_view_see			INT(1) NOT NULL DEFAULT '0',
bco_new_icon				INT(11) NOT NULL DEFAULT '0',
bco_cool_icon				INT(11) NOT NULL DEFAULT '0',
bco_use_multi_read			INT(1) NOT NULL DEFAULT '0',
bco_list_date_type			VARCHAR(30) NOT NULL,
bco_use_preview				INT(1) NOT NULL DEFAULT '0',
bco_preview_len				INT(11) NOT NULL DEFAULT '0',
bco_preview_width			INT(11) NOT NULL DEFAULT '0',
bco_list_writer_click			INT(1) NOT NULL DEFAULT '0',
bco_list_content_click			INT(1) NOT NULL DEFAULT '0',
bco_list_content_pop_width		INT(11) NOT NULL DEFAULT '0',
bco_list_content_pop_height		INT(11) NOT NULL DEFAULT '0',
bco_page_size				INT(11) NOT NULL DEFAULT '0',
bco_page_scale				INT(11) NOT NULL DEFAULT '0',
bco_use_search				INT(1) NOT NULL DEFAULT '0',

bco_view_writer_click			INT(1)  NOT NULL DEFAULT '0',
bco_image_width_size			INT(11) NOT NULL DEFAULT '0',
bco_image_height_size			INT(11) NOT NULL DEFAULT '0',
bco_image_facsimile			INT(1) NOT NULL DEFAULT '0',
bco_use_see				INT(1) NOT NULL DEFAULT '0',
bco_use_criticism_ip			INT(1) NOT NULL DEFAULT '0',
bco_use_comment_ip			INT(1) NOT NULL DEFAULT '0',
bco_criticism_date_type			VARCHAR(10) NOT NULL default '',
bco_comment_date_type		VARCHAR(10) NOT NULL default '',
bco_use_link				INT(1) NOT NULL DEFAULT '0',
bco_use_pre_next				INT(1) NOT NULL DEFAULT '0',
bco_use_reply_list				INT(1) NOT NULL DEFAULT '0',
bco_use_list					INT(1) NOT NULL DEFAULT '0',

bco_default_content			VARCHAR(255) NOT NULL,
bco_use_link1				INT(1) NOT NULL DEFAULT '0',
bco_use_link2				INT(1) NOT NULL DEFAULT '0',
bco_use_editer				INT(1) NOT NULL DEFAULT '0',
bco_use_fild				INT(1) NOT NULL DEFAULT '0',
bco_use_upload				INT(1) NOT NULL DEFAULT '0',
bco_upload_num				INT(11) NOT NULL DEFAULT '0',
bco_upload_size				INT(11) NOT NULL DEFAULT '0',
bco_upload_list				VARCHAR(255) NOT NULL,
bco_use_upload_memo			INT(11) NOT NULL DEFAULT '0',

bco_read_level				INT(11) NOT NULL DEFAULT '0',
bco_write_level				INT(11) NOT NULL DEFAULT '0',
bco_reply_level				INT(11) NOT NULL DEFAULT '0',
bco_comment_r_level			INT(11) NOT NULL DEFAULT '0',
bco_comment_w_level			INT(11) NOT NULL DEFAULT '0',
bco_upload_level				INT(11) NOT NULL DEFAULT '0',
bco_download_level			INT(11) NOT NULL DEFAULT '0',
bco_html_level				INT(11) NOT NULL DEFAULT '0',
bco_link_level				INT(11) NOT NULL DEFAULT '0',
bco_read_point				INT(11) NOT NULL DEFAULT '0',
bco_write_point				INT(11) NOT NULL DEFAULT '0',
bco_reply_point				INT(11) NOT NULL DEFAULT '0',
bco_comment_point			INT(11) NOT NULL DEFAULT '0',
bco_upload_point			INT(11) NOT NULL DEFAULT '0',
bco_download_point			INT(11) NOT NULL DEFAULT '0',
bco_datetime				VARCHAR(10) NOT NULL default '',
PRIMARY KEY(bco_idx)
);

/****************************************************************
+ 회원 환경설정 테이블
****************************************************************/
DROP TABLE IF EXISTS $table[member_config];
CREATE TABLE $table[member_config] (
mco_idx					INT(11) NOT NULL AUTO_INCREMENT,
mco_title					VARCHAR(30) NOT NULL,
mco_use_agreement			INT(1) NOT NULL DEFAULT '0',
mco_use_agreement_comment	TEXT NOT NULL,
mco_skin					VARCHAR(255) NOT NULL,
mco_tbalign				VARCHAR(30) NOT NULL,
mco_tbwidth				VARCHAR(30) NOT NULL,
mco_head_file				VARCHAR(200) NOT NULL,
mco_head_text				TEXT NOT NULL,
mco_foot_file				VARCHAR(200) NOT NULL,
mco_foot_text				TEXT NOT NULL,
mco_join_result				INT(1) NOT NULL DEFAULT '0',
mco_email_confirm			INT(1) NOT NULL DEFAULT '0',
mco_email_subject			VARCHAR(50) NOT NULL,
mco_email_content			TEXT NOT NULL,
mco_default_point			INT(11) NOT NULL DEFAULT '0',
mco_recom_point				INT(11) NOT NULL DEFAULT '0',
mco_email_finish				INT(1) NOT NULL DEFAULT '0',

mco_use_id					INT(1) NOT NULL DEFAULT '0',
mco_use_pass				INT(1) NOT NULL DEFAULT '0',
mco_use_pass_ask			INT(1) NOT NULL DEFAULT '0',
mco_use_name				INT(1) NOT NULL DEFAULT '0',
mco_use_nickname			INT(1) NOT NULL DEFAULT '0',
mco_use_jumin				INT(1) NOT NULL DEFAULT '0',
mco_use_email				INT(1) NOT NULL DEFAULT '0',
mco_use_homepage			INT(1) NOT NULL DEFAULT '0',
mco_use_address				INT(1) NOT NULL DEFAULT '0',
mco_use_phone				INT(1) NOT NULL DEFAULT '0',
mco_use_hphone				INT(1) NOT NULL DEFAULT '0',
mco_use_job				INT(1) NOT NULL DEFAULT '0',
mco_use_photo				INT(1) NOT NULL DEFAULT '0',
mco_use_message			INT(1) NOT NULL DEFAULT '0',
mco_use_etc				INT(1) NOT NULL DEFAULT '0',
mco_use_mail_check			INT(1) NOT NULL DEFAULT '0',
mco_use_com_name			INT(1) NOT NULL DEFAULT '0',
mco_use_com_homepage		INT(1) NOT NULL DEFAULT '0',
mco_use_com_station			INT(1) NOT NULL DEFAULT '0',
mco_use_com_position			INT(1) NOT NULL DEFAULT '0',
mco_use_com_address			INT(1) NOT NULL DEFAULT '0',
mco_use_com_phone			INT(1) NOT NULL DEFAULT '0',
mco_use_com_fax				INT(1) NOT NULL DEFAULT '0',

mco_mem_frm1				VARCHAR(255) NOT NULL,
mco_mem_frm2				VARCHAR(255) NOT NULL,
mco_mem_frm3				VARCHAR(255) NOT NULL,
mco_mem_frm4				VARCHAR(255) NOT NULL,
mco_mem_frm5				VARCHAR(255) NOT NULL,
mco_mem_frm6				VARCHAR(255) NOT NULL,
mco_mem_frm7				VARCHAR(255) NOT NULL,
mco_mem_frm8				VARCHAR(255) NOT NULL,
mco_mem_frm9				VARCHAR(255) NOT NULL,
mco_mem_frm10				VARCHAR(255) NOT NULL,
mco_mem_use_frm1			INT(1) NOT NULL,
mco_mem_use_frm2			INT(1) NOT NULL,
mco_mem_use_frm3			INT(1) NOT NULL,
mco_mem_use_frm4			INT(1) NOT NULL,
mco_mem_use_frm5			INT(1) NOT NULL,
mco_mem_use_frm6			INT(1) NOT NULL,
mco_mem_use_frm7			INT(1) NOT NULL,
mco_mem_use_frm8			INT(1) NOT NULL,
mco_mem_use_frm9			INT(1) NOT NULL,
mco_mem_use_frm10			INT(1) NOT NULL,
PRIMARY KEY(mco_idx)
);


/****************************************************************
+ 회원테이블
****************************************************************/
DROP TABLE IF EXISTS $table[member];
CREATE TABLE $table[member] (
m_idx						INT(11) NOT NULL AUTO_INCREMENT,
bgr_idx					VARCHAR(30) NOT NULL,
m_user_id					VARCHAR(10) NOT NULL,
m_pass 					VARCHAR(50) NOT NULL,
m_pass_ask					VARCHAR(100) NOT NULL,
m_pass_account 				VARCHAR(50) NOT NULL,
m_name					VARCHAR(32) NOT NULL,
m_n_name					VARCHAR(32) NOT NULL,
m_jumin1					VARCHAR(20) NOT NULL,
m_jumin2 					VARCHAR(50) NOT NULL,
m_email 					VARCHAR(50) NOT NULL,
m_homepage 				VARCHAR(50) NOT NULL,
m_zipcode					VARCHAR(20) NOT NULL,
m_address1					VARCHAR(100) NOT NULL,
m_address2					VARCHAR(100) NOT NULL,
m_phone					VARCHAR(20) NOT NULL,
m_hphone					VARCHAR(20) NOT NULL,
m_job					VARCHAR(30) NOT NULL,
m_attach 					VARCHAR(50) NOT NULL,
m_message					TEXT NOT NULL,
m_etc						VARCHAR(100) NOT NULL,
m_mail_check				INT(1) NOT NULL DEFAULT '0',

m_com_name 				VARCHAR(50) NOT NULL,
m_com_homepage 			VARCHAR(50) NOT NULL,
m_com_station 				VARCHAR(50) NOT NULL,
m_com_position 				VARCHAR(50) NOT NULL,
m_com_zipcode				VARCHAR(20) NOT NULL,
m_com_address1				VARCHAR(100) NOT NULL,
m_com_address2				VARCHAR(100) NOT NULL,
m_com_phone				VARCHAR(20) NOT NULL,
m_com_fax					VARCHAR(20) NOT NULL,

m_level					INT(11) NOT NULL DEFAULT '0',
m_point					INT(11) NOT NULL DEFAULT '0',
m_approval					INT(1) NOT NULL DEFAULT '2',
m_join_date				VARCHAR(10) NOT NULL DEFAULT '',
m_login_last				VARCHAR(10) NOT NULL DEFAULT '',
m_login_cnt				INT(11) NOT NULL DEFAULT '0',
m_login_ip					VARCHAR(32) NOT NULL DEFAULT '0',
m_user_leave				INT(2) NOT NULL DEFAULT '0',

m_add_frm1				VARCHAR(100) NOT NULL,
m_add_frm2				VARCHAR(100) NOT NULL,
m_add_frm3				VARCHAR(100) NOT NULL,
m_add_frm4				VARCHAR(100) NOT NULL,
m_add_frm5				VARCHAR(100) NOT NULL,
m_add_frm6				VARCHAR(100) NOT NULL,
m_add_frm7				VARCHAR(100) NOT NULL,
m_add_frm8				VARCHAR(100) NOT NULL,
m_add_frm9				VARCHAR(100) NOT NULL,
m_add_frm10				VARCHAR(100) NOT NULL,
PRIMARY KEY(m_idx)
);


/****************************************************************
+ 배너 그룹 테이블
****************************************************************/
DROP TABLE IF EXISTS $table[banner_group];
CREATE TABLE $table[banner_group] (
bng_idx					INT(11) NOT NULL AUTO_INCREMENT,
bng_name					VARCHAR(100) NOT NULL,
PRIMARY KEY (bng_idx)
);

/****************************************************************
+ 배너 테이블
****************************************************************/
DROP TABLE IF EXISTS $table[banner];
CREATE TABLE $table[banner] (
bn_idx					INT(11) NOT NULL AUTO_INCREMENT,
bn_start_date				VARCHAR(10) NOT NULL,
bn_end_date				VARCHAR(10) NOT NULL,
bng_name					VARCHAR(30) NOT NULL,	
bn_title					VARCHAR(30) NOT NULL,	
bn_url					VARCHAR(30) NOT NULL,	
bn_target					VARCHAR(30) NOT NULL,		
bn_device					VARCHAR(30) NOT NULL,	
bn_width					INT(11) NOT NULL DEFAULT '0',	
bn_height					INT(11) NOT NULL DEFAULT '0',	
bn_hit					INT(11) NOT NULL DEFAULT '0',
bn_order					INT(11) NOT NULL DEFAULT '0',
bn_image					VARCHAR(30) NOT NULL,	
bn_activated				VARCHAR(10) NOT NULL,
bn_ip						VARCHAR(30) NOT NULL,
bn_regdate 				VARCHAR(10) NOT NULL,
m_idx					INT(11),	
PRIMARY KEY (bn_idx)
);

/****************************************************************
+ 메일폼설정테이블
****************************************************************/
DROP TABLE IF EXISTS $table[sendmail_config];
CREATE TABLE $table[sendmail_config] (
sco_idx					INT(11) NOT NULL AUTO_INCREMENT,
sco_title					VARCHAR(30) NOT NULL,
sco_content 				VARCHAR(50) NOT NULL,
sco_code					VARCHAR(16) NOT NULL,
PRIMARY KEY (sco_idx)
);

/****************************************************************
+ 메일테이블
****************************************************************/
DROP TABLE IF EXISTS $table[sendmail];
CREATE TABLE $table[sendmail] (
no						INT(11) NOT NULL AUTO_INCREMENT,
g_name					VARCHAR(30) NOT NULL,
g_title 					VARCHAR(50) NOT NULL,
g_code					VARCHAR(16) NOT NULL,
PRIMARY KEY (no)
);

/****************************************************************
+ 접속통계
****************************************************************/
DROP TABLE IF EXISTS $table[mlog];
CREATE TABLE $table[mlog] (
no INT(11) NOT NULL AUTO_INCREMENT,
year INT(4) unsigned NOT NULL DEFAULT '0',
month INT(2) unsigned NOT NULL DEFAULT '0',
day INT(2) unsigned NOT NULL DEFAULT '0',
reg_date varchar(10) NOT NULL,
h0 INT(11) NOT NULL DEFAULT '0',
h1 INT(11) NOT NULL DEFAULT '0',
h2 INT(11) NOT NULL DEFAULT '0',
h3 INT(11) NOT NULL DEFAULT '0',
h4 INT(11) NOT NULL DEFAULT '0',
h5 INT(11) NOT NULL DEFAULT '0',
h6 INT(11) NOT NULL DEFAULT '0',
h7 INT(11) NOT NULL DEFAULT '0',
h8 INT(11) NOT NULL DEFAULT '0',
h9 INT(11) NOT NULL DEFAULT '0',
h10 INT(11) NOT NULL DEFAULT '0',
h11 INT(11) NOT NULL DEFAULT '0',
h12 INT(11) NOT NULL DEFAULT '0',
h13 INT(11) NOT NULL DEFAULT '0',
h14 INT(11) NOT NULL DEFAULT '0',
h15 INT(11) NOT NULL DEFAULT '0',
h16 INT(11) NOT NULL DEFAULT '0',
h17 INT(11) NOT NULL DEFAULT '0',
h18 INT(11) NOT NULL DEFAULT '0',
h19 INT(11) NOT NULL DEFAULT '0',
h20 INT(11) NOT NULL DEFAULT '0',
h21 INT(11) NOT NULL DEFAULT '0',
h22 INT(11) NOT NULL DEFAULT '0',
h23 INT(11) NOT NULL DEFAULT '0',
week INT(1) NOT NULL DEFAULT '0',
hit INT(11) NOT NULL DEFAULT '0',
hits INT(11) NOT NULL DEFAULT '0',
PRIMARY KEY(no)
);

/****************************************************************
+ 접속통계(IP)
****************************************************************/
DROP TABLE IF EXISTS $table[mlog_ip];
CREATE TABLE $table[mlog_ip] (
no INT(11) NOT NULL AUTO_INCREMENT,
reg_date VARCHAR(10)NOT NULL,
ip VARCHAR(15) NOT NULL,
hits INT(11) NOT NULL,
conn_referer TEXT NOT NULL,
PRIMARY KEY(no)
);

/****************************************************************
+ 접속통계(AGNET)
****************************************************************/
DROP TABLE IF EXISTS $table[mlog_agent];
CREATE TABLE $table[mlog_agent] (
no INT(11) NOT NULL AUTO_INCREMENT,
reg_date VARCHAR(10) NOT NULL,
type ENUM ('O','B','S') NOT NULL,
content VARCHAR(255) NOT NULL,
hits INT(11) NOT NULL DEFAULT '0',
PRIMARY KEY (no)
);

/****************************************************************
+ 접속통계(REFER)
****************************************************************/
DROP TABLE IF EXISTS $table[mlog_refer];
CREATE TABLE $table[mlog_refer] (
no INT(11) NOT NULL AUTO_INCREMENT,
reg_date VARCHAR(10) NOT NULL,
referer VARCHAR(255) NOT NULL,
hits INT(11) NOT NULL DEFAULT '0',
pid VARCHAR(20) NOT NULL,
PRIMARY KEY(no)
);

/****************************************************************
+ 접속통계(ENGINE)
*****************************************************************/
DROP TABLE IF EXISTS $table[mlog_engine];
CREATE TABLE IF NOT EXISTS $table[mlog_engine] (
no INT(8) NOT NULL AUTO_INCREMENT,
reg_date varchar(10) NOT NULL,
engine VARCHAR(30) NOT NULL,
hits int(13) NOT NULL,
pid VARCHAR(20) NOT NULL,
PRIMARY KEY(no)
);

/****************************************************************
+ 접속통계(KEYWORD)
*****************************************************************/
DROP TABLE IF EXISTS $table[mlog_keyword];
CREATE TABLE IF NOT EXISTS $table[mlog_keyword] (
no INT(8) NOT NULL AUTO_INCREMENT,
reg_date varchar(10) NOT NULL,
keyword VARCHAR(100) NOT NULL,
hits int(13) NOT NULL,
pid VARCHAR(20) NOT NULL,
PRIMARY KEY(no)
);

/****************************************************************
+ 우편번호
****************************************************************/
DROP TABLE IF EXISTS $table[zipcode];
CREATE TABLE $table[zipcode] (
zipcode					VARCHAR(10) NOT NULL,
sido						VARCHAR(10) NOT NULL,
gugun					VARCHAR(13) NOT NULL,
dong 					VARCHAR(50) NOT NULL,
bunji						VARCHAR(20) NOT NULL,
seq						INT(5) UNSIGNED NOT NULL DEFAULT '0'
);



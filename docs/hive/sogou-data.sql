drop table if exists sogou_data1;
create table sogou_data1(
    dt string,
    user_id string,
    search_word string,
    rank int,
    seq int,
    url string
)
row format delimited fields
terminated by '\t' stored as textfile;
load data local inpath '/home/zhangyu/download/sogou-data/500w/sogou.500w.utf8' into table sogou_data1;
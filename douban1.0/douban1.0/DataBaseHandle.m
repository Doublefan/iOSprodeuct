//
//  DataBaseHandle.m
//  douban1.0
//
//  Created by lanou3g on 15/7/27.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "DataBaseHandle.h"

@implementation DataBaseHandle
static DataBaseHandle*handle=nil;
static sqlite3*_db;
+(instancetype)shareInstance{
    @synchronized(self){
        if (nil==handle) {
            handle=[[DataBaseHandle alloc]init];
        }
        return handle;
    }
}
-(BOOL)collectActivity:(Activity*)activity{
    [self open];
    NSString*createSql=@"CREATE TABLE activity (title TEXT,begintime TEXT,endtime TEXT,name TEXT,address TEXT,type TEXT,introduce TEXT,activityId INTEGER PRIMARY KEY);";
    char*errmsg1=NULL;
    int result1= sqlite3_exec(_db, createSql.UTF8String, NULL, NULL, &errmsg1);
    if (result1==SQLITE_OK) {
        NSLog(@"创建表成功");
    }else{
        NSLog(@"创建表失败%s",errmsg1);
    }
    NSString*insertSql=[NSString stringWithFormat:@"insert into activity(title,begintime,endtime,name,address,type,introduce,activityId) values('%@','%@','%@','%@','%@','%@','%@','%d')",activity.title,activity.begin_time,activity.end_time,[activity.owner objectForKey:@"name"],activity.address,activity.category_name,activity.content,activity.album];
    //NSLog(@"%d",activity.album);
    char*errmsg2=NULL;
    int result2=sqlite3_exec(_db, insertSql.UTF8String, NULL, NULL, &errmsg2);
    if (result2==SQLITE_OK) {
        NSLog(@"添加成功");
        [self close];
        return YES;
    }else{
        NSLog(@"添加失败%s",errmsg2);
        [self close];
        return NO;
    }

}
-(NSMutableArray*)getAllActivity{
    [self open];
    NSString*querySql=@"select * from activity";
    //2.检查SQL语句是否正确
    sqlite3_stmt*stmt=NULL;
    int result1= sqlite3_prepare_v2(_db, querySql.UTF8String, -1, &stmt, NULL);
    //3.如果SQL语句正确,执行SQL语句,依次获取查询的结果
    NSMutableArray*array=[NSMutableArray array];
    if (result1==SQLITE_OK) {
        while(SQLITE_ROW==sqlite3_step(stmt)) {//查找到了一条数据
            //4.显示查询结果
            //注意:sqlite3_column_xxx方法的第二个参数与数据库表中的字段顺序是一一对应的(从0开始)
            Activity*activity=[[Activity alloc]init];
            activity.title=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 0)];
            activity.begin_time=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 1)];
            activity.end_time=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 2)];
            activity.name=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 3)];
            activity.address=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 4)];
            activity.category_name=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 5)];
            activity.content=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 6)];
            activity.album=[[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 7)]intValue];
            //封装model对象
            [array addObject:activity];
        }
    }else{
        NSLog(@"%d",result1);
    }
    //5.释放stmt
    sqlite3_finalize(stmt);
    [self close];
    return array;
}

-(void)deleteActivityById:(int)id{
    [self open];
    NSString*deleteSql=[NSString stringWithFormat:@"delete from activity where activityid = '%d'",id];
    //执行SQL语句
    //[self excuteSql:deleteSql message:@"删除一个学生"];
    char*errmsg=NULL;
    int result1=sqlite3_exec(_db, deleteSql.UTF8String, NULL, NULL, &errmsg);
    if (result1==SQLITE_OK) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败%s",errmsg);
    }
    [self close];
}
-(void)open{
    NSString*documentsPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString*dbPath=[documentsPath stringByAppendingPathComponent:@"douban.db"];
    NSLog(@"%@",dbPath);
    int result= sqlite3_open(dbPath.UTF8String, &_db);
    if (result==SQLITE_OK) {
        NSLog(@"创建(连接)数据库成功");
    }else{
        NSLog(@"创建(连接)数据库失败");
    }
}
-(void)close{
    int result3= sqlite3_close(_db);
    if (result3==SQLITE_OK) {
        NSLog(@"关闭数据库成功");
        _db=nil;
    }else{
        NSLog(@"关闭数据库失败");
    }

}






-(BOOL)collectMovie:(MovieDetail*)movie{
    [self open];
    NSString*createSql=@"CREATE TABLE movie (title TEXT,genres TEXT,country TEXT,runtime TEXT,people TEXT,scores TEXT,time TEXT,actors TEXT,simple TEXT ,movieid TEXT PRIMARY KEY);";
    char*errmsg1=NULL;
    int result1= sqlite3_exec(_db, createSql.UTF8String, NULL, NULL, &errmsg1);
    if (result1==SQLITE_OK) {
        NSLog(@"创建表成功");
    }else{
        NSLog(@"创建表失败%s",errmsg1);
    }
    NSString*insertSql=[NSString stringWithFormat:@"insert into movie(title ,genres ,country ,runtime ,people ,scores ,time ,actors ,simple,movieid) values('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')",movie.title,movie.genres,movie.country,movie.runtime,movie.rating_count,movie.rating,movie.release_date,movie.actors,movie.plot_simple,movie.movieid];
    //NSLog(@"%d",activity.album);
    char*errmsg2=NULL;
    int result2=sqlite3_exec(_db, insertSql.UTF8String, NULL, NULL, &errmsg2);
    if (result2==SQLITE_OK) {
        NSLog(@"添加成功");
        [self close];
        return YES;
    }else{
        NSLog(@"添加失败%s",errmsg2);
        [self close];
        return NO;
    }
    
}
-(NSMutableArray*)getAllMovie{
    [self open];
    NSString*querySql=@"select * from movie";
    //2.检查SQL语句是否正确
    sqlite3_stmt*stmt=NULL;
    int result1= sqlite3_prepare_v2(_db, querySql.UTF8String, -1, &stmt, NULL);
    //3.如果SQL语句正确,执行SQL语句,依次获取查询的结果
    NSMutableArray*array=[NSMutableArray array];
    if (result1==SQLITE_OK) {
        while(SQLITE_ROW==sqlite3_step(stmt)) {//查找到了一条数据
            //4.显示查询结果
            //注意:sqlite3_column_xxx方法的第二个参数与数据库表中的字段顺序是一一对应的(从0开始)
            MovieDetail*movie=[[MovieDetail alloc]init];
            movie.title=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 0)];
            movie.genres=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 1)];
            movie.country=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 2)];
            movie.runtime=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 3)];
            movie.rating_count=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 4)];
            movie.rating=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 5)];
            movie.release_date=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 6)];
            movie.actors=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 7)];
            movie.plot_simple=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 8)];
            movie.movieid=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 9)];
            //封装model对象
            [array addObject:movie];
        }
    }else{
        NSLog(@"%d",result1);
    }
    //5.释放stmt
    sqlite3_finalize(stmt);
    [self close];
    return array;
}

-(void)deleteMovieById:(NSString*)id{
    [self open];
    NSString*deleteSql=[NSString stringWithFormat:@"delete from movie where movieid = '%@'",id];
    //执行SQL语句
    //[self excuteSql:deleteSql message:@"删除一个学生"];
    char*errmsg=NULL;
    int result1=sqlite3_exec(_db, deleteSql.UTF8String, NULL, NULL, &errmsg);
    if (result1==SQLITE_OK) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败%s",errmsg);
    }
    [self close];
}



-(BOOL)loginPeople:(People*)people{
    [self open];
    NSString*createSql=@"CREATE TABLE people (name TEXT,password TEXT,age TEXT,sex TEXT,card TEXT PRIMARY KEY);";
    char*errmsg1=NULL;
    int result1= sqlite3_exec(_db, createSql.UTF8String, NULL, NULL, &errmsg1);
    if (result1==SQLITE_OK) {
        NSLog(@"创建表成功");
    }else{
        NSLog(@"创建表失败%s",errmsg1);
    }
    NSString*insertSql=[NSString stringWithFormat:@"insert into people(name,password ,age ,sex,card) values('%@','%@','%@','%@','%@')",people.name,people.password,people.age,people.sex,people.card];
    //NSLog(@"%d",activity.album);
    char*errmsg2=NULL;
    int result2=sqlite3_exec(_db, insertSql.UTF8String, NULL, NULL, &errmsg2);
    if (result2==SQLITE_OK) {
        NSLog(@"添加成功");
        [self close];
        return YES;
    }else{
        NSLog(@"添加失败%s",errmsg2);
        [self close];
        return NO;
    }
}

@end

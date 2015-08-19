//
//  DataBaseHandle.h
//  douban1.0
//
//  Created by lanou3g on 15/7/27.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Activity.h"
#import "MovieDetail.h"
#import "people.h"
@interface DataBaseHandle : NSObject
+(instancetype)shareInstance;
-(BOOL)collectActivity:(Activity*)activity;
-(void)deleteActivityById:(int)id;
-(NSMutableArray*)getAllActivity;
-(BOOL)collectMovie:(MovieDetail*)movie;
-(NSMutableArray*)getAllMovie;
-(void)deleteMovieById:(NSString*)id;
-(BOOL)loginPeople:(People*)people;
@end

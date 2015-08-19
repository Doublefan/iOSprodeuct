//
//  MovieDetail.h
//  homeWork-网络请求
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImageDownLoad.h"
@interface MovieDetail : NSObject<ImageDownLoadDelegate>
@property(nonatomic,retain)NSString * title;      //电影名字
@property(nonatomic,retain)NSString * genres;     //分类
@property(nonatomic,retain)NSString * country;    //国家
@property(nonatomic,retain)NSString * runtime;    //时间
@property(nonatomic,retain)NSString * rating_count;  //评论人数
@property(nonatomic,retain)NSString * rating;        //评分
@property(nonatomic,retain)NSString  *release_date;   //上映时间
@property(nonatomic,retain)NSString  * actors;       //制作人信息
@property(nonatomic,retain)NSString * plot_simple;//简介
@property(nonatomic,retain)NSString* movieid;
@property(nonatomic,retain)NSString * poster;       //图片
@property(nonatomic,retain)UIImage * iamge;
@property(nonatomic,assign)int collectItem;
@property(nonatomic,retain)ImageDownLoad * downLoder;

@end

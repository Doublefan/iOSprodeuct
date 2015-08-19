//
//  Movie.h
//  homeWork-网络请求
//
//  Created by lanou3g on 15/7/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImageDownLoad.h"
#import "ImageDownLoadDelegate.h"
@interface Movie : NSObject<ImageDownLoadDelegate>

@property(nonatomic,retain)NSString * movieName;//电影名

@property(nonatomic,retain)NSString  * pic_url;//图片

@property(nonatomic,retain)NSString * movieId;//电影编号

@property(nonatomic,retain)UIImage  * picture;

@property(nonatomic,retain) ImageDownLoad* downLoader;
-(void)laodimage;
@end

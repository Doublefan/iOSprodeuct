//
//  CinemaDetail.h
//  豆瓣_电影
//
//  Created by lanou3g on 15/7/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageDownLoadDelegate.h"
#import "ImageDownLoad.h"

@interface CinemaDetail : NSObject<ImageDownLoadDelegate>

@property(nonatomic,retain)NSString * movieName;
@property(nonatomic,retain)NSString * pic_url;
@property(nonatomic,retain)NSArray * broadcast;

@property(nonatomic,retain)UIImage * picture;

@property(nonatomic,retain)ImageDownLoad * download;

-(void)loadImage;
@end

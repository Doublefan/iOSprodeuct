//
//  Activity.h
//  douban1.0
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImageDownLoadDelegate.h"
#import "ImageDownLoad.h"
@interface Activity : NSObject<ImageDownLoadDelegate>
@property (nonatomic,retain)  NSString *title;
@property ( nonatomic,retain)  NSString *begin_time;
@property ( nonatomic,retain)  NSString *end_time;
@property (nonatomic,retain)  NSString *address;
@property ( nonatomic,retain)  NSString *category_name;
@property ( nonatomic,assign)  int  wisher_count;
@property ( nonatomic,assign)  int participant_count;
@property ( nonatomic,retain)  NSString *image_hlarge;
@property(nonatomic,retain)NSString*content;
@property(nonatomic,retain)UIImage*picture;
@property(nonatomic,retain)ImageDownLoad*imagedown;
@property(nonatomic,retain)NSMutableDictionary*owner;
@property(nonatomic,retain)NSString*name;
@property(nonatomic,assign) int album;
@property(nonatomic,assign)int collectItem;
-(void)loadImage;
@end

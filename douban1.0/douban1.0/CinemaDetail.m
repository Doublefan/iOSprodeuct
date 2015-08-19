//
//  CinemaDetail.m
//  豆瓣_电影
//
//  Created by lanou3g on 15/7/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CinemaDetail.h"

@implementation CinemaDetail

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(void)loadImage
{
    self.download = [[ImageDownLoad alloc]initWithURLImage:_pic_url Delegate:self];
}
-(void)getimage:(UIImage *)image
{
    self.picture = image;
}

@end

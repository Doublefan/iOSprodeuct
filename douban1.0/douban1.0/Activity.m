//
//  Activity.m
//  douban1.0
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "Activity.h"

@implementation Activity
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
}
-(void)getimage:(UIImage *)image{
    self.picture=image;
}
-(void)loadImage{
    self.imagedown=[[ImageDownLoad alloc]initWithURLImage:self.image_hlarge Delegate:self];
}
@end

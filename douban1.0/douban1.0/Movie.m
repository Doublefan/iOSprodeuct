//
//  Movie.m
//  homeWork-网络请求
//
//  Created by lanou3g on 15/7/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "Movie.h"

@implementation Movie
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    
}

-(void)laodimage
{
    
    self.downLoader=[[ImageDownLoad alloc]initWithURLImage:_pic_url Delegate:self];
    
    
}


-(void)getimage:(UIImage *)image
{
    
    self.picture=image;
    
    
    
}



@end

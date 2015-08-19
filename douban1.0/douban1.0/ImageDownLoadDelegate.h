//
//  ImageDownLoadDelegate.h
//  douban1.0
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol ImageDownLoadDelegate <NSObject>
@optional
-(void)getimage:(UIImage*)image;
@end

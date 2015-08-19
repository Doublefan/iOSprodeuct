//
//  ImageDownLoad.h
//  douban1.0
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageDownLoadDelegate.h"
@interface ImageDownLoad : NSObject
-(instancetype)initWithURLImage:(NSString*)urlimage Delegate:(id<ImageDownLoadDelegate>)delegate;
@end


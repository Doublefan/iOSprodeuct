//
//  Cinema.h
//  homeWork-网络请求
//
//  Created by lanou3g on 15/7/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cinema : NSObject
@property(nonatomic,retain)NSString*  id;//影院ID
@property(nonatomic,retain)NSString * cinemaName;//影院名字
@property(nonatomic,retain)NSString * telephone;//影院电话
@property(nonatomic,retain)NSString * trafficRoutes;//影院乘车路线
@property(nonatomic,retain)NSString * address;//影院地址

@end

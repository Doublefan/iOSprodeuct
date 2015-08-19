//
//  people.h
//  douban1.0
//
//  Created by lanou3g on 15/7/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject<NSCoding>
@property(nonatomic,retain)NSString*name;
@property(nonatomic,retain)NSString*password;
@property(nonatomic,retain)NSString*age;
@property(nonatomic,retain)NSString*sex;
@property(nonatomic,retain)NSString*card;


@end

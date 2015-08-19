//
//  people.m
//  douban1.0
//
//  Created by lanou3g on 15/7/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "People.h"

@implementation People

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
    [aCoder encodeObject:self.age forKey:@"age"];
    [aCoder encodeObject:self.card forKey:@"card"];
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeObjectForKey:@"age"];
        self.sex = [aDecoder decodeObjectForKey:@"sex"];
        self.card = [aDecoder decodeObjectForKey:@"card"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
    }
    return self;
}

@end

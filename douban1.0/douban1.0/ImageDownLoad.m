//
//  ImageDownLoad.m
//  douban1.0
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ImageDownLoad.h"

@implementation ImageDownLoad
-(instancetype)initWithURLImage:(NSString*)urlimage Delegate:(id<ImageDownLoadDelegate>)delegate{
    self=[super init];
    if (self) {
        NSURL*url=[NSURL URLWithString:urlimage];
        NSURLRequest*request=[NSURLRequest requestWithURL:url];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            [delegate getimage:[UIImage imageWithData:data]];
        }];
    }
    return self;
}

@end

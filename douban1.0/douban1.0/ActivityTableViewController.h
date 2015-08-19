//
//  ActivityTableViewController.h
//  douban1.0
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityTableViewCell.h"
#import "URL.h"
#import "Activity.h"
#import "ActivityDetailsViewController.h"
@interface ActivityTableViewController : UITableViewController<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
@property(nonatomic,retain)NSMutableArray*allArray;
@property(nonatomic,retain)NSMutableData*alldata;
@end

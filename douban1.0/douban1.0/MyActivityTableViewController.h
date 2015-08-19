//
//  MyActivityTableViewController.h
//  douban1.0
//
//  Created by lanou3g on 15/7/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyActivityTableViewCell.h"
#import "DataBaseHandle.h"
#import "ActivityDetailsViewController.h"
@interface MyActivityTableViewController : UITableViewController
@property(nonatomic,retain)NSMutableArray*allactivity;
@end

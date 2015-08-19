//
//  MyMovieTableViewController.h
//  douban1.0
//
//  Created by lanou3g on 15/7/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyMovieTableViewCell.h"
#import "DataBaseHandle.h"
#import "MovieDetail.h"
#import "MovieDetaiViewController.h"
@interface MyMovieTableViewController : UITableViewController
@property(nonatomic,retain)NSMutableArray*allmovie;
@end

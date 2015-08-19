//
//  ActivityDetailsViewController.h
//  douban1.0
//
//  Created by lanou3g on 15/7/25.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"
#import "DataBaseHandle.h"
@interface ActivityDetailsViewController : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *titlename;
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *type;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UILabel *introduce;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,assign ) int activityId;
@property (nonatomic,retain) NSString* begintime;
@property (nonatomic,retain) NSString* endtime;
@property(nonatomic,retain)Activity*activity;
@end

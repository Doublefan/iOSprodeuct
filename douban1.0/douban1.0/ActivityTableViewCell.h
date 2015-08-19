//
//  ActivityTableViewCell.h
//  douban1.0
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"
@interface ActivityTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *time1;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UILabel *type;
@property (strong, nonatomic) IBOutlet UILabel *number1;
@property (strong, nonatomic) IBOutlet UILabel *number2;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property(nonatomic,retain)Activity*activity;
@end

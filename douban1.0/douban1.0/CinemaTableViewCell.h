//
//  CinemaTableViewCell.h
//  homeWork-网络请求
//
//  Created by lanou3g on 15/7/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cinema.h"
@interface CinemaTableViewCell : UITableViewCell

@property(nonatomic,retain)Cinema * cinema1;

@property (strong, nonatomic) IBOutlet UILabel *cinemaNameLabel;

@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UILabel *telephone;

@end

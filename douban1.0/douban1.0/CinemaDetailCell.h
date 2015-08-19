//
//  CinemaDetailCell.h
//  豆瓣_电影
//
//  Created by lanou3g on 15/7/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaDetailCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UILabel *movieName;
@property (retain, nonatomic) IBOutlet UILabel *hall;
@property (retain, nonatomic) IBOutlet UILabel *type;
@property (retain, nonatomic) IBOutlet UILabel *time;
@property (retain, nonatomic) IBOutlet UILabel *language;
@property (retain, nonatomic) IBOutlet UILabel *price;

@property (retain, nonatomic) IBOutlet UIImageView *imgView;


@end

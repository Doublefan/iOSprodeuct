//
//  MovieListTableViewCell.h
//  homeWork-网络请求
//
//  Created by lanou3g on 15/7/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
@interface MovieListTableViewCell : UITableViewCell

@property(nonatomic,retain)Movie * movie;

@property (strong, nonatomic) IBOutlet UILabel *movieName;

@property (strong, nonatomic) IBOutlet UIImageView *pic_url;


@end

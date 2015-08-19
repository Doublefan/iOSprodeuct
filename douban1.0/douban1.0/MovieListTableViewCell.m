//
//  MovieListTableViewCell.m
//  homeWork-网络请求
//
//  Created by lanou3g on 15/7/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MovieListTableViewCell.h"

@implementation MovieListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setMovie:(Movie *)movie
{
    
    _movieName.text=movie.movieName;
    
    
    
}
@end

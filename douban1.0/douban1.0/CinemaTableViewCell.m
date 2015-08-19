//
//  CinemaTableViewCell.m
//  homeWork-网络请求
//
//  Created by lanou3g on 15/7/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CinemaTableViewCell.h"

@implementation CinemaTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setCinema1:(Cinema *)cinema1
{
    _address.text=cinema1.address;
    _cinemaNameLabel.text=cinema1.cinemaName;
    _telephone.text=cinema1.telephone;
    
    
    
    
}
@end

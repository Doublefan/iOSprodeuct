//
//  ActivityTableViewCell.m
//  douban1.0
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setActivity:(Activity *)activity{
    self.title.text=activity.title;
    NSString*time1=[[activity.begin_time substringFromIndex:5]substringToIndex:11];
    NSString*time2=[[activity.end_time substringFromIndex:5]substringToIndex:11];
    NSString*time3=[[time1 stringByAppendingString:@" -- "]stringByAppendingString:time2];
    self.time1.text=time3;
    self. address.text=activity.address;
    self.type.text=activity.category_name;
    self.number1.text=[NSString stringWithFormat:@"%d", activity.wisher_count ];
    self.number2.text=[NSString stringWithFormat:@"%d", activity.participant_count ];
    //NSLog(@"%@",self.number2.text);
    self.image.image=activity.picture;
}
@end

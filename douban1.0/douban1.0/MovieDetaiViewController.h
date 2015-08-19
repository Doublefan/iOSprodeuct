//
//  MovieDetaiViewController.h
//  homeWork-网络请求
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageDownLoadDelegate.h"
#import "MovieDetail.h"
#import "DataBaseHandle.h"
@interface MovieDetaiViewController : UIViewController<ImageDownLoadDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;

@property (strong, nonatomic) IBOutlet UILabel *ratingCountLabel;

@property (strong, nonatomic) IBOutlet UILabel *releaseDateLabel;

@property (strong, nonatomic) IBOutlet UILabel *actorsLabel;

@property (strong, nonatomic) IBOutlet UILabel *plotSimpleLabel;

@property (strong, nonatomic) IBOutlet UILabel *runtimeLabel;

@property (strong, nonatomic) IBOutlet UILabel *genresLabel;


@property (strong, nonatomic) IBOutlet UILabel *countryLabel;

@property (strong, nonatomic) IBOutlet UIImageView *imageVIew;





@property(nonatomic,retain)NSString * movieId ;//接收电影编号

@property(nonatomic,retain)ImageDownLoad * DownLoader;//下载图片数据对象





@property(nonatomic,retain)NSString * poster;

@property(nonatomic,retain)MovieDetail * movieD;

@end

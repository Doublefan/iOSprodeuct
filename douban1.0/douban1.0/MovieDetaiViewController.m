//
//  MovieDetaiViewController.m
//  homeWork-网络请求
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MovieDetaiViewController.h"
#import "URL.h"

@interface MovieDetaiViewController ()

@end

@implementation MovieDetaiViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent=NO;
    
    //NSLog(@"++++%@",_movieId);
    
    //将简介和制作人信息的label顶部对齐
    [self.plotSimpleLabel sizeToFit];
    [self.actorsLabel sizeToFit];
    //网络请求
    if (_movieD.collectItem==1) {
        [self.plotSimpleLabel sizeToFit];
        [self.actorsLabel sizeToFit];
        _ratingLabel.text=_movieD.rating;
        _ratingCountLabel.text=_movieD.rating_count;
        _releaseDateLabel.text=_movieD.release_date;
        _actorsLabel.text=_movieD.actors;
        _plotSimpleLabel.text=_movieD.plot_simple;
        _runtimeLabel.text=_movieD.runtime;
        _genresLabel.text=_movieD.genres;
        _countryLabel.text=_movieD.country;
        _poster=_movieD.poster;
        self.navigationItem.title=_movieD.title;
        _scrollView.contentSize=CGSizeMake(0, 800);
    }else{
    NSString *str= [movieDetail stringByAppendingString:_movieId];
    //创建网址对象
    NSURL * url=[NSURL URLWithString:str];
    
    //创建请求对象
    NSMutableURLRequest * request=[NSMutableURLRequest requestWithURL:url];
    
    //异步请求数据
    NSData *data= [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //解析数据
    NSMutableDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSMutableDictionary * dic1=[dic objectForKey:@"result"];
    
    self.movieD=[MovieDetail new];
    
    [_movieD setValuesForKeysWithDictionary:dic1];
    _ratingLabel.text=_movieD.rating;
    _ratingCountLabel.text=_movieD.rating_count;
    _releaseDateLabel.text=_movieD.release_date;
    _actorsLabel.text=_movieD.actors;
    _plotSimpleLabel.text=_movieD.plot_simple;
    _runtimeLabel.text=_movieD.runtime;
    _genresLabel.text=_movieD.genres;
    _countryLabel.text=_movieD.country;
    _poster=_movieD.poster;
    self.navigationItem.title=_movieD.title;
    
    self.DownLoader=[[ImageDownLoad alloc]initWithURLImage:_movieD.poster Delegate:self];
    _scrollView.contentSize=CGSizeMake(0, 800);
    UIBarButtonItem*right=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_share.png"] style:UIBarButtonItemStylePlain target:self action:@selector(jion)];
    self.navigationItem.rightBarButtonItem=right;
    }
}


-(void)jion{
    BOOL bo=[[DataBaseHandle shareInstance]collectMovie:_movieD];
    
    if (bo==YES) {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"收藏成功" delegate:nil cancelButtonTitle:@"确定"otherButtonTitles: nil];
        [alert show];
    }else{
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"该活动已经被收藏过" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//实现协议的方法
-(void)getimage:(UIImage *)image
{
    self.imageVIew.image=image;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

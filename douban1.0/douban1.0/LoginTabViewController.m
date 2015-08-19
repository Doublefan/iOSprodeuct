//
//  LoginTabViewController.m
//  douban1.0
//
//  Created by lanou3g on 15/7/24.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LoginTabViewController.h"

@interface LoginTabViewController ()

@end

@implementation LoginTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ActivityTableViewController*activity=[[ActivityTableViewController alloc]init];
    UINavigationController*activityNC=[[UINavigationController alloc]initWithRootViewController:activity];
    activityNC.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"活动" image:[UIImage imageNamed:@"activity.png"] tag:101];
    MovieListTableViewController*movie=[[MovieListTableViewController alloc]init];
    UINavigationController*movieNC=[[UINavigationController alloc]initWithRootViewController:movie];
    movieNC.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"电影" image:[UIImage imageNamed:@"cinema.png"] tag:105];

    CinemaTableViewController*cinemaa=[[CinemaTableViewController alloc]init];
    UINavigationController*cinemaNC=[[UINavigationController alloc]initWithRootViewController:cinemaa];
    cinemaNC.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"影院" image:[UIImage imageNamed:@"movie.png"] tag:105];

    MyViewController*my=[[MyViewController alloc]init];
    UINavigationController*myNC=[[UINavigationController alloc]initWithRootViewController:my];
    myNC.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"user.png"] tag:105];
    
    self.viewControllers=@[activityNC,movieNC,cinemaNC,myNC];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"sdfsdfsdf");
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

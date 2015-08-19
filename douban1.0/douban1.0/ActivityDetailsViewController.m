//
//  ActivityDetailsViewController.m
//  douban1.0
//
//  Created by lanou3g on 15/7/25.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ActivityDetailsViewController.h"

@interface ActivityDetailsViewController ()

@end

@implementation ActivityDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //_scrollView.scrollEnabled=YES;
    //_scrollView.delegate=self;
    self.navigationItem.title=_activity.title;
    NSString*time1=[[_activity.begin_time substringFromIndex:5]substringToIndex:11];
    NSString*time2=[[_activity.end_time substringFromIndex:5]substringToIndex:11];
    NSString*time3=[[time1 stringByAppendingString:@" -- "]stringByAppendingString:time2];
    self.titlename.text=_activity.title;
    self.time.text=time3;
    self.name.text=[_activity.owner objectForKey:@"name"];
    self.type.text=_activity.category_name;
    self.address.text=_activity.address;
    self.introduce.text=_activity.content;
    self.image.image=_activity.picture;
    if (_activity.collectItem==1) {
    UIBarButtonItem*right=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_share.png"] style:UIBarButtonItemStylePlain target:self action:@selector(jion)];
    self.navigationItem.rightBarButtonItem=right;
    }
    _scrollView.contentSize=CGSizeMake(375, 1500);
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)jion{
    BOOL bo=[[DataBaseHandle shareInstance]collectActivity:_activity];
    
    if (bo==YES) {
    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"收藏成功" delegate:nil cancelButtonTitle:@"确定"otherButtonTitles: nil];
    [alert show];
    }else{
    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"该活动已经被收藏过" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    }
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

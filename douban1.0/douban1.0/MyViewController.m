//
//  MyViewController.m
//  douban1.0
//
//  Created by lanou3g on 15/7/25.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MyViewController.h"
#import "LoginViewController.h"
#import "MyViewController.h"
@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav@2x.png"] forBarMetrics:UIBarMetricsDefault];

    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    NSData * data = [user objectForKey:@"people"];
    People * people = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    self.navigationItem.title=[NSString stringWithFormat:@"%@",people.name];
    
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登陆" style:UIBarButtonItemStylePlain target:self action:@selector(loginClick)];
    if (data != NULL) {
        self.navigationItem.rightBarButtonItem.title = @"注销";
    }
}



-(void)loginClick
{
    if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"登陆"]) {
        LoginViewController * loginVC = [[LoginViewController alloc]init];
        loginVC.myVC = self;
        UINavigationController * loginNC = [[UINavigationController alloc]initWithRootViewController:loginVC];
        [self presentViewController:loginNC animated:YES completion:nil];
        
    } else {
        NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
        [user removeObjectForKey:@"people"];
        [self viewDidLoad];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)myactivity:(UIButton *)sender {
    MyActivityTableViewController*myActivity=[[MyActivityTableViewController alloc]init];
    
    [self.navigationController pushViewController:myActivity animated:YES];
    
    
}

- (IBAction)mymovie:(UIButton *)sender {
    MyMovieTableViewController*myMovie=[[MyMovieTableViewController alloc]init];
    
    [self.navigationController pushViewController:myMovie animated:YES];

}
@end

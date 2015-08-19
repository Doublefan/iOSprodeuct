//
//  LoginViewController.m
//  DouBan
//
//  Created by lanou3g on 15/7/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChanged) name:UITextFieldTextDidChangeNotification object:self.userNameText];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChanged) name:UITextFieldTextDidChangeNotification object:self.passwordText];
    
}

-(void)valueChanged
{
    if (self.userNameText.text.length != 0 && self.passwordText.text.length != 0) {
        self.loginButton.enabled = YES;
    } else {
        self.loginButton.enabled = NO;
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


//记住密码
- (IBAction)rememberPassword:(UISwitch *)sender {
    if (self.rememberPwdSwitch.on == YES) {
        self.autoLogin.on = YES;
    }
}

//自动登陆
- (IBAction)AutoLogin:(UISwitch *)sender {
    if (self.autoLogin.on == YES) {
        self.rememberPwdSwitch.on = YES;
    }
}

//登陆功能
- (IBAction)LoginButtonClick:(UIButton *)sender {
    
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    NSData * data = [user objectForKey:@"people"];
    People * people = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSString * name = people.name;
    NSString * pwd = people.password;
    NSLog(@"%@,%@",name,pwd);
    if (self.userNameText.text == name && self.passwordText.text == pwd) {
        NSLog(@"正确");
    } else {
        NSLog(@"错误");
    }
    
}

- (IBAction)registerButtonClick:(UIButton *)sender {
    RegisterViewController * reg = [[RegisterViewController alloc]init];
    
    [self.navigationController pushViewController:reg animated:YES];
    
}

- (IBAction)cancleButtonClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (void)dealloc {
//    [_userNameText release];
//    [_passwordText release];
//    [_loginButton release];
//    [_rememberPwdSwitch release];
//    [_autoLogin release];
//    [_registerButton release];
//    [super dealloc];
//}
@end

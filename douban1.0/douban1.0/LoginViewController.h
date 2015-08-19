//
//  LoginViewController.h
//  DouBan
//
//  Created by lanou3g on 15/7/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "UserOperation.h"
@class MyViewController;
@interface LoginViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *userNameText;

@property (retain, nonatomic) IBOutlet UITextField *passwordText;

@property (retain, nonatomic) IBOutlet UIButton *loginButton;

@property (retain, nonatomic) IBOutlet UISwitch *rememberPwdSwitch;

@property (retain, nonatomic) IBOutlet UISwitch *autoLogin;

@property (retain, nonatomic) IBOutlet UIButton *registerButton;

@property (retain,nonatomic ) MyViewController * myVC;

- (IBAction)rememberPassword:(UISwitch *)sender;

- (IBAction)AutoLogin:(UISwitch *)sender;

- (IBAction)LoginButtonClick:(UIButton *)sender;

- (IBAction)registerButtonClick:(UIButton *)sender;

- (IBAction)cancleButtonClick:(UIButton *)sender;

@end

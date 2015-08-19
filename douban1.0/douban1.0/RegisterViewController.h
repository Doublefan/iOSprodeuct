//
//  RegisterViewController.h
//  DouBan
//
//  Created by lanou3g on 15/7/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "People.h"
@interface RegisterViewController : UIViewController<UIActionSheetDelegate>



@property (retain, nonatomic) IBOutlet UITextField *nameText;
@property (retain, nonatomic) IBOutlet UITextField *pwdText;
@property (retain, nonatomic) IBOutlet UITextField *ageText;
@property (retain, nonatomic) IBOutlet UITextField *genderText;
@property (retain, nonatomic) IBOutlet UITextField *cardIdText;

@property (retain, nonatomic) IBOutlet UIButton *registerButton;


- (IBAction)SaveUserInfo:(UIButton *)sender;

- (IBAction)cancleRegister:(UIButton *)sender;

@end

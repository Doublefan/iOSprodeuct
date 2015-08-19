//
//  RegisterViewController.m
//  DouBan
//
//  Created by lanou3g on 15/7/28.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "RegisterViewController.h"
#import "MyViewController.h"
#import "LoginViewController.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChanged) name:UITextFieldTextDidChangeNotification object:self.nameText];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChanged) name:UITextFieldTextDidChangeNotification object:self.pwdText];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChanged) name:UITextFieldTextDidChangeNotification object:self.ageText];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChanged) name:UITextFieldTextDidChangeNotification object:self.genderText];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChanged) name:UITextFieldTextDidChangeNotification object:self.cardIdText];
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

-(void)valueChanged
{
    if (self.nameText.text.length != 0 && self.pwdText.text.length != 0 && self.ageText.text.length != 0 && self.genderText.text.length != 0 && self.cardIdText.text.length != 0) {
        self.registerButton.enabled = YES;
    } else {
        self.registerButton.enabled = NO;
    }
}

- (IBAction)SaveUserInfo:(UIButton *)sender {
    
#pragma mark---------将信息归档
    //提交注册信息
    People * people = [[People alloc]init];
    people.name = self.nameText.text;
    people.password = self.pwdText.text;
    people.age = self.ageText.text;
    people.sex = self.genderText.text;
    people.card = self.cardIdText.text;
    
    //这是一个存放用户的数组
//    NSMutableArray * userMutArray = [NSMutableArray array];
    //将people类型转化为NSData类型
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:people];
    //存放数据的数组将data加进去
//    [userMutArray addObject:data];
    //将可变数组转变为不可变数组
//    NSArray * userArray = [NSArray arrayWithArray:userMutArray];
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    [user setObject:data forKey:@"people"];
    
    
    
    //将用户名保存到NSUserDefaults中
    //
    
    UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:@"注册成功" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [actionSheet showInView:self.view];
}

//- (void)dealloc {
//    [_nameText release];
//    [_pwdText release];
//    [_ageText release];
//    [_genderText release];
//    [_cardIdText release];
//    [_registerButton release];
//    [super dealloc];
//}
- (IBAction)cancleRegister:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    NSArray * array = self.navigationController.viewControllers;
    LoginViewController * loginVC = array[0];
    [loginVC.myVC viewDidLoad];
}

@end

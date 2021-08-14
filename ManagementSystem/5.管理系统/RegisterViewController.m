//
//  RegisterViewController.m
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* registerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"landing1.jpg"]];
    registerImageView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    [self.view addSubview:registerImageView];

    _landingAccountTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 342, 274, 50)];
    _landingAccountTextField.textColor = [UIColor blackColor];
    _landingAccountTextField.keyboardType = UIKeyboardTypeDefault;
    _landingAccountTextField.tag = 985;
    [_landingAccountTextField.layer setMasksToBounds:YES];
    [_landingAccountTextField.layer setCornerRadius:8.0];
    _landingAccountTextField.backgroundColor = [UIColor whiteColor];
    _landingAccountTextField.placeholder = @"请输入账号";
    _landingAccountTextField.font = [UIFont systemFontOfSize:24];
    _landingAccountTextField.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_landingAccountTextField];
    
    
    _landingPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 420, 274, 50)];
    _landingPasswordTextField.textColor = [UIColor blackColor];
    _landingPasswordTextField.keyboardType = UIKeyboardTypeNumberPad;
    _landingPasswordTextField.tag = 211;
    [_landingPasswordTextField.layer setMasksToBounds:YES];
    [_landingPasswordTextField.layer setCornerRadius:8.0];
    _landingPasswordTextField.backgroundColor = [UIColor whiteColor];
    _landingPasswordTextField.placeholder = @"请输入密码";
    _landingPasswordTextField.font = [UIFont systemFontOfSize:24];
    _landingPasswordTextField.textAlignment = NSTextAlignmentLeft;
    _landingPasswordTextField.secureTextEntry = YES;
    [self.view addSubview:_landingPasswordTextField];
    
    _landingAccountTextField.delegate = self;
    _landingPasswordTextField.delegate = self;
    
    
    UIImageView* landingTipOneImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tip1.png"]];
    landingTipOneImageView.frame = CGRectMake(4, 324, 105, 105);
    [self.view addSubview:landingTipOneImageView];
    
    UIImageView* landingTipTwoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tip1.png"]];
    landingTipTwoImageView.frame = CGRectMake(4, 401, 105, 105);
    [self.view addSubview:landingTipTwoImageView];
    
    
    UIButton* confirmRegisterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmRegisterButton.frame = CGRectMake(110, 534, 200, 100);
    [confirmRegisterButton setImage:[UIImage imageNamed:@"zhuce.jpg"] forState:UIControlStateNormal];
    [confirmRegisterButton addTarget:self action:@selector(pressConfirmRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmRegisterButton];
    
    _userArray = [[NSMutableArray alloc] init];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    UIImageView* landingTipImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"landing2.jpg"]];
    landingTipImageView.frame = CGRectMake(2, 100, [[UIScreen mainScreen] bounds].size.width - 8, 150);
    [self.view addSubview:landingTipImageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_landingAccountTextField resignFirstResponder];
    [_landingPasswordTextField resignFirstResponder];
}

- (void)pressConfirmRegisterButton {
    if ([_registerPassword isEqualToString:@""] || [_registerUserWord isEqualToString:@""] || _registerUserWord == nil || _registerPassword == nil) {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"请正确填写信息" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    } else {
        
        [_userArray addObject:_registerUserWord];
        [_userArray addObject:_registerPassword];
        NSLog(@"%@",_userArray[0]);
        NSLog(@"%@",_userArray[1]);
        [_delegate saveUser:_userArray];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField.tag == 985) {
        _registerUserWord = textField.text;
        NSLog(@"账号：%@",_registerUserWord);
    }
    if (textField.tag == 211) {
        _registerPassword = textField.text;
        NSLog(@"密码：%@",_registerPassword);
    }
}
        
@end

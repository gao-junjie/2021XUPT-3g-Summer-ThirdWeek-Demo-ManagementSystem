//
//  LandingViewController.m
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "LandingViewController.h"

@interface LandingViewController ()

@end

@implementation LandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* landingImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"landing1.jpg"]];
    landingImageView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    [self.view addSubview:landingImageView];
    

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
    
    
    UIButton* landingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    landingButton.frame = CGRectMake(130, 534, 150, 150);
    [landingButton setImage:[UIImage imageNamed:@"denglu.png"] forState:UIControlStateNormal];
    [landingButton addTarget:self action:@selector(pressLandingButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landingButton];
    
    
    UIButton* registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registerButton.frame = CGRectMake(234, 488, 120, 30);
    [registerButton setTitle:@"点击此处注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(pressRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    UILabel* lineLabel = [[UILabel alloc] init];
    lineLabel.frame = CGRectMake(230, 518, 120, 1);
    lineLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:lineLabel];
    
    _landingAccountTextField.delegate = self;
    _landingPasswordTextField.delegate = self;
    
    
    UIImageView* landingTipOneImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tip1.png"]];
    landingTipOneImageView.frame = CGRectMake(4, 324, 105, 105);
    [self.view addSubview:landingTipOneImageView];
    
    UIImageView* landingTipTwoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tip1.png"]];
    landingTipTwoImageView.frame = CGRectMake(4, 401, 105, 105);
    [self.view addSubview:landingTipTwoImageView];
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

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 985) {
        _accountUserWord = textField.text;
        NSLog(@"账号：%@",_accountUserWord);
    }
    if (textField.tag == 211) {
        _accountPassword = textField.text;
        NSLog(@"密码：%@",_accountPassword);
    }
}

- (void)pressRegisterButton {
    RegisterViewController* registerViewController = [[RegisterViewController alloc] init];
    registerViewController.delegate = self;
    registerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:registerViewController animated:NO completion:nil];
    
}

- (void)pressLandingButton {
    
    if (([_landingAccountTextField.text isEqualToString:_realAccountUserWord] && [_landingPasswordTextField.text isEqualToString:_realAccountPassword]) ||  ([_landingAccountTextField.text isEqualToString:@""] && [_landingPasswordTextField.text isEqualToString:@""])) {
        
        MainViewController* mainViewController = [[MainViewController alloc] init];
        UIWindow* window = [UIApplication sharedApplication].windows[1];
        window.rootViewController = mainViewController;
        
    } else {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"账号或密码不正确" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    }
}

- (void)saveUser:(NSMutableArray *)userArray {
    _realAccountUserWord = userArray[0];
    _realAccountPassword = userArray[1];
    NSLog(@"密码：%@",_realAccountUserWord);
    NSLog(@"密码：%@",_realAccountPassword);
}
@end

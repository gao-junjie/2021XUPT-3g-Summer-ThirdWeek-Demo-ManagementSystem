
//
//  ChangeViewController.m
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ChangeViewController.h"

@interface ChangeViewController ()

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* registerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainPic2.jpg"]];
    registerImageView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    registerImageView.alpha = 0.7;
    [self.view addSubview:registerImageView];
    
    _changeNameTextField = [[UITextField alloc] init];
    _changeNameTextField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    [_changeNameTextField.layer setCornerRadius:9.0];
    _changeNameTextField.placeholder = @"请输入姓名";
    _changeNameTextField.textColor = [UIColor blackColor];
    _changeNameTextField.font = [UIFont systemFontOfSize:23];
    _changeNameTextField.frame = CGRectMake(80, 200, 250, 60);
    [self.view addSubview:_changeNameTextField];
    
    
    _changeClassTextField = [[UITextField alloc] init];
    _changeClassTextField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    [_changeClassTextField.layer setMasksToBounds:YES];
    [_changeClassTextField.layer setCornerRadius:9.0];
    _changeClassTextField.placeholder = @"请输入班级";
    _changeClassTextField.textColor = [UIColor blackColor];
    _changeClassTextField.font = [UIFont systemFontOfSize:23];
    _changeClassTextField.frame = CGRectMake(80, 290, 250, 60);
    [self.view addSubview:_changeClassTextField];
    
    
    _changeGrateTextField = [[UITextField alloc] init];
    _changeGrateTextField.textColor = [UIColor redColor];
    _changeGrateTextField.font = [UIFont systemFontOfSize:36];
    _changeGrateTextField.frame = CGRectMake(258, 421, 90, 45);
    [self.view addSubview:_changeGrateTextField];
    
    
    UILabel* nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"姓名:";
    nameLabel.font = [UIFont systemFontOfSize:25];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.frame = CGRectMake(13, 215, 63, 30);
    [self.view addSubview:nameLabel];
    
    UILabel* classLabel = [[UILabel alloc] init];
    classLabel.text = @"班级:";
    classLabel.font = [UIFont systemFontOfSize:25];
    classLabel.textColor = [UIColor whiteColor];
    classLabel.frame = CGRectMake(13, 308, 63, 30);
    [self.view addSubview:classLabel];
    
    UILabel* changeLabel = [[UILabel alloc] init];
    changeLabel.text = @"将总成绩修改为:";
    changeLabel.font = [UIFont systemFontOfSize:27];
    changeLabel.textColor = [UIColor whiteColor];
    changeLabel.frame = CGRectMake(36, 438, 233, 30);
    [self.view addSubview:changeLabel];
    
    UILabel* elseLabel = [[UILabel alloc] init];
    elseLabel.backgroundColor = [UIColor whiteColor];
    elseLabel.frame = CGRectMake(253, 469, 114, 2);
    [self.view addSubview:elseLabel];
    
    UIImageView* tipHeadImageView = [[UIImageView alloc] init];
    [tipHeadImageView setImage:[UIImage imageNamed:@"tip7.png"]];
    tipHeadImageView.frame = CGRectMake(60, 40, 280, 115);
    [self.view addSubview:tipHeadImageView];
    
    UIButton* confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(20, 565, 375, 200);
    [confirmButton setImage:[UIImage imageNamed:@"changeButton"] forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(pressConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmButton];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_changeNameTextField resignFirstResponder];
    [_changeClassTextField resignFirstResponder];
    [_changeGrateTextField resignFirstResponder];
}

- (void) pressConfirmButton {
    bool flag = NO;
    for (int i = 0, j = (int)_changePeopleNumber; i < j; i++) {
        if ([_changeNameTextField.text isEqualToString:_changeNameArray[i]] && [_changeClassTextField.text isEqualToString:_changeClassArray[i]]) {
            if ([_changeGrateTextField.text isEqualToString:@""]) {
                UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"请填写修改后的总成绩" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
                }];
                [boomAlert addAction:boomAction];
                [self presentViewController:boomAlert animated:YES completion:nil];
            } else {
                flag = YES;
                [_changeGrateArray replaceObjectAtIndex:i withObject:_changeGrateTextField.text];
                [_delegate changeSendGrateArray:_changeGrateArray];
                [self dismissViewControllerAnimated:YES completion:nil];
            
                break;
            }
        }
    }
    if (flag == NO) {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"修改失败！未找到符合上述信息的学生" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    }
}

@end

//
//  AddViewController.m
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* registerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainPic2.jpg"]];
    registerImageView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    registerImageView.alpha = 0.7;
    [self.view addSubview:registerImageView];
    
    
    _addNameTextField = [[UITextField alloc] init];
    _addNameTextField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    [_addNameTextField.layer setMasksToBounds:YES];
    [_addNameTextField.layer setCornerRadius:9.0];
    _addNameTextField.placeholder = @"请输入姓名";
    _addNameTextField.textColor = [UIColor blackColor];
    _addNameTextField.font = [UIFont systemFontOfSize:23];
    _addNameTextField.frame = CGRectMake(80, 200, 250, 60);
    [self.view addSubview:_addNameTextField];
    
    
    _addClassTextField = [[UITextField alloc] init];
    _addClassTextField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    [_addClassTextField.layer setMasksToBounds:YES];
    [_addClassTextField.layer setCornerRadius:9.0];
    _addClassTextField.placeholder = @"请输入班级";
    _addClassTextField.textColor = [UIColor blackColor];
    _addClassTextField.font = [UIFont systemFontOfSize:23];
    _addClassTextField.frame = CGRectMake(80, 290, 250, 60);
    [self.view addSubview:_addClassTextField];
    
    
    _addGrateTextField = [[UITextField alloc] init];
    _addGrateTextField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    [_addGrateTextField.layer setMasksToBounds:YES];
    [_addGrateTextField.layer setCornerRadius:9.0];
    _addGrateTextField.placeholder = @"请输入成绩";
    _addGrateTextField.textColor = [UIColor blackColor];
    _addGrateTextField.font = [UIFont systemFontOfSize:23];
    _addGrateTextField.frame = CGRectMake(80, 380, 250, 60);
    [self.view addSubview:_addGrateTextField];
    
    
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
    
    UILabel* grateLabel = [[UILabel alloc] init];
    grateLabel.text = @"成绩:";
    grateLabel.font = [UIFont systemFontOfSize:25];
    grateLabel.textColor = [UIColor whiteColor];
    grateLabel.frame = CGRectMake(13, 398, 63, 30);
    [self.view addSubview:grateLabel];
    
    UIImageView* tipHeadImageView = [[UIImageView alloc] init];
    [tipHeadImageView setImage:[UIImage imageNamed:@"tip5.png"]];
    tipHeadImageView.frame = CGRectMake(60, 40, 280, 115);
    [self.view addSubview:tipHeadImageView];
    
    UIButton* confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(20, 565, 375, 200);
    [confirmButton setImage:[UIImage imageNamed:@"addButton"] forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(pressConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmButton];
}

- (void) pressConfirmButton {
    bool flag = YES;
    for (int i = 0, j = (int)_addPeopleNumber; i < j; i++) {
        if ([_addNameTextField.text isEqualToString:_addNameArray[i]] && [_addClassTextField.text isEqualToString:_addClassArray[i]]) {
            flag = NO;
            UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"该学生已存在" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            }];
            [boomAlert addAction:boomAction];
            [self presentViewController:boomAlert animated:YES completion:nil];
            break;
        }
    }
    if (flag == YES) {
        if ([_addNameTextField.text isEqualToString:@""] || [_addClassTextField.text isEqualToString:@""] || [_addGrateTextField.text isEqualToString:@""]) {
            UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"请补全信息" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            }];
            [boomAlert addAction:boomAction];
            [self presentViewController:boomAlert animated:YES completion:nil];
        } else {
            [_addNameArray addObject:_addNameTextField.text];
            [_addClassArray addObject:_addClassTextField.text];
            [_addGrateArray addObject:_addGrateTextField.text];
            _addPeopleNumber++;
            
            [_delegate sendPeopleNumber:_addPeopleNumber nameArray:_addNameArray classArray:_addClassArray grateArray:_addGrateArray];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_addNameTextField resignFirstResponder];
    [_addClassTextField resignFirstResponder];
    [_addGrateTextField resignFirstResponder];
}
@end

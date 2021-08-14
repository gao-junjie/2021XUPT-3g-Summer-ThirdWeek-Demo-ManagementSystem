//
//  DeleteViewController.m
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "DeleteViewController.h"

@interface DeleteViewController ()

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* registerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainPic2.jpg"]];
    registerImageView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    registerImageView.alpha = 0.7;
    [self.view addSubview:registerImageView];
    
    _deleteNameTextField = [[UITextField alloc] init];
    _deleteNameTextField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    [_deleteNameTextField.layer setCornerRadius:9.0];
    _deleteNameTextField.placeholder = @"请输入姓名";
    _deleteNameTextField.textColor = [UIColor blackColor];
    _deleteNameTextField.font = [UIFont systemFontOfSize:23];
    _deleteNameTextField.frame = CGRectMake(80, 200, 250, 60);
    [self.view addSubview:_deleteNameTextField];
    
    
    _deleteClassTextField = [[UITextField alloc] init];
    _deleteClassTextField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    [_deleteClassTextField.layer setMasksToBounds:YES];
    [_deleteClassTextField.layer setCornerRadius:9.0];
    _deleteClassTextField.placeholder = @"请输入班级";
    _deleteClassTextField.textColor = [UIColor blackColor];
    _deleteClassTextField.font = [UIFont systemFontOfSize:23];
    _deleteClassTextField.frame = CGRectMake(80, 290, 250, 60);
    [self.view addSubview:_deleteClassTextField];
    
    
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
    
    UIImageView* tipHeadImageView = [[UIImageView alloc] init];
    [tipHeadImageView setImage:[UIImage imageNamed:@"tip6.png"]];
    tipHeadImageView.frame = CGRectMake(60, 40, 280, 115);
    [self.view addSubview:tipHeadImageView];
    
    UIButton* confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(20, 565, 375, 200);
    [confirmButton setImage:[UIImage imageNamed:@"deleteButton"] forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(pressConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmButton];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_deleteNameTextField resignFirstResponder];
    [_deleteClassTextField resignFirstResponder];
}

- (void) pressConfirmButton {
    bool flag = NO;
    for (int i = 0, j = (int)_deletePeopleNumber; i < j; i++) {
        if ([_deleteNameTextField.text isEqualToString:_deleteNameArray[i]] && [_deleteClassTextField.text isEqualToString:_deleteClassArray[i]]) {
            flag = YES;
            [_deleteNameArray removeObject:_deleteNameArray[i]];
            [_deleteClassArray removeObject:_deleteClassArray[i]];
            [_deleteGrateArray removeObject:_deleteGrateArray[i]];
            _deletePeopleNumber--;
            break;
        }
    }
    if (flag == YES) {
        [_delegate deleteSendPeopleNumber:_deletePeopleNumber nameArray:_deleteNameArray classArray:_deleteClassArray grateArray:_deleteGrateArray];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
            UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"未找到符合上述信息的学生" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            }];
            [boomAlert addAction:boomAction];
            [self presentViewController:boomAlert animated:YES completion:nil];
    }
}
@end

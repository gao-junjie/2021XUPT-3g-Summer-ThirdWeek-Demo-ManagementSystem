
//
//  SearchViewController.m
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* registerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainPic2.jpg"]];
    registerImageView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    registerImageView.alpha = 0.7;
    [self.view addSubview:registerImageView];
    
    _searchNameTextField = [[UITextField alloc] init];
    _searchNameTextField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    [_searchNameTextField.layer setCornerRadius:9.0];
    _searchNameTextField.placeholder = @"请输入姓名";
    _searchNameTextField.textColor = [UIColor blackColor];
    _searchNameTextField.font = [UIFont systemFontOfSize:23];
    _searchNameTextField.frame = CGRectMake(80, 200, 250, 60);
    [self.view addSubview:_searchNameTextField];
    
    
    _searchClassTextField = [[UITextField alloc] init];
    _searchClassTextField.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    [_searchClassTextField.layer setMasksToBounds:YES];
    [_searchClassTextField.layer setCornerRadius:9.0];
    _searchClassTextField.placeholder = @"请输入班级";
    _searchClassTextField.textColor = [UIColor blackColor];
    _searchClassTextField.font = [UIFont systemFontOfSize:23];
    _searchClassTextField.frame = CGRectMake(80, 290, 250, 60);
    [self.view addSubview:_searchClassTextField];
    
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
    [tipHeadImageView setImage:[UIImage imageNamed:@"tip8.png"]];
    tipHeadImageView.frame = CGRectMake(60, 40, 280, 115);
    [self.view addSubview:tipHeadImageView];
    
    UIButton* confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(20, 565, 375, 200);
    [confirmButton setImage:[UIImage imageNamed:@"searchButton"] forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(pressConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmButton];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchNameTextField resignFirstResponder];
    [_searchClassTextField resignFirstResponder];
}

- (void) pressConfirmButton {
    bool flag = NO;
    for (int i = 0, j = (int)_searchPeopleNumber; i < j; i++) {
        if ([_searchNameTextField.text isEqualToString:@""] && [_searchClassTextField.text isEqualToString:@""]) {
            flag = YES;
            UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"请至少填写一样信息" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            }];
            [boomAlert addAction:boomAction];
            [self presentViewController:boomAlert animated:YES completion:nil];
            break;
        }
        if (([_searchNameTextField.text isEqualToString:_searchNameArray[i]] && [_searchClassTextField.text isEqualToString:@""]) ||
            ([_searchNameTextField.text isEqualToString:@""] && [_searchClassTextField.text isEqualToString:_searchClassArray[i]]) ||
            ([_searchNameTextField.text isEqualToString:_searchNameArray[i]] && [_searchClassTextField.text isEqualToString:_searchClassArray[i]])) {
            flag = YES;
            DisplayViewController* displayViewController = [[DisplayViewController alloc] init];
            displayViewController.displayNameArray = _searchNameArray;
            displayViewController.displayClassArray = _searchClassArray;
            displayViewController.displayGrateArray = _searchGrateArray;
            displayViewController.displayPeopleNumber = _searchPeopleNumber;
            displayViewController.displayNameTextField = _searchNameTextField;
            displayViewController.displayClassTextField = _searchClassTextField;
            [self presentViewController:displayViewController animated:NO completion:nil];
        }
    }
    if (flag == NO) {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"未找到符合上述信息的学生" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *boomAction= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [boomAlert addAction:boomAction];
        [self presentViewController:boomAlert animated:YES completion:nil];
    }
}


@end

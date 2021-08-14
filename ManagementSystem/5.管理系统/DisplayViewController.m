//
//  DisplayViewController.m
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* registerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainPic2.jpg"]];
    registerImageView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    registerImageView.alpha = 0.93;
    [self.view addSubview:registerImageView];
    
    UIImageView* tipHeadImageView = [[UIImageView alloc] init];
    [tipHeadImageView setImage:[UIImage imageNamed:@"tip9.png"]];
    tipHeadImageView.frame = CGRectMake(60, 40, 280, 115);
    [self.view addSubview:tipHeadImageView];
    
    for (int i = 0 ; i < 3; i++) {
        UIImageView* tipHeadImageView = [[UIImageView alloc] init];
        [tipHeadImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tip%d.jpg",i + 2]]];
        tipHeadImageView.frame = CGRectMake(12 + 65 * i + 80 * i, 175, 85, 45);
        [self.view addSubview:tipHeadImageView];
    }
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 240, [UIScreen mainScreen].bounds.size.width, 585) style:UITableViewStylePlain];
    _mainTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_mainTableView];
    _mainTableView.dataSource = self;
    _mainTableView.delegate = self;
    [_mainTableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"first"];
    
    _finalDisplayNameArray = [[NSMutableArray alloc] init];
    _finalDisplayClassArray = [[NSMutableArray alloc] init];
    _finalDisplayGrateArray = [[NSMutableArray alloc] init];
    
    if (![_displayNameTextField.text isEqualToString:@""] && [_displayClassTextField.text isEqualToString:@""]) {
        for (int i = 0, j = (int)_displayPeopleNumber; i < j; i++) {
            if ([_displayNameTextField.text isEqualToString:_displayNameArray[i]]) {
                [_finalDisplayNameArray addObject:_displayNameArray[i]];
                [_finalDisplayClassArray addObject:_displayClassArray[i]];
                [_finalDisplayGrateArray addObject:_displayGrateArray[i]];
                _finalDisplayPeopleNumber++;
            }
        }
    } else if ([_displayNameTextField.text isEqualToString:@""] && ![_displayClassTextField.text isEqualToString:@""]) {
        for (int i = 0, j = (int)_displayPeopleNumber; i < j; i++) {
            if ([_displayClassTextField.text isEqualToString:_displayClassArray[i]]) {
                [_finalDisplayNameArray addObject:_displayNameArray[i]];
                [_finalDisplayClassArray addObject:_displayClassArray[i]];
                [_finalDisplayGrateArray addObject:_displayGrateArray[i]];
                _finalDisplayPeopleNumber++;
            }
        }
    } else {
        for (int i = 0, j = (int)_displayPeopleNumber; i < j; i++) {
            if ([_displayClassTextField.text isEqualToString:_displayClassArray[i]]) {
                [_finalDisplayNameArray addObject:_displayNameArray[i]];
                [_finalDisplayClassArray addObject:_displayClassArray[i]];
                [_finalDisplayGrateArray addObject:_displayGrateArray[i]];
                _finalDisplayPeopleNumber++;
            }
        }
    }
    
    UIButton* confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(160, 635, 90, 90);
    [confirmButton setImage:[UIImage imageNamed:@"tip10.png"] forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(pressConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmButton];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _finalDisplayPeopleNumber;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell* firstCell = [_mainTableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
    firstCell.nameLabel.text = _finalDisplayNameArray[indexPath.row];
    firstCell.classLabel.text = _finalDisplayClassArray[indexPath.row];
    firstCell.grateLabel.text = _finalDisplayGrateArray[indexPath.row];
    firstCell.nameLabel.textColor = [UIColor whiteColor];
    firstCell.classLabel.textColor = [UIColor whiteColor];
    firstCell.grateLabel.textColor = [UIColor whiteColor];
    firstCell.elseLabel.backgroundColor = [UIColor whiteColor];
    
    return firstCell;
}

- (void)pressConfirmButton {
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end

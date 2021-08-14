//
//  SortViewController.m
//  5.管理系统
//
//  Created by mac on 2021/8/6.
//  Copyright © 2021 mac. All rights reserved.
//

#import "SortViewController.h"

@interface SortViewController ()

@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* registerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainPic2.jpg"]];
    registerImageView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    registerImageView.alpha = 0.7;
    [self.view addSubview:registerImageView];
    
    UIImageView* tipHeadImageView = [[UIImageView alloc] init];
    [tipHeadImageView setImage:[UIImage imageNamed:@"tip12.png"]];
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
    
    
    int all = (int)_sortNameArray.count;
    for (int i = 0; i < all; i++) {
        for (int j = 0; j < all - i - 1; j++) {
            NSString* tempString = _sortGrateArray[j];
            NSString* tempStringLater = _sortGrateArray[j + 1];
            float tempFloat = [tempString floatValue];
            float tempFloatLater = [tempStringLater floatValue];
            if (tempFloat < tempFloatLater) {
                [_sortGrateArray replaceObjectAtIndex:j withObject:tempStringLater];
                [_sortGrateArray replaceObjectAtIndex:j + 1 withObject:tempString];
                
                NSString* tempName = _sortNameArray[j];
                [_sortNameArray replaceObjectAtIndex:j withObject:_sortNameArray[j + 1]];
                [_sortNameArray replaceObjectAtIndex:j + 1 withObject:tempName];
                
                NSString* tempClass = _sortClassArray[j];
                [_sortClassArray replaceObjectAtIndex:j withObject:_sortClassArray[j + 1]];
                [_sortClassArray replaceObjectAtIndex:j + 1 withObject:tempClass];
            }
        }
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _sortNameArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell* firstCell = [_mainTableView dequeueReusableCellWithIdentifier:@"first" forIndexPath:indexPath];
    firstCell.nameLabel.text = _sortNameArray[indexPath.row];
    firstCell.classLabel.text = _sortClassArray[indexPath.row];
    firstCell.grateLabel.text = _sortGrateArray[indexPath.row];
    firstCell.nameLabel.textColor = [UIColor whiteColor];
    firstCell.classLabel.textColor = [UIColor whiteColor];
    firstCell.grateLabel.textColor = [UIColor whiteColor];
    firstCell.elseLabel.backgroundColor = [UIColor whiteColor];
    
    return firstCell;
}

@end

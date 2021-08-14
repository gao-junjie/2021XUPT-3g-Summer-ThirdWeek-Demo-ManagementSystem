//
//  SortViewController.h
//  5.管理系统
//
//  Created by mac on 2021/8/6.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"
#import "FirstTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface SortViewController : ViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* mainTableView;
@property (nonatomic, strong) NSMutableArray* sortNameArray;
@property (nonatomic, strong) NSMutableArray* sortClassArray;
@property (nonatomic, strong) NSMutableArray* sortGrateArray;
@end

NS_ASSUME_NONNULL_END

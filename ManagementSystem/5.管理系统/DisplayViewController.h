//
//  DisplayViewController.h
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"
#import "FirstTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DisplayViewController : ViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* mainTableView;
@property (strong, nonatomic) UITextField* displayNameTextField;
@property (strong, nonatomic) UITextField* displayClassTextField;
@property (nonatomic, strong) NSMutableArray* displayNameArray;
@property (nonatomic, strong) NSMutableArray* displayClassArray;
@property (nonatomic, strong) NSMutableArray* displayGrateArray;
@property (nonatomic, assign) NSInteger displayPeopleNumber;
@property (nonatomic, strong) NSMutableArray* finalDisplayNameArray;
@property (nonatomic, strong) NSMutableArray* finalDisplayClassArray;
@property (nonatomic, strong) NSMutableArray* finalDisplayGrateArray;
@property (nonatomic, assign) NSInteger finalDisplayPeopleNumber;

@end

NS_ASSUME_NONNULL_END

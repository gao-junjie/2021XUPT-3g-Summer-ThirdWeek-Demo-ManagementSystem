//
//  SearchViewController.h
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"
#import "DisplayViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : ViewController
@property (nonatomic, strong) NSMutableArray* searchNameArray;
@property (nonatomic, strong) NSMutableArray* searchClassArray;
@property (nonatomic, strong) NSMutableArray* searchGrateArray;
@property (nonatomic, assign) NSInteger searchPeopleNumber;
@property (strong, nonatomic) UITextField* searchNameTextField;
@property (strong, nonatomic) UITextField* searchClassTextField;

@end

NS_ASSUME_NONNULL_END

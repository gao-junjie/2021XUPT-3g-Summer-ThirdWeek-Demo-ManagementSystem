//
//  MainViewController.h
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"
#import "FirstTableViewCell.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "SearchViewController.h"
#import "SortViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : ViewController <UITableViewDelegate, UITableViewDataSource, AddSendInformationDelegate, DeleteSendInformationDelegate, ChangeSendInformationDelegate>

@property (nonatomic, strong) UITableView* mainTableView;
@property (nonatomic, strong) NSMutableArray* nameArray;
@property (nonatomic, strong) NSMutableArray* classArray;
@property (nonatomic, strong) NSMutableArray* grateArray;
@property (nonatomic, assign) NSInteger peopleNumber;

- (void)sendPeopleNumber:(NSInteger)addPeopleNumber nameArray:(NSMutableArray*_Nullable)addNameArray classArray:(NSMutableArray*_Nullable)addClassArray grateArray:(NSMutableArray*_Nullable)addGrateArray;

- (void)deleteSendPeopleNumber:(NSInteger)deletePeopleNumber nameArray:(NSMutableArray*_Nullable)deleteNameArray classArray:(NSMutableArray*_Nullable)deleteClassArray grateArray:(NSMutableArray*_Nullable)deleteGrateArray;

- (void)changeSendGrateArray:(NSMutableArray*_Nullable)changeGrateArray;

@end

NS_ASSUME_NONNULL_END

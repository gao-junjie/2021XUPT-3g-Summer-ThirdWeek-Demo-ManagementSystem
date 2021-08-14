//
//  AddViewController.h
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

@protocol AddSendInformationDelegate <NSObject>

- (void)sendPeopleNumber:(NSInteger)addPeopleNumber nameArray:(NSMutableArray*_Nullable)addNameArray classArray:(NSMutableArray*_Nullable)addClassArray grateArray:(NSMutableArray*_Nullable)addGrateArray;

@end

NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : ViewController
@property (nonatomic, strong) NSMutableArray* addNameArray;
@property (nonatomic, strong) NSMutableArray* addClassArray;
@property (nonatomic, strong) NSMutableArray* addGrateArray;
@property (nonatomic, assign) NSInteger addPeopleNumber;
@property (strong, nonatomic) UITextField* addNameTextField;
@property (strong, nonatomic) UITextField* addClassTextField;
@property (strong, nonatomic) UITextField* addGrateTextField;
@property (nonatomic, assign) id<AddSendInformationDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

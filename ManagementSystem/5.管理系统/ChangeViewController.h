//
//  ChangeViewController.h
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

@protocol ChangeSendInformationDelegate <NSObject>

- (void)changeSendGrateArray:(NSMutableArray*_Nullable)changeGrateArray;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ChangeViewController : ViewController
@property (nonatomic, strong) NSMutableArray* changeNameArray;
@property (nonatomic, strong) NSMutableArray* changeClassArray;
@property (nonatomic, strong) NSMutableArray* changeGrateArray;
@property (nonatomic, assign) NSInteger changePeopleNumber;
@property (strong, nonatomic) UITextField* changeNameTextField;
@property (strong, nonatomic) UITextField* changeClassTextField;
@property (strong, nonatomic) UITextField* changeGrateTextField;
@property (nonatomic, assign) id<ChangeSendInformationDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

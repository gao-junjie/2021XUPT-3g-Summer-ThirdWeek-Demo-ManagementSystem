//
//  DeleteViewController.h
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

@protocol DeleteSendInformationDelegate <NSObject>

- (void)deleteSendPeopleNumber:(NSInteger)deletePeopleNumber nameArray:(NSMutableArray*_Nullable)deleteNameArray classArray:(NSMutableArray*_Nullable)deleteClassArray grateArray:(NSMutableArray*_Nullable)deleteGrateArray;

@end

NS_ASSUME_NONNULL_BEGIN

@interface DeleteViewController : ViewController
@property (nonatomic, strong) NSMutableArray* deleteNameArray;
@property (nonatomic, strong) NSMutableArray* deleteClassArray;
@property (nonatomic, strong) NSMutableArray* deleteGrateArray;
@property (nonatomic, assign) NSInteger deletePeopleNumber;
@property (strong, nonatomic) UITextField* deleteNameTextField;
@property (strong, nonatomic) UITextField* deleteClassTextField;
@property (strong, nonatomic) UITextField* deleteGrateTextField;
@property (nonatomic, assign) id<DeleteSendInformationDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

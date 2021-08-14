//
//  LandingViewController.h
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "MainViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LandingViewController : ViewController <UITextFieldDelegate,RegisterDelegate>

- (void)saveUser:(NSMutableArray *_Nonnull)userArray;

@property (strong, nonatomic) UITextField* landingAccountTextField;
@property (strong, nonatomic) UITextField* landingPasswordTextField;
@property (nonatomic, copy) NSString* accountUserWord;
@property (nonatomic, copy) NSString* accountPassword;
@property (nonatomic, copy) NSString* realAccountUserWord;
@property (nonatomic, copy) NSString* realAccountPassword;

@end

NS_ASSUME_NONNULL_END

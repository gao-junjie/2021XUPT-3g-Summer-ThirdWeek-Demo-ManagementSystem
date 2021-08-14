//
//  RegisterViewController.h
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

@protocol RegisterDelegate <NSObject>

- (void)saveUser:(NSMutableArray *_Nonnull)userArray;

@end

NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewController : ViewController <UITextFieldDelegate>
@property (strong, nonatomic) UITextField* landingAccountTextField;
@property (strong, nonatomic) UITextField* landingPasswordTextField;
@property (nonatomic, copy) NSString* registerUserWord;
@property (nonatomic, copy) NSString* registerPassword;
@property (strong, nonatomic) NSMutableArray* userArray;
@property (assign, nonatomic) id<RegisterDelegate> delegate;
@end

NS_ASSUME_NONNULL_END

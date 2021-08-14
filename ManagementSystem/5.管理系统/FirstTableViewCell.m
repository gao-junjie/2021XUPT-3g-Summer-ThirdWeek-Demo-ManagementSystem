//
//  FirstTableViewCell.m
//  5.管理系统
//
//  Created by mac on 2021/8/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"first"]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:22];
        [self.contentView addSubview:_nameLabel];
        
        _classLabel = [[UILabel alloc] init];
        _classLabel.textColor = [UIColor blackColor];
        _classLabel.font = [UIFont systemFontOfSize:22];
        [self.contentView addSubview:_classLabel];
        
        _grateLabel = [[UILabel alloc] init];
        _grateLabel.textColor = [UIColor blackColor];
        _grateLabel.font = [UIFont systemFontOfSize:22];
        [self.contentView addSubview:_grateLabel];
        
        _elseLabel = [[UILabel alloc] init];
        _elseLabel.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:_elseLabel];
    }
    return self;
}

- (void)layoutSubviews {
    _nameLabel.frame = CGRectMake(18, 20, 90, 30);
    _classLabel.frame = CGRectMake(155, 20, 110, 30);
    _grateLabel.frame = CGRectMake(315, 20, 70, 30);
    _elseLabel.frame = CGRectMake(17, 70, [[UIScreen mainScreen] bounds].size.width - 38, 1);
}

@end

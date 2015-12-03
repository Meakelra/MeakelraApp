//
//  AutoHeightTableViewCell.m
//  Meakelra
//
//  Created by 潘颖超 on 15/12/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "AutoHeightTableViewCell.h"

@implementation AutoHeightTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        @property (strong, nonatomic) UIImageView *iconView;
//        @property (strong, nonatomic) UILabel     *nameLabel;
//        @property (strong, nonatomic) UILabel     *bodyLabel;
//        @property (strong, nonatomic) UIImageView *imgView;
//        @property (strong, nonatomic) UILabel     *dateLabel;
        
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        self.iconView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.iconView];
        
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 90, 120, 120)];
        self.imgView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.imgView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 10, 200, 20)];
        self.nameLabel.backgroundColor = [UIColor clearColor];
        self.nameLabel.font = [UIFont systemFontOfSize:16.0];
        [self.contentView addSubview:self.nameLabel];
        
        self.bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 40, 200, 40)];
        self.bodyLabel.backgroundColor = [UIColor clearColor];
        self.bodyLabel.font = [UIFont systemFontOfSize:14.0];
        self.bodyLabel.numberOfLines = 0;
        [self.contentView addSubview:self.bodyLabel];

        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 220, 230, 20)];
        self.dateLabel.backgroundColor = [UIColor clearColor];
        self.dateLabel.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:self.dateLabel];

        

        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

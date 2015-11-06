//
//  YZBigDataTableViewCell.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/2.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZBigDataTableViewCell.h"
#import "YZBigListData.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation YZBigDataTableViewCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
    }
    return self;
}

- (YZBigDataTableViewCell *)bigDataCellWithData:(id)bigDataObject{
    YZBigListData *data = (YZBigListData *)bigDataObject;
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:data.pic_url] placeholderImage:[UIImage imageNamed:@"listPlaceholder"]];
    self.headerImageView.layer.cornerRadius = 5.0f;
    self.headerImageView.clipsToBounds = YES;
    self.clipsToBounds = YES;
    self.graybackgroundView.layer.cornerRadius = 5.0f;
    
    self.typeLabel.text = data.type;
    self.typeLabel.layer.cornerRadius = 5.0f;
    self.typeLabel.clipsToBounds = YES;
    
    self.titleLabel.text = data.title;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.timeLabel.text = data.time;
    self.descripeLabel.text = data.discribe;
    self.favoriteLabel.text = data.sold;
    self.nowPriceLabel.text = [NSString stringWithFormat:@"¥%@",data.now_price];
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",data.old_price]];
    [attrStr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, attrStr.length)];
    self.oldPriceLabel.attributedText = attrStr;
    
    if (data.source != nil && ![data.source isEqualToString:@""]) {
        self.sourceLabel.text = data.source;
    }else{
        self.sourceLabel.text = @"天猫";
    }
    
    if (data.type != nil && [data.type isEqualToString:@"搭配"]) {
        self.nextOpLabel.text = @"更多推荐➲";
    }else if(data.type != nil && [data.type isEqualToString:@"精品"]){
        self.nextOpLabel.text = @"点击购买➲";
    }else{
        self.nextOpLabel.text = @"呵呵!";
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

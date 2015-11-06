//
//  YZListDataCellTableViewCell.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/31.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZListDataCellTableViewCell.h"
#import "YZListData.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation YZListDataCellTableViewCell

- (YZListDataCellTableViewCell *)listDataCell:(YZListDataCellTableViewCell *)listDataCell withData:(id)listDataObject{
    YZListData *data = (YZListData *)listDataObject;
    
    [listDataCell.headImageView sd_setImageWithURL:[NSURL URLWithString:data.pic_url] placeholderImage:[UIImage imageNamed:@"listPlaceholder"]];
    listDataCell.headImageView.layer.cornerRadius = 5.0f;
    listDataCell.headImageView.clipsToBounds = YES;
    listDataCell.titleLabel.text = data.title;
    if (data.now_price != 0) {
        listDataCell.nowPriceLabel.text = [NSString stringWithFormat:@"¥%.2f",data.now_price];
    }else{
        listDataCell.nowPriceLabel.text = @"往期";
    }
    listDataCell.discountLabel.text = [NSString stringWithFormat:@"%.1f折／包邮",data.discount];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%.2f",data.origin_price]];
    [attrStr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, attrStr.length)];
    listDataCell.originPriceLabel.attributedText = attrStr;
    return listDataCell;
}
/*
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
*/

@end

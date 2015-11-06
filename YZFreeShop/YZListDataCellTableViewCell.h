//
//  YZListDataCellTableViewCell.h
//  YZFreeShop
//
//  Created by lunarboat on 15/10/31.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZListDataCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nowPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *originPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;

- (YZListDataCellTableViewCell *)listDataCell:(YZListDataCellTableViewCell *)listDataCell withData:(id)listDataObject;
@end

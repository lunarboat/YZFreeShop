//
//  YZMemberCenterViewController.h
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MemberBaseOp) {
    MemberOpMYOrder,
    MemberOpShoppingCar,
    MemberOpTransport
};
typedef NS_ENUM(NSInteger, MemberSystemOp) {
    MemberOpUserType,
    MemberOpClearCache
};
typedef NS_ENUM(NSInteger, MemberOtherOp) {
    MemberOpPei,
    MemberOpHelp,
    MemberOpAbout
};

@interface YZMemberCenterViewController : UITableViewController

@end

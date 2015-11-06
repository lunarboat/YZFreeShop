//
//  YZSlideMainViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/5.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZSlideMainViewController.h"

@interface YZSlideMainViewController ()

@end

@implementation YZSlideMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (NSString *)segueIdentifierForIndexPathInRightMenu:(NSIndexPath *)indexPath{
    NSString *identifier = @"";
    switch (indexPath.row) {
        case 0:
            identifier = @"HomeContentMenu";
            break;
        case 2:
            identifier = @"PayAccount";
            break;
        default:
            identifier = @"TableMenu";
            break;
    }    
    return identifier;
    
}
- (void)configureRightMenuButton:(UIButton *)button
{
    CGRect frame = button.frame;
    frame = CGRectMake(0, 0, 30, 30);
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    [button setImage:[UIImage imageNamed:@"ico_center_dis"] forState:UIControlStateNormal];
}

- (void) configureSlideLayer:(CALayer *)layer
{
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 1;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowRadius = 5;
    layer.masksToBounds = NO;
    layer.shadowPath =[UIBezierPath bezierPathWithRect:self.view.layer.bounds].CGPath;
}

- (UIViewAnimationOptions) openAnimationCurve {
    return UIViewAnimationOptionCurveEaseOut;
}

- (UIViewAnimationOptions) closeAnimationCurve {
    return UIViewAnimationOptionCurveEaseOut;
}
- (CGFloat)maxDarknessWhileRightMenu
{
    return 0.5;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

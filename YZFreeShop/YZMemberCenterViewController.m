//
//  YZMemberCenterViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZMemberCenterViewController.h"
#import "NSDictionary+setNavigationBarTitleColor.h"
#import "HFStretchableTableHeaderView.h"
#import "YZUserTypeViewController.h"
#import <SDWebImage/SDImageCache.h>

#define MYTaoBaoURLString @"http://h5.m.taobao.com/awp/mtb/olist.htm?sta=4&target=present&ttid=400000_21517587@jkjby_iPhone_1.0"
#define MYOrderURLString @"http://h5.m.taobao.com/mlapp/olist.html?tabCode=all&sta=4&target=present&ttid=400000_21517587%40jkjby_iPhone_1.0"
#define MYShoppingCarURLString @"http://d.m.taobao.com/my_bag.htm?target=present&ttid=400000_21517587@jkjby_iPhone_1.0";
#define MYTransportURLString @"http://h5.m.taobao.com/awp/mtb/olist.htm?sta=5&target=present&ttid=400000_21517587@jkjby_iPhone_1.0"
#define ProblemHelp @"http://app.api.repaiapp.com/sx/songshijie/jiuweb/problem_i.php"

@interface YZMemberCenterViewController ()<UITableViewDelegate>{
    YZUserTypeViewController *vc;
}
@property (weak, nonatomic) IBOutlet UIView *stretchView;
@property (weak, nonatomic) IBOutlet UILabel *userTypeLabel;
@property (nonatomic, strong) HFStretchableTableHeaderView *stretchHeader;
@end

@implementation YZMemberCenterViewController

#pragma mark - ViewControllerLifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self stretchHeader];
}
//设置状态栏隐藏
- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - initial stretchHeader
- (HFStretchableTableHeaderView *)stretchHeader{
    _stretchHeader = [HFStretchableTableHeaderView new];
    [_stretchHeader stretchHeaderForTableView:self.tableView withView:_stretchView];
    return _stretchHeader;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_stretchHeader scrollViewDidScroll:scrollView];
}

- (void)viewDidLayoutSubviews
{
    [_stretchHeader resizeView];
}


#pragma mark - target & response
- (IBAction)loginTBClick:(id)sender {
    NSLog(@"loginTB");
    YZWebViewController *webVc = [self getWebViewControllerFromMainStoryBoard];
    webVc.RequestURLString = MYTaoBaoURLString;
    [self.navigationController pushViewController:webVc animated:YES];
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            YZWebViewController *webVc = [self getWebViewControllerFromMainStoryBoard];
            switch (indexPath.row) {
                case MemberOpMYOrder:
                    webVc.RequestURLString = MYOrderURLString;
                    break;
                case MemberOpShoppingCar:
                    webVc.RequestURLString = MYShoppingCarURLString;
                    break;
                case MemberOpTransport:
                    webVc.RequestURLString = MYTransportURLString;
                    break;
                default:
                    break;
            }
            [self.navigationController pushViewController:webVc animated:YES];
        }
            break;
        case 1:
            switch (indexPath.row) {
                case MemberOpUserType:
                    break;
                case MemberOpClearCache:
//                    NSLog(@"CleanCache");
//                    NSLog(@"缓存大小:%ld 磁盘大小%ld",[[SDImageCache sharedImageCache]getSize],[[SDImageCache sharedImageCache]getDiskCount]);
                    [[SDImageCache sharedImageCache]clearDiskOnCompletion:^{
                         [self.view showLabel:@"清理完成"];
                    }];
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case MemberOpPei:
                    NSLog(@"Pei");
                    break;
                case MemberOpHelp:{
                    YZWebViewController *webVc = [self getWebViewControllerFromMainStoryBoard];
                    webVc.RequestURLString = ProblemHelp;
                    [self.navigationController pushViewController:webVc animated:YES];
                }
                    break;
                case MemberOpAbout:
                    NSLog(@"AboutUs");
                    break;
            }
            break;
        default:
            break;
    }
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ToUserTypeVC"]) {
        vc = [segue destinationViewController];
        vc.lastType = _userTypeLabel.text;
        [vc addObserver:self forKeyPath:@"lastType" options:NSKeyValueObservingOptionNew context:NULL];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([object isKindOfClass:[YZUserTypeViewController class]]) {
            if ([keyPath isEqualToString:@"lastType"]) {
                NSString *type = [change objectForKey:@"new"];
                self.userTypeLabel.text = type;
                [vc removeObserver:self forKeyPath:@"lastType"];
            }
    }
}



@end

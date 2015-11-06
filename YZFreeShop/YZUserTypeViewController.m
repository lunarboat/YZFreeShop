//
//  YZUserTypeViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/4.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZUserTypeViewController.h"
#define SuperViewSize self.view.bounds.size
#define ImageWidth 80.0
#define CancelBtnWidth 30.0
#define LabelWidth 40
#define LabelHeight 20
#define ButtonInsetHeight SuperViewSize.width / 3
#define rowsNumber 2
#define colsNumber 2
#define ButtonPadding (SuperViewSize.width - 2 * ImageWidth) / 3

@interface YZUserTypeViewController (){
    NSMutableArray *_labelArr;
}

@property (nonatomic, copy) NSArray *labelTextArr;

@property (nonatomic, copy) NSArray *imageArr;

@end

@implementation YZUserTypeViewController

- (NSArray *)labelTextArr{
    return @[@"美女", @"帅哥", @"辣妈", @"屌丝"];
}
- (NSArray *)imageArr{
    return @[[UIImage imageNamed:@"btn_sex_girl"], [UIImage imageNamed:@"btn_find_boy"], [UIImage imageNamed:@"btn_sex_hostess"], [UIImage imageNamed:@"btn_find_loser"]];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    _labelArr = [[NSMutableArray alloc]initWithCapacity:rowsNumber * colsNumber];
    //加载按钮
    [self loadBtn];
    
    [self loadCancelBtn];
    
    [self selectedType];
}

#pragma mark - loadButton & label
- (void)loadBtn{
    for (int i=0; i<colsNumber; i++) {
        for (int j=0; j<rowsNumber; j++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(ButtonPadding + (ImageWidth +  ButtonPadding) * i , ButtonInsetHeight + 40 + (ImageWidth +  ButtonPadding) * j, ImageWidth, ImageWidth);
            button.tag = i * colsNumber + j + 100;
            button.backgroundColor = [UIColor grayColor];
            button.layer.cornerRadius = ImageWidth / 2;
            button.clipsToBounds = YES;
            [button setBackgroundImage:[self.imageArr objectAtIndex:i * rowsNumber + j] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, LabelWidth, LabelHeight)];
            label.center = CGPointMake(button.center.x, button.center.y + ImageWidth / 2 + LabelHeight / 2);
            label.layer.cornerRadius = LabelHeight / 2;
            label.clipsToBounds = YES;
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:13];
            label.text = self.labelTextArr[i * colsNumber + j];
            [self.view addSubview:label];
            [_labelArr addObject:label];
        }
    }
}

- (void)loadCancelBtn{
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, 0, CancelBtnWidth, CancelBtnWidth);
    cancelBtn.center = CGPointMake(self.view.center.x, SuperViewSize.height - 50);
    cancelBtn.tag = 104;
    cancelBtn.layer.cornerRadius = CancelBtnWidth / 2;
    cancelBtn.clipsToBounds = YES;
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"noConnection"] forState:UIControlStateNormal];
    cancelBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:cancelBtn];
    [cancelBtn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - 判断传过来的类型
- (void)selectedType{
    for (UILabel *label in _labelArr) {
        if ([label.text isEqualToString:self.lastType]) {
            label.backgroundColor = GetMainColor;
            label.textColor = [UIColor whiteColor];
        }
    }
}

- (void)clicked:(UIButton *)sender{
    NSString *newType = nil;
    if (sender.tag - 100 == 4) {
        newType = self.lastType;
    }else{
        newType = [self.labelTextArr objectAtIndex:sender.tag - 100];
    }
    self.lastType = newType;
    [self.navigationController popViewControllerAnimated:YES];
    
}



@end

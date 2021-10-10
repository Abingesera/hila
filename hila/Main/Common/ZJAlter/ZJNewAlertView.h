//
//  ZJNewAlertView.h
//  NewHoldGold
//
//  Created by 掌金 on 2019/12/23.
//  Copyright © 2019 掌金. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZJNewAlertView : UIView

typedef void(^AlertResult)(NSInteger index);
typedef void(^AlertMaxMin)(NSInteger index,BOOL isShowGoldLine,BOOL isCanSet,NSString *maxPoint,NSString *minpoint);
typedef void(^AlertCurrentPrice)(NSInteger index,NSString *currentPrice);

@property (nonatomic,copy) AlertResult resultIndex;
@property (nonatomic,copy) AlertMaxMin maxMinIndex;
@property (nonatomic,copy) AlertCurrentPrice currentPrice;

@property (nonatomic,strong)UISwitch *openSwitch;
@property (nonatomic,strong)UISwitch *setSwitch;
@property (nonatomic,strong)UITextField *maxTF;
@property (nonatomic,strong)UITextField *minTF;

@property (nonatomic,strong)UIView *whiteView;

@property (nonatomic,strong)UITextField *currentTF;
@property (nonatomic,copy)NSString *currentTid;

@property (nonatomic,assign)int timeDec;
@property (nonatomic,strong)NSTimer *myTimer;

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle;

//注销失败
- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title subTitle:(NSString *)subTitle messageArr:(NSArray *)messageArr cancleBtn:(NSString *)cancleTitle;

//10.0 弹窗协议
- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title message:(NSString *)message importantMsg:(NSString *)importantMsg sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle viewController:(UIViewController *)vc;

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title subTitle:(NSString *)subTitle botMessage:(NSString *)botMessage cancleBtn:(NSString *)cancleTitle sureBtn:(NSString *)sureBtn;



//K线 黄金分割线 设置
- (instancetype)initWithFrame:(CGRect)frame isShow:(BOOL)isShow isSet:(BOOL)isSet maxPoint:(NSString *)maxPoint minPoint:(NSString *)minPoint isLevel:(BOOL)isLevel;


//公告
- (instancetype)initRealNameAlterWithFrame:(CGRect)frame subTitle:(NSString *)subTitle isTimer:(BOOL)isTimer;


@end


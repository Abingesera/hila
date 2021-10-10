//
//  ZJNewAlertView.m
//  NewHoldGold
//
//  Created by 掌金 on 2019/12/23.
//  Copyright © 2019 掌金. All rights reserved.
//

#import "ZJNewAlertView.h"

@interface ZJNewAlertView ()


@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)UILabel *messageLab;
@property (nonatomic,strong)UIButton *leftBtn;
@property (nonatomic,strong)UIButton *rightBtn;

@property (nonatomic,strong)UILabel *botMessageLab;

@property (nonatomic,strong)UIImageView *introImg;

@property (nonatomic,strong)UITextView *messageText;

@end

@implementation ZJNewAlertView

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle {
    
   if ( self = [super initWithFrame:frame]) {
    
       
        self.backgroundColor = [[@"#000000" hexStringToColor] colorWithAlphaComponent:0.5];
        
        self.whiteView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-280)/2, (SCREEN_HEIGHT-HOME_INDICATOR_HEIGHT-144)/2, 280, 144)];
        self.whiteView.backgroundColor = [@"#FFFFFF" hexStringToColor];
        self.whiteView.layer.masksToBounds = YES;
        self.whiteView.layer.cornerRadius = 8.f;
        [self addSubview:self.whiteView];
        
        self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.whiteView.width, 24)];
        self.titleLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setMediumFontWithSizeNumber:ZJFontFiveSizeNumber],NSForegroundColorAttributeName:[@"#2A323A" hexStringToColor]} string:title];
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        [self.whiteView addSubview:self.titleLab];
        
        self.messageLab = [[UILabel alloc]initWithFrame:CGRectMake(0, self.titleLab.bottom+8, self.whiteView.width, 24)];
        self.messageLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontFiveSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]} string:message];
        self.messageLab.textAlignment = NSTextAlignmentCenter;
        [self.whiteView addSubview:self.messageLab];
        
        UIView *botView = [[UIView alloc]initWithFrame:CGRectMake(0, self.whiteView.height-49, self.whiteView.width, 49)];
        botView.backgroundColor = [@"#F5F5F9" hexStringToColor];
        [self.whiteView addSubview:botView];
        
        
        self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftBtn.frame = CGRectMake(0, 0, botView.width/2, botView.height);
        [self.leftBtn setTitle:cancleTitle forState:UIControlStateNormal];
        [self.leftBtn setTitleColor:[@"#85919C" hexStringToColor] forState:UIControlStateNormal];
        self.leftBtn.titleLabel.font = [ZJFont setRegularFontWithSizeNumber:ZJFontSixSizeNumber];
        [botView addSubview:self.leftBtn];
        self.leftBtn.tag = 1000;
        [self.leftBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightBtn.frame = CGRectMake(self.leftBtn.right, 0, botView.width/2, botView.height);
        [self.rightBtn setTitle:sureTitle forState:UIControlStateNormal];
        [self.rightBtn setTitleColor:[@"#4285F4" hexStringToColor] forState:UIControlStateNormal];
        self.rightBtn.titleLabel.font = [ZJFont setMediumFontWithSizeNumber:ZJFontSixSizeNumber];
        [botView addSubview:self.rightBtn];
        self.rightBtn.tag = 1001;
        [self.rightBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    }
    
     return self;
    
}


- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title subTitle:(NSString *)subTitle messageArr:(NSArray *)messageArr cancleBtn:(NSString *)cancleTitle {
    
    if ( self = [super initWithFrame:frame]) {
        
    
        self.backgroundColor = [[@"#000000" hexStringToColor] colorWithAlphaComponent:0.5];
        
        
        CGFloat whiteHeight = 90+15+49;
        
        CGFloat subTitleHeight = [PublicTool caluContent:subTitle Width:NO lineDic:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontFiveSizeNumber]} rectSize:CGSizeMake(280 - 50*AutoSizeScaleXX, CGFLOAT_MAX)];
        
        if (subTitleHeight > 300) {
            subTitleHeight = 300;
        }
        
        if (subTitleHeight > 26) {
            whiteHeight = 52+21+49+subTitleHeight;
        }
        
        if (messageArr.count > 0) {
            
            for (int i = 0; i < messageArr.count; i++) {
                NSString *messageString = [NSString stringWithFormat:@"%d.%@",i+1,messageArr[i]];
                CGFloat messageHeight = [PublicTool caluContent:messageString Width:NO lineDic:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontOneSizeNumber]} rectSize:CGSizeMake(280 - 88*AutoSizeScaleXX, CGFLOAT_MAX)];
                whiteHeight += messageHeight;
            }
            
        }else {
            
        }
        
        
        self.whiteView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-280)/2, (SCREEN_HEIGHT-HOME_INDICATOR_HEIGHT-whiteHeight)/2, 280, whiteHeight)];
        self.whiteView.backgroundColor = [@"#FFFFFF" hexStringToColor];
        self.whiteView.layer.masksToBounds = YES;
        self.whiteView.layer.cornerRadius = 8.f;
        
        
        self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.whiteView.width, 24)];
        self.titleLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setMediumFontWithSizeNumber:ZJFontFiveSizeNumber],NSForegroundColorAttributeName:[@"#2A323A" hexStringToColor]} string:title];
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        [self.whiteView addSubview:self.titleLab];
        
        //针对超长的内容，滑动处理
        if (subTitleHeight < 300) {
            //副标题
            self.messageLab = [[UILabel alloc]initWithFrame:CGRectMake(0, self.titleLab.bottom+15, self.whiteView.width, 24)];
            if (subTitleHeight > 26) {
                self.messageLab.frame = CGRectMake(25*AutoSizeScaleXX, self.titleLab.bottom+8, self.whiteView.width-50*AutoSizeScaleXX, subTitleHeight);
                self.messageLab.numberOfLines = 0;
                self.messageLab.lineBreakMode = NSLineBreakByCharWrapping;
                self.messageLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontFiveSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]} string:subTitle];
            }else {
                self.messageLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontFourSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]} string:subTitle];
            }
            
            self.messageLab.textAlignment = NSTextAlignmentCenter;
            [self.whiteView addSubview:self.messageLab];
        }else {
            
            self.messageText = [[UITextView alloc]initWithFrame:CGRectMake(0, self.titleLab.bottom+15, self.whiteView.width, subTitleHeight)];
            self.messageText.backgroundColor = [UIColor clearColor];
            self.messageText.editable = NO;
            self.messageText.scrollEnabled = YES;
            self.messageText.showsVerticalScrollIndicator = YES;
            self.messageText.showsHorizontalScrollIndicator = NO;
            self.messageText.attributedText =[PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontFiveSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]} string:subTitle];
            [self.whiteView addSubview:self.messageText];
            self.messageText.textAlignment = NSTextAlignmentCenter;
        }
        
        
     
        if (messageArr.count > 0) {
            CGFloat bottomHeight = self.messageLab.bottom+7;
            for (int i = 0; i < messageArr.count; i++) {
                NSString *messageString = [NSString stringWithFormat:@"%d.%@",i+1,messageArr[i]];
                UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(44*AutoSizeScaleXX, bottomHeight, self.whiteView.width-88*AutoSizeScaleXX, [PublicTool caluContent:messageString Width:NO lineDic:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontOneSizeNumber]} rectSize:CGSizeMake(280 - 88*AutoSizeScaleXX, CGFLOAT_MAX)])];
                bottomHeight = lab.bottom;
                lab.numberOfLines = 0;
                lab.lineBreakMode = NSLineBreakByCharWrapping;
                lab.attributedText =[PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontOneSizeNumber],NSForegroundColorAttributeName:[@"#2B4159" hexStringToColor]} string:messageString];
                lab.textAlignment = NSTextAlignmentLeft;
                [self.whiteView addSubview:lab];
            }
            
        }else {
            
        }
        
        [self addSubview:self.whiteView];
        
        UIView *botView = [[UIView alloc]initWithFrame:CGRectMake(0, self.whiteView.height-49, self.whiteView.width, 49)];
        botView.backgroundColor = [@"#F5F5F9" hexStringToColor];
        [self.whiteView addSubview:botView];
        
        
        self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftBtn.frame = CGRectMake(0, 0, botView.width, botView.height);
        [self.leftBtn setTitle:cancleTitle forState:UIControlStateNormal];
        [self.leftBtn setTitleColor:[@"#4285F4" hexStringToColor] forState:UIControlStateNormal];
        self.leftBtn.titleLabel.font = [ZJFont setMediumFontWithSizeNumber:ZJFontSixSizeNumber];
        [botView addSubview:self.leftBtn];
        self.leftBtn.tag = 1000;
        [self.leftBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
      
    }
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title subTitle:(NSString *)subTitle botMessage:(NSString *)botMessage cancleBtn:(NSString *)cancleTitle sureBtn:(NSString *)sureBtn{
    
    if ( self = [super initWithFrame:frame]) {
        
       
        self.backgroundColor = [[@"#000000" hexStringToColor] colorWithAlphaComponent:0.5];
        
        
        CGFloat whiteHeight = 52+20+49;
        if (!kStringIsEmpty(botMessage)) {
            whiteHeight += 24;
        }
        CGFloat subTitleHeight = 0;
        if (!kStringIsEmpty(subTitle)) {
            subTitleHeight = [PublicTool caluContent:subTitle Width:NO lineDic:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontFiveSizeNumber]} rectSize:CGSizeMake(280 - 50*AutoSizeScaleXX, CGFLOAT_MAX)];
            
            if (subTitleHeight > 300) {
                       subTitleHeight = 300;
                   }
            
            if (subTitleHeight > 26) {
                whiteHeight += subTitleHeight;
            }else {
                whiteHeight += 26;
            }
        }
       
        
        self.whiteView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-280)/2, (SCREEN_HEIGHT-HOME_INDICATOR_HEIGHT-whiteHeight)/2, 280, whiteHeight)];
        self.whiteView.backgroundColor = [@"#FFFFFF" hexStringToColor];
        self.whiteView.layer.masksToBounds = YES;
        self.whiteView.layer.cornerRadius = 8.f;
        
        
        self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.whiteView.width, 24)];
        self.titleLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setMediumFontWithSizeNumber:ZJFontFiveSizeNumber],NSForegroundColorAttributeName:[@"#2A323A" hexStringToColor]} string:title];
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        [self.whiteView addSubview:self.titleLab];
        
        if (!kStringIsEmpty(subTitle)) {
            //针对超长的内容，滑动处理
            if (subTitleHeight < 300) {
            //副标题
            self.messageLab = [[UILabel alloc]initWithFrame:CGRectMake(0, self.titleLab.bottom+8, self.whiteView.width, 24)];
            if (subTitleHeight > 26) {
                self.messageLab.frame = CGRectMake(25*AutoSizeScaleXX, self.titleLab.bottom+8, self.whiteView.width-50*AutoSizeScaleXX, subTitleHeight);
                self.messageLab.numberOfLines = 0;
                self.messageLab.lineBreakMode = NSLineBreakByCharWrapping;
                self.messageLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontFiveSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]} string:subTitle];
            }else {
                self.messageLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontFourSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]} string:subTitle];
            }
            
            self.messageLab.textAlignment = NSTextAlignmentCenter;
            [self.whiteView addSubview:self.messageLab];
            }else {
                
                self.messageText = [[UITextView alloc]initWithFrame:CGRectMake(0, self.titleLab.bottom+15, self.whiteView.width, subTitleHeight)];
                self.messageText.backgroundColor = [UIColor clearColor];
                self.messageText.editable = NO;
                self.messageText.scrollEnabled = YES;
                self.messageText.showsVerticalScrollIndicator = YES;
                self.messageText.showsHorizontalScrollIndicator = NO;
                self.messageText.attributedText =[PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontFiveSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]} string:subTitle];
                [self.whiteView addSubview:self.messageText];
                self.messageText.textAlignment = NSTextAlignmentCenter;
            }
        }
        
        
     
        if (!kStringIsEmpty(botMessage)) {
            
               
                UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 52+subTitleHeight, self.whiteView.width, 24)];
                lab.attributedText =[PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontFiveSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]} string:botMessage];
                lab.textAlignment = NSTextAlignmentCenter;
                [self.whiteView addSubview:lab];
            
        }else {
            
        }
        
        [self addSubview:self.whiteView];
        
        UIView *botView = [[UIView alloc]initWithFrame:CGRectMake(0, self.whiteView.height-49, self.whiteView.width, 49)];
        botView.backgroundColor = [@"#F5F5F9" hexStringToColor];
        [self.whiteView addSubview:botView];
        
        
        if (kStringIsEmpty(sureBtn)) {
            self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.leftBtn.frame = CGRectMake(0, 0, botView.width, botView.height);
            [self.leftBtn setTitle:cancleTitle forState:UIControlStateNormal];
            [self.leftBtn setTitleColor:[@"#4285F4" hexStringToColor] forState:UIControlStateNormal];
            self.leftBtn.titleLabel.font = [ZJFont setMediumFontWithSizeNumber:ZJFontSixSizeNumber];
            [botView addSubview:self.leftBtn];
            self.leftBtn.tag = 1000;
            [self.leftBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
            
        }else {
            
            self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.leftBtn.frame = CGRectMake(0, 0, botView.width/2, botView.height);
            [self.leftBtn setTitle:cancleTitle forState:UIControlStateNormal];
            [self.leftBtn setTitleColor:[@"#85919C" hexStringToColor] forState:UIControlStateNormal];
            self.leftBtn.titleLabel.font = [ZJFont setRegularFontWithSizeNumber:ZJFontSixSizeNumber];
            [botView addSubview:self.leftBtn];
            self.leftBtn.tag = 1000;
            [self.leftBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
            
            //同意
            self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.rightBtn.frame = CGRectMake(self.leftBtn.right, 0, botView.width/2, botView.height);
            [self.rightBtn setTitle:sureBtn forState:UIControlStateNormal];
            [self.rightBtn setTitleColor:[@"#4285F4" hexStringToColor] forState:UIControlStateNormal];
            self.rightBtn.titleLabel.font = [ZJFont setMediumFontWithSizeNumber:ZJFontSixSizeNumber];
            [botView addSubview:self.rightBtn];
            self.rightBtn.tag = 1001;
            [self.rightBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
            
        }
 
    }
    
    return self;
}

#pragma mark 10.0弹窗
- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title message:(NSString *)message importantMsg:(NSString *)importantMsg sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle viewController:(UIViewController *)vc{
    
    if ( self = [super initWithFrame:frame]) {
        

        
        self.backgroundColor = [[@"#000000" hexStringToColor] colorWithAlphaComponent:0.5];
        
        CGFloat whiteHeight = 53+11+49;
        if (!kStringIsEmpty(importantMsg)) {
            
            NSString *topMessageString = [NSString stringWithFormat:@"感谢您使用仟家信黄金,我们非常重视您的个人信息保护。我们依据最新的监管要求更新了《%@》,在您使用我们的产品前,请您认真阅读《%@》的全部内容。",importantMsg,importantMsg];
            NSString *botMessageString = [NSString stringWithFormat:@"您点击“同意”,即表示您已阅读并同意《%@》,仟家信黄金将尽全力保障您的合法权益。如您点击“不同意”,将可能导致无法继续使用我们的产品和服务。",importantMsg];
            
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineSpacing = 2.0;
            CGFloat topmessageHeight = [PublicTool caluContent:topMessageString Width:NO lineDic:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontTwoSizeNumber],NSParagraphStyleAttributeName:paragraphStyle} rectSize:CGSizeMake(280 - 45*AutoSizeScaleXX, CGFLOAT_MAX)];
            CGFloat botmessageHeight = [PublicTool caluContent:botMessageString Width:NO lineDic:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontTwoSizeNumber],NSParagraphStyleAttributeName:paragraphStyle} rectSize:CGSizeMake(280 - 45*AutoSizeScaleXX, CGFLOAT_MAX)];
            whiteHeight += topmessageHeight;
            whiteHeight += botmessageHeight;
            
            self.whiteView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-280)/2, (SCREEN_HEIGHT-HOME_INDICATOR_HEIGHT-whiteHeight)/2, 280, whiteHeight)];
            self.whiteView.backgroundColor = [@"#FFFFFF" hexStringToColor];
            self.whiteView.layer.masksToBounds = YES;
            self.whiteView.layer.cornerRadius = 8.f;
            
            
            self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 19.5, self.whiteView.width, 24)];
            self.titleLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setMediumFontWithSizeNumber:ZJFontFiveSizeNumber],NSForegroundColorAttributeName:[@"#2A323A" hexStringToColor]} string:title];
            self.titleLab.textAlignment = NSTextAlignmentCenter;
            [self.whiteView addSubview:self.titleLab];
            
            self.messageLab = [[UILabel alloc]initWithFrame:CGRectMake(22.5*AutoSizeScaleXX, self.titleLab.bottom+8, self.whiteView.width-45*AutoSizeScaleXX, topmessageHeight)];
            self.messageLab.numberOfLines = 0;
            self.messageLab.lineBreakMode = NSLineBreakByCharWrapping;
//            self.messageLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontTwoSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]} string:topMessageString];
            NSDictionary *topMessageDict = @{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont  setRegularFontWithSizeNumber:ZJFontTwoSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]};
            NSMutableAttributedString *topAttributedString = [[NSMutableAttributedString alloc] initWithString:topMessageString attributes:topMessageDict];
            NSMutableParagraphStyle * topParagraphStyle = [[NSMutableParagraphStyle alloc] init];
            [topParagraphStyle setLineSpacing:2.0];
            [topAttributedString addAttribute:NSParagraphStyleAttributeName value:topParagraphStyle range:NSMakeRange(0, [topMessageString length])];
            //找出特定字符在整个字符串中的位置
            NSString *rangeImporant = [NSString stringWithFormat:@"《%@》",importantMsg];
//            NSRange redRange = NSMakeRange([topMessageString rangeOfString:rangeImporant].location, [topMessageString rangeOfString:rangeImporant].length);
           
            NSArray *rangeArr = [self rangeOfSubString:rangeImporant inString:topMessageString];
            if (rangeArr.count > 0) {
                for (NSValue *value in rangeArr) {
                    NSRange redRange = [value rangeValue];
                    
                    //修改特定字符的颜色
                    [topAttributedString addAttribute:NSForegroundColorAttributeName value:[@"#FF4E56" hexStringToColor] range:redRange];
                    
                }
            }
            
            [self.messageLab setAttributedText:topAttributedString];
            self.messageLab.textAlignment = NSTextAlignmentLeft;
            self.messageLab.userInteractionEnabled = YES;
            self.messageLab.enabledTapEffect = NO;
            [self.messageLab yb_addAttributeTapActionWithStrings:@[rangeImporant,rangeImporant] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
               
//                QHJWebController *webVC = [[QHJWebController alloc] initWithTitle:importantMsg URL:@"" withFlag:@"200"];
//                [webVC setHidesBottomBarWhenPushed:YES];
//                [vc.navigationController pushViewController:webVC animated:YES];
                
            }];
            [self.whiteView addSubview:self.messageLab];
            
            self.botMessageLab = [[UILabel alloc]initWithFrame:CGRectMake(22.5*AutoSizeScaleXX, self.messageLab.bottom, self.whiteView.width-45*AutoSizeScaleXX, botmessageHeight)];
            self.botMessageLab.numberOfLines = 0;
           self.botMessageLab.lineBreakMode = NSLineBreakByCharWrapping;
            //            self.botMessageLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontTwoSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]} string:botMessageString];
            
            NSDictionary *botMessageDict = @{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont  setRegularFontWithSizeNumber:ZJFontTwoSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]};
            NSMutableAttributedString *botAttributedString = [[NSMutableAttributedString alloc] initWithString:botMessageString attributes:botMessageDict];
            NSMutableParagraphStyle * botParagraphStyle = [[NSMutableParagraphStyle alloc] init];
            [botParagraphStyle setLineSpacing:2.0];
            [botAttributedString addAttribute:NSParagraphStyleAttributeName value:botParagraphStyle range:NSMakeRange(0, [botMessageString length])];
            //找出特定字符在整个字符串中的位置
            NSRange botRange = NSMakeRange([botMessageString rangeOfString:rangeImporant].location, [botMessageString rangeOfString:rangeImporant].length);
            //修改特定字符的颜色
            [botAttributedString addAttribute:NSForegroundColorAttributeName value:[@"#FF4E56" hexStringToColor] range:botRange];
            [self.botMessageLab setAttributedText:botAttributedString];
            self.botMessageLab.textAlignment = NSTextAlignmentLeft;
            self.botMessageLab.userInteractionEnabled = YES;
            self.botMessageLab.enabledTapEffect = NO;
            [self.botMessageLab yb_addAttributeTapActionWithStrings:@[rangeImporant] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
                
//                QHJWebController *webVC = [[QHJWebController alloc] initWithTitle:importantMsg URL:@"" withFlag:@"200"];
//                [webVC setHidesBottomBarWhenPushed:YES];
//                [vc.navigationController pushViewController:webVC animated:YES];
                
            }];
            [self.whiteView addSubview:self.botMessageLab];
            
            
            UIView *botView = [[UIView alloc]initWithFrame:CGRectMake(0, self.whiteView.height-49, self.whiteView.width, 49)];
            botView.backgroundColor = [@"#F5F5F9" hexStringToColor];
            [self.whiteView addSubview:botView];
            [self addSubview:self.whiteView];
            
            //不同意
            self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.leftBtn.frame = CGRectMake(0, 0, botView.width/2, botView.height);
            [self.leftBtn setTitle:cancleTitle forState:UIControlStateNormal];
            [self.leftBtn setTitleColor:[@"#85919C" hexStringToColor] forState:UIControlStateNormal];
            self.leftBtn.titleLabel.font = [ZJFont setRegularFontWithSizeNumber:ZJFontSixSizeNumber];
            [botView addSubview:self.leftBtn];
            self.leftBtn.tag = 1000;
            [self.leftBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
            
            //同意
            self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.rightBtn.frame = CGRectMake(self.leftBtn.right, 0, botView.width/2, botView.height);
            [self.rightBtn setTitle:sureTitle forState:UIControlStateNormal];
            [self.rightBtn setTitleColor:[@"#4285F4" hexStringToColor] forState:UIControlStateNormal];
            self.rightBtn.titleLabel.font = [ZJFont setMediumFontWithSizeNumber:ZJFontSixSizeNumber];
            [botView addSubview:self.rightBtn];
            self.rightBtn.tag = 1001;
            [self.rightBtn addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
            
        }else {
            
        }
        
    }
    
    return self;
}


//K线 黄金分割线 设置
- (instancetype)initWithFrame:(CGRect)frame isShow:(BOOL)isShow isSet:(BOOL)isSet maxPoint:(NSString *)maxPoint minPoint:(NSString *)minPoint isLevel:(BOOL)isLevel{
    
    if ( self = [super initWithFrame:frame]) {
              
              self.backgroundColor = [[@"#000000" hexStringToColor] colorWithAlphaComponent:0.5];
              
              CGFloat whiteHeight = 256;
              
              self.whiteView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-280)/2, (SCREEN_HEIGHT-HOME_INDICATOR_HEIGHT-whiteHeight)/2, 280, whiteHeight)];
              self.whiteView.backgroundColor = [@"#FFFFFF" hexStringToColor];
              self.whiteView.layer.masksToBounds = YES;
              self.whiteView.layer.cornerRadius = 8.f;
              
              
              self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.whiteView.width, 22)];
              self.titleLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setMediumFontWithSizeNumber:ZJFontSevenSizeNumber],NSForegroundColorAttributeName:[@"#508EEE" hexStringToColor]} string:@"黄金分割线设置"];
              self.titleLab.textAlignment = NSTextAlignmentCenter;
              [self.whiteView addSubview:self.titleLab];
              
              UILabel *leftLab = [[UILabel alloc]initWithFrame:CGRectMake(20, self.titleLab.bottom+19, 105, 20)];
              leftLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setMediumFontWithSizeNumber:ZJFontThreeSizeNumber],NSForegroundColorAttributeName:[@"#333333" hexStringToColor]} string:@"显示黄金分割线"];
              leftLab.textAlignment = NSTextAlignmentLeft;
              [self.whiteView addSubview:leftLab];
              
        self.openSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(self.whiteView.width-51-20, self.titleLab.bottom+10, 51, 31)];
            self.openSwitch.on = isShow;
            [self.whiteView addSubview: self.openSwitch];
        self.openSwitch.onTintColor = [@"#1890FF" hexStringToColor];
        
        UILabel *setLab = [[UILabel alloc]initWithFrame:CGRectMake(20, leftLab.bottom+15, 70, 20)];
        setLab.attributedText =[PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setMediumFontWithSizeNumber:ZJFontThreeSizeNumber],NSForegroundColorAttributeName:[@"#333333" hexStringToColor]} string:@"区间设置"];
        setLab.textAlignment = NSTextAlignmentLeft;
            [self.whiteView addSubview:setLab];
        
        self.setSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(self.whiteView.width-51-20, self.openSwitch.bottom+6, 51, 31)];
        self.setSwitch.on = isSet;
        [self.setSwitch addTarget:self action:@selector(setAction:) forControlEvents:UIControlEventValueChanged];
        [self.whiteView addSubview: self.setSwitch];
        self.setSwitch.onTintColor = [@"#1890FF" hexStringToColor];
   
        UILabel *maxLab = [[UILabel alloc]initWithFrame:CGRectMake(0, setLab.bottom+15, 100, 20)];
        maxLab.attributedText =[PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontThreeSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]} string:@"最高点："];
        maxLab.textAlignment = NSTextAlignmentRight;
            [self.whiteView addSubview:maxLab];
              
              
        self.maxTF = [[UITextField alloc]initWithFrame:CGRectMake(maxLab.right+10, maxLab.top-2, 130, 24)];
        self.maxTF.layer.cornerRadius = 4;
        self.maxTF.layer.borderColor = [PublicTool colorWithHexString:@"#000000 " alpha:0.15].CGColor;
        self.maxTF.layer.borderWidth = 1.0;
        self.maxTF.keyboardType = UIKeyboardTypeDecimalPad;
        [self.whiteView addSubview:self.maxTF];
        self.maxTF.font = [ZJFont setRegularFontWithSizeNumber:ZJFontThreeSizeNumber];
        self.maxTF.textAlignment = NSTextAlignmentCenter;
        self.maxTF.text = maxPoint;
        
        UILabel *minLab = [[UILabel alloc]initWithFrame:CGRectMake(0, maxLab.bottom+14, 100, 20)];
        minLab.attributedText =[PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontThreeSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]} string:@"最低点："];
        minLab.textAlignment = NSTextAlignmentRight;
            [self.whiteView addSubview:minLab];
              
              
        self.minTF = [[UITextField alloc]initWithFrame:CGRectMake(minLab.right+10, minLab.top-2, 130, 24)];
        self.minTF.layer.cornerRadius = 4;
        self.minTF.layer.borderColor = [PublicTool colorWithHexString:@"#000000 " alpha:0.15].CGColor;
        self.minTF.layer.borderWidth = 1.0;
        self.minTF.keyboardType = UIKeyboardTypeDecimalPad;
        [self.whiteView addSubview:self.minTF];
        self.minTF.font = [ZJFont setRegularFontWithSizeNumber:ZJFontThreeSizeNumber];
        self.minTF.textAlignment = NSTextAlignmentCenter;
        self.minTF.text = minPoint;
        
        if (isSet) {
            
            self.maxTF.userInteractionEnabled = YES;
            self.minTF.userInteractionEnabled = YES;
            
            self.maxTF.textColor = [@"#508EEE" hexStringToColor];
            self.minTF.textColor = [@"#508EEE" hexStringToColor];
            
        }else {
            self.maxTF.userInteractionEnabled = NO;
            self.minTF.userInteractionEnabled = NO;
            
            self.maxTF.textColor = [@"#BFBFBF" hexStringToColor];
            self.minTF.textColor = [@"#BFBFBF" hexStringToColor];
            
        }
        
        UIView *botView = [[UIView alloc]initWithFrame:CGRectMake(0, self.whiteView.height-49, self.whiteView.width, 49)];
        botView.backgroundColor = [@"#F5F5F9" hexStringToColor];
        [self.whiteView addSubview:botView];
        [self addSubview:self.whiteView];
        
              self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
              self.leftBtn.frame = CGRectMake(0, 0, botView.width/2, botView.height);
              [self.leftBtn setTitle:@"取消" forState:UIControlStateNormal];
              [self.leftBtn setTitleColor:[@"#85919C" hexStringToColor] forState:UIControlStateNormal];
              self.leftBtn.titleLabel.font = [ZJFont setRegularFontWithSizeNumber:ZJFontSixSizeNumber];
              [botView addSubview:self.leftBtn];
              self.leftBtn.tag = 1000;
              [self.leftBtn addTarget:self action:@selector(Event:) forControlEvents:UIControlEventTouchUpInside];
              
              
              self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
              self.rightBtn.frame = CGRectMake(self.leftBtn.right, 0, botView.width/2, botView.height);
              [self.rightBtn setTitle:@"确定" forState:UIControlStateNormal];
              [self.rightBtn setTitleColor:[@"#4285F4" hexStringToColor] forState:UIControlStateNormal];
              self.rightBtn.titleLabel.font = [ZJFont setMediumFontWithSizeNumber:ZJFontSixSizeNumber];
              [botView addSubview:self.rightBtn];
               self.rightBtn.tag = 1001;
              [self.rightBtn addTarget:self action:@selector(Event:) forControlEvents:UIControlEventTouchUpInside];
              
          }
                 
          return self;
    
}

//公告
- (instancetype)initRealNameAlterWithFrame:(CGRect)frame subTitle:(NSString *)subTitle isTimer:(BOOL)isTimer {
    
    if ( self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [[@"#000000" hexStringToColor] colorWithAlphaComponent:0.5];
      
        CGFloat protectHeight = [PublicTool caluContent:subTitle Width:NO lineDic:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontFiveSizeNumber]} rectSize:CGSizeMake(323*AutoSizeScaleXX-36*2*AutoSizeScaleXX, CGFLOAT_MAX)];
        
        if (protectHeight < 24) {
            protectHeight = 24;
        }else if (protectHeight < 48){
            protectHeight = 48;
        }
        
        if (protectHeight > 350) {
            protectHeight = 350;
        }
        
        CGFloat whiteHeight = 189-48+protectHeight;
        
        self.whiteView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-323*AutoSizeScaleXX)/2, (SCREEN_HEIGHT-HOME_INDICATOR_HEIGHT-whiteHeight)/2-50, 323*AutoSizeScaleXX, whiteHeight)];
        self.whiteView.backgroundColor = [@"#FFFFFF" hexStringToColor];
        self.whiteView.layer.masksToBounds = YES;
        self.whiteView.layer.cornerRadius = 8.f;
        [self addSubview:self.whiteView];
        
        self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.whiteView.width, 24)];
        self.titleLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setMediumFontWithSizeNumber:ZJFontFiveSizeNumber],NSForegroundColorAttributeName:[@"#2A323A" hexStringToColor]} string:@"公告"];
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        [self.whiteView addSubview:self.titleLab];
        
    
        UITextView *protectLab = [[UITextView alloc]initWithFrame:CGRectMake(36*AutoSizeScaleXX, self.titleLab.bottom+20, self.whiteView.width-36*2*AutoSizeScaleXX, protectHeight)];
        if(protectHeight == 350){
            protectLab.scrollEnabled = YES;
        }else {
            protectLab.scrollEnabled = NO;
        }
        protectLab.editable = NO;
        protectLab.showsVerticalScrollIndicator = YES;
        protectLab.showsHorizontalScrollIndicator = NO;
//        protectLab.numberOfLines = 0;
//        protectLab.lineBreakMode = NSLineBreakByWordWrapping;
        protectLab.attributedText = [PublicTool attributes:@{NSKernAttributeName:@0.5f,NSFontAttributeName:[ZJFont setRegularFontWithSizeNumber:ZJFontFiveSizeNumber],NSForegroundColorAttributeName:[@"#38434D" hexStringToColor]} string:subTitle];
        protectLab.textAlignment = NSTextAlignmentCenter;
        [self.whiteView addSubview:protectLab];
        protectLab.textAlignment = NSTextAlignmentCenter;
    
        self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftBtn.frame = CGRectMake((self.whiteView.width-135)/2, self.whiteView.height-37-20, 135, 37);
       
        
        [self.leftBtn setTitleColor:[@"#FFFFFF" hexStringToColor] forState:UIControlStateNormal];
        self.leftBtn.titleLabel.font = [ZJFont setRegularFontWithSizeNumber:ZJFontSixSizeNumber];
        
        self.leftBtn.layer.masksToBounds = YES;
        self.leftBtn.layer.cornerRadius = 18.5;
        [self.whiteView addSubview:self.leftBtn];
        self.leftBtn.tag = 1000;
        [self.leftBtn addTarget:self action:@selector(AlterEvent:) forControlEvents:UIControlEventTouchUpInside];
   
        
        if (isTimer) {
            [self.leftBtn setTitle:@"我知道了(3)" forState:UIControlStateNormal];
            self.leftBtn.backgroundColor = [@"#CACFD7" hexStringToColor];
            self.leftBtn.userInteractionEnabled = NO;
            self.timeDec = 3;
            self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];//开始倒计时
        }else {
            [self.leftBtn setTitle:@"我知道了" forState:UIControlStateNormal];
            self.leftBtn.backgroundColor = [@"#426FFF " hexStringToColor];
            self.leftBtn.userInteractionEnabled = YES;
        }
    }
                  
   return self;
    
}


- (void)setAction:(UISwitch *)sender {

    
    if (sender.on) {
        
        self.maxTF.userInteractionEnabled = YES;
        self.minTF.userInteractionEnabled = YES;
        
        self.maxTF.textColor = [@"#508EEE" hexStringToColor];
        self.minTF.textColor = [@"#508EEE" hexStringToColor];
        
    }else {
        self.maxTF.userInteractionEnabled = NO;
        self.minTF.userInteractionEnabled = NO;
        
        self.maxTF.textColor = [@"#BFBFBF" hexStringToColor];
        self.minTF.textColor = [@"#BFBFBF" hexStringToColor];
        
    }
    
}

- (void)timeFireMethod {
    
    self.timeDec--;
    
    
    if (self.timeDec == 0) {
        [self.leftBtn setTitle:@"我知道了" forState:UIControlStateNormal];
        self.leftBtn.userInteractionEnabled = YES;
        self.leftBtn.backgroundColor = [@"#426FFF " hexStringToColor];
        
        [self.myTimer invalidate];
        self.myTimer = nil;
        
    }else {
        [self.leftBtn setTitle:[NSString stringWithFormat:@"我知道了(%d)",self.timeDec] forState:UIControlStateNormal];
        self.leftBtn.userInteractionEnabled = NO;
    }
    
}

- (void)AlterEvent:(UIButton *)sender {
    
//    if (self.resultIndex) {
//        self.resultIndex(sender.tag);
//    }
    [self removeFromSuperview];
    
}

#pragma mark - 回调
- (void)buttonEvent:(UIButton *)sender
{
    
    if (self.resultIndex) {
        self.resultIndex(sender.tag);
    }
    
    [self removeFromSuperview];
    
  
}

- (void)Event:(UIButton *)sender
{
    
    if (self.maxMinIndex) {
        self.maxMinIndex(sender.tag, self.openSwitch.on,self.setSwitch.on, self.maxTF.text, self.minTF.text);
    }
    
    if (self.currentPrice) {
        self.currentPrice(sender.tag,self.currentTF.text);
    }
    
    [self removeFromSuperview];
    
   
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if ([self.maxTF isFirstResponder]) {
        [self.maxTF resignFirstResponder];
    }
    
    if ([self.minTF isFirstResponder]) {
        [self.minTF resignFirstResponder];
    }
}


- (NSArray*)rangeOfSubString:(NSString*)subStr inString:(NSString*)string {

    NSMutableArray *rangeArray = [NSMutableArray array];
    NSString *string1 = [string stringByAppendingString:subStr];
    NSString *temp;
    for (int i = 0; i < string.length; i ++) {
        temp = [string1 substringWithRange:NSMakeRange(i, subStr.length)];
        if ([temp isEqualToString:subStr]) {
            NSRange range = {i,subStr.length};
            [rangeArray addObject:[NSValue valueWithRange:range]];
        }
        
    }
  return rangeArray;
}

@end

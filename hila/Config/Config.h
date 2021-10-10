//
//  Config.h
//  QHJ
//
//  Created by zsgjs on 2020/9/25.
//  Copyright © 2020 zsgjs. All rights reserved.
//

#ifndef Config_h
#define Config_h

#pragma mark 获取屏幕宽度
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width

#pragma mark 获取屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#pragma mark 判断是否为iPhone X 系列  这样写消除了在Xcode10上的警告。
#define iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

//#pragma mark iOS7以上
//#define XL_isIOS7 [[UIDevice currentDevice].systemVersion floatValue]>=7


#pragma mark 判断字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || str == NULL || [str length] < 1 ? YES : NO)

#pragma mark 判断字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys.count == 0)

#pragma mark 判断数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

#define AutoSizeScaleXX (SCREEN_WIDTH/375)

#pragma mark Home indicator Height
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)

#pragma mark 获取APP版本号
#define CurrentAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#pragma mark 判断是否是pad
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#pragma mark 获取状态栏高度
#define StatusHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#pragma mark  获取导航栏高度
#define  navigationHeight  self.navigationController.navigationBar.frame.size.height

#pragma mark 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)

#pragma mark tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f+34.f) : 49.f)

#pragma mark 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)

#define isIOS11 ([[UIDevice currentDevice].systemVersion intValue]>=11?YES:NO)

#define RGBA(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a]
#define ZJRGBColor(r, g, b)       [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]

#define upColor [@"#F24A51" hexStringToColor]
#define downColor [@"#00B56A" hexStringToColor]
#define normalColor [@"#FF7A4D" hexStringToColor]

#define ZJHEXRGBCOLOR(h)          ZJRGBColor(((h >> 16) & 0xFF), ((h >> 8) & 0xFF), (h & 0xFF))
#pragma mark 加载本地图片
#define ZJImage(imageName)                  [UIImage imageNamed:imageName]

typedef NS_OPTIONS(NSUInteger, ShowKLineType){
    
    ShowKLineType24HRun = 1, //24小时走势图
    ShowKLineType48HRun = 2, //48小时走势图
    ShowKLineType72HRun = 3, //72小时走势图
    ShowKLineType96HRun = 4, //96小时走势图
    
    ShowKLineType1Minute = 1001, //1分钟
    ShowKLineType5Minute = 1005, //5分钟
    ShowKLineType15Minute = 1015, //15分钟
    ShowKLineType30Minute = 1030, //30分钟
    ShowKLineType60Minute = 1060, //60分钟
    ShowKLineType4Hour = 2004, //4小时
    ShowKLineType24Hour = 3001, //24小时
    ShowKLineType1Week = 4001, //一周
    ShowKLineType1Month = 5001 //一月
    
};

#pragma mark 文章 类型
typedef enum ArticleType{
    ArticleType_News = 0,//资讯
    ArticleType_Knowledge//知识专区
}ArticleType;



#define requestKey @"16f9b45a18fd735cc1ed29968024e9db"

//行情 API
#define Quotes_Api   @"QuotesApi/"
#define Quotes_Api_GetRotationList  @"GetRotationList"//获取轮播图列表数据

//工具类 API
#define ToolsApi @"ToolsApi/"

#define ToolsApi_TradeRule @"TradeRule"//交易规则
#define ToolsApi_IndexRule @"IndexRule"//指标文章
#define ToolsApi_QuickmessageList @"QuickmessageList" //快讯

#define ToolsApi_FinanceList @"FinanceList" //日历

//调用掌金接口
#define Request_Api @"RequestApi/"

//原ah.zsgjs.com域名
#define Request_QuotesApi @"QuotesApi"//非实时行情
#define Request_QuotesApi_NewGroup      @"ApiV2/qjx_group"
#define Request_QuotesApi_NewOther    @"ApiV2/new_other"
#define Request_QuotesApi_tdatasRT  @"ApiV2/tdatasRT"
#define Request_QuotesApi_tdatas  @"ApiV2/tdatas"
#define Request_QuotesApi_jsjDate     @"ApiV2/jsjDate"
#define Request_QuotesApi_RTKlineData  @"ApiV2/kdataRT" //K线实时行情新接口
#define Request_QuotesApi_KlineData   @"ApiV2/kdata"// K线非实时行情接口
#define Request_QuotesApi_RTRunData  @"ApiV2/trendData2RT"//分时图实时行情接口
#define Request_QuotesApi_RunData   @"ApiV2/trendData2"//分时图非实时行情接口
#define Request_QuotesApi_QuotestRealTimeGid     @"ApiV2/gdataRT"//实时的 Gid行情
#define Request_QuotesApi_QuotesGid    @"ApiV2/gdata" //非实时的 gid行情
#define Request_IndexQuotes @"ApiV2/IndexQuotes"//首页数据集合

//原hqnp.zsgjs.com 域名
#define Request_RealQuotesApi @"RealQuotesApi"//实时行情

//掌金指标
#define Request_ASApi @"ASApi"
#define Request_ASApi_get     @"DataV2/get"//获取单个指标
#define Request_ASApi_gets @"DataV2/gets"//获取多个指标


//H5 News
#define H5NewsApi    @"H5News/"
#define H5NewsApi_H5NnewsTags @"H5NnewsTags"//获取标签列表
#define H5NewsApi_H5NnewsArticles @"H5NnewsArticles"//获取文章列表
#define H5NewsApi_H5NnewsArticleRead @"H5NnewsArticleRead"//获取文章详情


//UserApi
#define UserApi @"UserApi/"
#define UserApi_GetRegisterCode @"GetRegisterCode"//获取注册验证码
#define UserApi_Login  @"Login"//登录
#define UserApi_Register  @"Register"//注册
#define UserApi_Logout  @"Logout"//登出
#define UserApi_GetForgetCode  @"GetForgetCode"//找回密码获取验证码
#define UserApi_ForgetPassword  @"ForgetPassword"//找回密码修改密码
#define UserApi_ModifyPassword  @"ModifyPassword"//修改密码
#define UserApi_GetUserInfo  @"GetUserInfo"//获取用户信息
#define UserApi_ModifyUserInfo  @"ModifyUserInfo"//修改用户信息
#define UserApi_queryChannelInfo  @"queryChannelInfo"//获取渠道信息

#define QuotesApi @"QuotesApi/"
#define Request_QuotesApi_OpenAccountHelpList    @"OpenAccountHelpList" //开户帮助列表

//系统基础API
#define System_Api           @"SystemApi/"
#define SystemApi_ECWebList   @"ECWebList"//系统web页面列表的接口 （最新）
#define SystemApi_init       @"Init"
#define SystemApi_SubmitFeedback  @"SubmitFeedback"//提交意见反馈
#define SystemApi_COSInfo    @"COSInfo"
#define SystemApi_CustomerSystem @"CustomerSystem" //在线客服

#pragma mark 应用整体环境配置  //1 为正式环境 或 准生产环境  0 为测试环境


#if 1

#define RootUrl  @"https:devapi.qjxgold.com/" //准生产
//#define RootUrl  @"https://api.qjxgold.com/" //正式（发布使用）

//加解密key,token
#define Root_Key            @"PATfoakg"//key
#define Root_Token          @"Nuq7yeZk6TF5c029"//token

#define Channel_Token          @"RWsQ07rtHj8MZOGH"

//#define WXPay_AppID         @"wx2dc5c9ef212722e9"

#else


#define RootUrl @"http://192.168.10.234:100/X920-QJXApi/QJXApi/"///测试
//#define RootUrl @"http://test.mark.ngrok.zsgjs.com/X910-QHJApi/QHJApi/"//外网测试

#define Root_Key            @"PATfoakg"//key
#define Root_Token          @"Nuq7yeZk6TF5c029"//token

#define Channel_Token          @"RWsQ07rtHj8MZOGH"

//#define WXPay_AppID         @"wx2dc5c9ef212722e9"

#endif

#endif /* Config_h */

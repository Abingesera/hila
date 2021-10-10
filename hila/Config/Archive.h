//
//  Archive.h
//  QHJ
//
//  Created by zsgjs on 2020/9/27.
//  Copyright © 2020 zsgjs. All rights reserved.
//

#ifndef Archive_h
#define Archive_h

#define App_Info  @"App_Info"

//公告
#define QHJ_AnnouncementKey  @"QHJ_AnnouncementKey"

//用户
#define Member_Info @"QHJ_MemberInfo"
#define Member_ChannelInfo @"Member_ChannelInfo"//渠道商

#define QHJ_UserAgreement  @"QHJ_UserAgreement"//用户协议
#define QHJ_WebListData @"QHJ_WebListData"//协议内容

//行情
#define Market_QuotesGroup_Archive  @"Market_QuotesGroup_Archive"//行情group列表缓存
#define Market_QuotesOther_Archive  @"Market_QuotesOther_Archive"//行情new_other列表缓存
#define Market_DetailArchive @"Market_MarketDetailArchive"//交易所行情页面数据缓存
#define Market_IndicatorKlintType  @"Market_IndicatorKlintType"//K线默认周期，根据tid
#define Market_indiParams_Archive     @"Market_indiParams_Archive"//指标参数缓存
#define Market_QHJCNAME  @"Market_QHJCNAME" //行情品种cname缓存

//首页
#define Market_Quotes_HeaderBannerData  @"Market_Quotes_HeaderBannerData"//首页轮播图缓存
#define Market_LastMarketScrollData         @"Market_LastMarketScrollData"//首页行情滚动区域最后一次数据
#define Market_Quotes_ADImageArchive  @"Market_Quotes_ADImageArchive"//首页广告图缓存

#define Market_EditFunction_Archive   @"Market_EditFunction_Archive"//首页快捷功能模块缓存

//资讯
#define QHJ_RealNews_Archive  @"QHJ_RealNews_Archive"//快讯数据缓存
#define News_ArticleTagList @"News_ArticleTagList"//文章列表
#define News_ArticleTagArr  @"News_ArticleTagArr"//资讯标签缓存
#define Article_ReadTag  @"Article_ReadTag"//文章已读标记
#define Article_HtmlContent  @"Article_HtmlContent"//文章内容缓存

#define Knowledge_TagArr @"Knowledge_TagArr"//知识专区标签缓存
#define Knowledge_ReadTag  @"Knowledge_ReadTag"//知识专区已读标记

#define Knowledge_strategy  @"Knowledge_strategy"//知识专区策略缓存

#pragma mark 交易
#define Trade_OpenHelpListData @"Trade_OpenHelpListData"//开户帮助缓存

#define Trade_ADImageArchive  @"Trade_ADImageArchive"//交易模块广告图缓存

#endif /* Archive_h */

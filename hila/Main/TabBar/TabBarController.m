//
//  TabBarController.m
//  QHJ
//
//  Created by zsgjs on 2020/9/25.
//  Copyright © 2020 zsgjs. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()<UITabBarDelegate>

@property (nonatomic,assign) BOOL isFirst;

@end

@implementation TabBarController

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if (_isFirst) {
        //修改tabbar的高度
        CGRect frame = self.tabBar.frame;
        frame.size.height = 49;
        frame.origin.y = SCREEN_HEIGHT - HOME_INDICATOR_HEIGHT - frame.size.height;
        self.tabBar.frame = frame;
        self.tabBar.backgroundColor =[UIColor whiteColor];
        self.tabBar.barStyle = UIBarStyleBlack;
        _isFirst = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isFirst = YES;
    
    self.view.backgroundColor = [@"#FFFFFF" hexStringToColor];
    
    [self changeLineOfTabbarColor]; //修改tabBar顶部横线颜色
    
    //首页
    HomeModuleController *HomeMainVC = [[HomeModuleController alloc]init];
    [self setupChildVC:HomeMainVC Title:@"黄历" imageName:@"home_unselect" selectedImageName:@"home_select"];
    
    ZJRealNewsController *NewsModuleVC = [[ZJRealNewsController alloc]init];
    [self setupChildVC:NewsModuleVC Title:@"旧闻" imageName:@"news_unselect" selectedImageName:@"news_select"];
    
    StarController *starVC = [[StarController alloc]init];
    [self setupChildVC:starVC Title:@"星运" imageName:@"market_unselect" selectedImageName:@"market_select"];
    
    ToolController *toolVC = [[ToolController alloc]init];
    [self setupChildVC:toolVC Title:@"工具" imageName:@"market_unselect" selectedImageName:@"market_select"];
    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[@"#FFFFFF" hexStringToColor]]];
    //  设置tabbar
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];

    //设置  按钮形状
    [UITabBar appearance].selectionIndicatorImage = [UIImage new];
    
    if (@available(iOS 10.0, *)) {
        self.tabBar.unselectedItemTintColor = [@"#777777" hexStringToColor];
        self.tabBar.tintColor = [@"#EF7602" hexStringToColor];
    }
}


#pragma mark 修改tabbar顶部横线
- (void)changeLineOfTabbarColor {
    CGRect rect = CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, 0.5);
    UIGraphicsBeginImageContextWithOptions(rect.size,NO, 0);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setShadowImage:image];
    [self.tabBar setBackgroundImage:[UIImage new]];
}


#pragma mark UITabBarDelegate Mwthods
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
}


//初始化所有子控制器
-(void)setupChildVC:(UIViewController *)childVC Title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //4.添加导航控制器
       UINavigationController * Nav=[[UINavigationController alloc]initWithRootViewController:childVC];
    
    //1.设置标题
    //    childVC.title=title;
    Nav.tabBarItem.title = title;
    Nav.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2,0);
    [Nav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] =[@"#999999" hexStringToColor];
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [@"#832426" hexStringToColor];

    [Nav.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [Nav.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];

    //2.设置图片
    Nav.tabBarItem.image=[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //3.设置选中图片，不再渲染图片
    Nav.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   
    [self addChildViewController:Nav];
}


- (UIImage *)imageWithColor:(UIColor *)color{
    // 一个像素
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

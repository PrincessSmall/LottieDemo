//
//  GoTabBarMainViewController.m
//  Objective-c-Go
//
//  Created by le tong on 2019/3/27.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "GoTabBarMainViewController.h"
#import "GoTabbarChildSetViewController.h"
#import "GoTabbarChildMessageViewController.h"
#import "TTCustomTabbar.h"

@interface GoTabBarMainViewController ()<CustomTabBarDelegate, UITabBarControllerDelegate>
@property (nonatomic, strong) NSArray *itemArr;

@end

@implementation GoTabBarMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TTCustomTabbar *customBar = [[TTCustomTabbar alloc]init];
    customBar.barDelegate = self;
    [self setValue:customBar forKey:@"tabBar"];
    [self addAllChildViewController];
    self.delegate = self;
    // Do any additional setup after loading the view.
}


#pragma mark ----CustomTabBarDelegate

- (void)selectedItemButton:(NSInteger)item{
    self.selectedIndex = item - 100;
}
- (void)addAllChildViewController {
    GoTabbarChildMessageViewController *homeVC = [[GoTabbarChildMessageViewController alloc] init];
    homeVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:homeVC title:@"首页" imageNamed:@"tabBar_home"];
    
    GoTabbarChildSetViewController *activityVC = [[GoTabbarChildSetViewController alloc] init];
    activityVC.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:activityVC title:@"活动" imageNamed:@"tabBar_activity"];
    
    UIViewController *findVC = [[UIViewController alloc] init];
    findVC.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:findVC title:@"发现" imageNamed:@"tabBar_find"];
    
    UIViewController *mineVC = [[UIViewController alloc] init];
    mineVC.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:mineVC title:@"我的" imageNamed:@"tabBar_mine"];
}

// 添加某个 childViewController
- (void)addChildViewController:(UIViewController *)vc title:(NSString *)title imageNamed:(NSString *)imageNamed {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}


/**
 修改tabbar的高度
 */
- (void)viewWillLayoutSubviews {
    
//        CGRect tabFrame = self.tabBar.frame;
//        tabFrame.size.height = 59;
//        tabFrame.origin.y = self.view.bounds.size.height - 59;
//        self.tabBar.frame = tabFrame;
}

//是否允许选择不同item触发后续操作，YES  允许，NO不允许
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}

//每次点击tabBarItem后触发这个方法(只有点击标签栏中的五个按钮才会触发，MORE里边的不会触发)
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"didSelectViewController");
}

//当点击moreNaviegationController中的编辑按钮时触发的方法
- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers{
}

//当点击完成按钮的时候，触发此方法
//changed :   标记viewController的顺序是否改变
//ViewControllers 返回最新的tabBarController中viewControllers
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed NS_AVAILABLE_IOS(3_0){
    
}

@end

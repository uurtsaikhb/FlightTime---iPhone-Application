//
//  UIViewController+CustomNavigation.m
//  BizNetwork
//
//  Created by Mandal Tsaschikher on 4/30/13.
//  Copyright (c) 2013 Mandal Tsaschikher. All rights reserved.
//

#import "UIViewController+CustomNavigation.h"
#import <QuartzCore/QuartzCore.h>
#import "AboutViewController.h"
 
@implementation UIViewController (CustomNavigation)


- (void) setTitleWithImage
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    self.navigationItem.titleView = imageView;
}

- (void) setCustomTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
    self.tabBarController.navigationItem.titleView = label;
    //    self.title = title;
}

- (void) setCustomTitleOther:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:22];
    self.navigationItem.titleView = label;
    //    self.title = title;
}

- (void)createLogoutButton
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 22, 22);
    [leftButton addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}

- (void)createAboutButton
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 22, 22);
    [leftButton addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}

- (void)createBackButton
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 21, 18)];
    [backButton setImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(popViewController:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
}

- (void)createLogoutBtn
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 18)];
    [backButton setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(popViewController:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
}


//- (void)createSearchButton:(id)target action:(SEL)action
//{
//    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rightButton setImage:[UIImage imageNamed:@"searchBtn"] forState:UIControlStateNormal];
//    rightButton.frame = CGRectMake(0, 0, 44, 44);
//    [rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
//}
//

- (void)logout:(UIButton *)sender
{
    //[User logout];
    AboutViewController * aboutView = [[AboutViewController alloc] init];
    
    
    [self.navigationController pushViewController:aboutView animated:YES];
}

- (void)popViewController:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(BOOL)shouldAutorotate
{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end

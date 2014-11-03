//
//  UIViewController+CustomNavigation.h
//  BizNetwork
//
//  Created by Mandal Tsaschikher on 4/30/13.
//  Copyright (c) 2013 Mandal Tsaschikher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIViewController (CustomNavigation)


- (void) setTitleWithImage;
- (void) setCustomTitle:(NSString *)title;
- (void) setCustomTitleOther:(NSString *)title;
- (void)createBackButton;
- (void)createLogoutButton;
- (void)createAboutButton;
- (void)createLogoutBtn;
//- (void)createCategoryButton;
//- (void)createSearchButton:(id)target action:(SEL)action;

@end

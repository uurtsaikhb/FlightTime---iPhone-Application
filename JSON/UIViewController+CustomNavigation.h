

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

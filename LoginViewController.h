//
//  LoginViewController.h
//  Flight Time
//
//  Created by Uurtsaikh Batbileg on 1/9/14.
//  Copyright (c) 2014 Uurtsaikh Batbileg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

{
    
    IBOutlet UIButton * buttonLogin;
    UITextField *userPassword;
    UIButton *loginButton;
    
}

@property (nonatomic, retain) IBOutlet UIButton * buttonLogin;



@end

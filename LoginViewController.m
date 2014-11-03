//
//  LoginViewController.m
//  Flight Time
//
//  Created by Uurtsaikh Batbileg on 1/9/14.
//  Copyright (c) 2014 Uurtsaikh Batbileg. All rights reserved.
//

#import "UIViewController+CustomNavigation.h"
#import "Reachability.h"
#import "LoginViewController.h"
#import "TabViewController.h"
#import "JSON.h"


@interface LoginViewController ()

{

    UITextField *userName;
    NSMutableData * receivedData;
    UILabel *messageLabel;
    
    Reachability *internetReachableFoo;
    
}

@end

@implementation LoginViewController


@synthesize buttonLogin;


- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self setCustomTitleOther:@"НЭВТРЭХ"];
    [self createAboutButton];
    
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    
    
    UITapGestureRecognizer *touchOnView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(releaseButAction)];
        [touchOnView setNumberOfTapsRequired:1];
        [touchOnView setNumberOfTouchesRequired:1];
        [[self view] addGestureRecognizer:touchOnView];
    
    
    userName = [[UITextField alloc] initWithFrame:CGRectMake(40, 125, 240, 40)];
    userName.delegate = self;
    userName.backgroundColor = [UIColor whiteColor];
    userName.textAlignment = NSTextAlignmentCenter;
    userName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
    userName.placeholder = @"ХЭРЭГЛЭГЧИЙН НЭР";
    userName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:userName];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:userName.bounds
                              byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = userName.bounds;
    maskLayer.path = maskPath.CGPath;
    userName.layer.mask = maskLayer;
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, 39.4f, userName.frame.size.width, 0.6f);
    bottomBorder.backgroundColor = [FlightTool colorFromHexString:@"eeeeee"].CGColor;
    [userName.layer addSublayer:bottomBorder];
    
    
    userPassword = [[UITextField alloc] initWithFrame:CGRectMake(40, 165, 240, 40)];
    userPassword.delegate = self;
    userPassword.backgroundColor = [UIColor whiteColor];
    userPassword.textAlignment = NSTextAlignmentCenter;
    userPassword.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
    userPassword.placeholder = @"НУУЦ ҮГ";
    userPassword.secureTextEntry = YES;
    [self.view addSubview:userPassword];
    
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:userPassword.bounds
                               byRoundingCorners:UIRectCornerBottomLeft| UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer1 = [CAShapeLayer layer];
    maskLayer1.frame = userPassword.bounds;
    maskLayer1.path = maskPath1.CGPath;
    userPassword.layer.mask = maskLayer1;
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0.0f, 0.0f, userPassword.frame.size.width, 0.6f);
    layer.backgroundColor = [FlightTool colorFromHexString:@"eeeeee"].CGColor;
    [userPassword.layer addSublayer:layer];
    
    loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(40, 220, 240, 40);
    loginButton.backgroundColor = [FlightTool colorFromHexString:@"1ba7e3"];
    [loginButton setTitle:@"НЭВТРЭХ" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
    loginButton.layer.cornerRadius = 5.0f;
    [loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    
    messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 265, self.view.frame.size.width, 15)];
    [messageLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:12]];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.textColor = [FlightTool colorFromHexString:@"ff5858"];
    [self.view addSubview:messageLabel];
    
    
    
    
    
}


- (void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    

    userPassword.text = @"";
    
}

- (void)didReceiveMemoryWarning  {
    
    [super didReceiveMemoryWarning];
    
}

- (void)loginAction {
    
    [self callSeques:self];
    
}



- (void) callSeques:(id)sender {

    // Create the request.
    
    if (![self connected]) {
        
        messageLabel.text = @"Интернэт холболтоо шалгана уу !";
        
        
    } else {
        
        if ([userName.text isEqualToString:@""] || [userPassword.text isEqualToString:@""]) {
            
            messageLabel.text = @"Нэр нууц үгээ оруулна уу !";
            
        } else {

    
        NSString * urlString = [NSString stringWithFormat:@"http://202.55.191.108:8084/flighttime/login?username=%@&password=%@", userName.text, userPassword.text];
        
        NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]                                             cachePolicy:NSURLRequestUseProtocolCachePolicy                                          timeoutInterval:60.0];
        
        receivedData = [NSMutableData dataWithCapacity: 0];
        
        NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
        
            if (!theConnection) {
                // Release the receivedData object.
                receivedData = nil;
            
            }
            NSLog(userName.text);
            
        
        }
    
    }

    
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   
    
    NSString * result = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    NSMutableDictionary * tempData = (NSMutableDictionary *)[result JSONValue];
    
    
    if ([[tempData objectForKey:@"status"] isEqualToString:@"active"]) {
        
        [self performSegueWithIdentifier: @"loginaction" sender: self];
        
        messageLabel.text = @"";
    
    }
    else if ([[tempData objectForKey:@"status"] isEqualToString:@"incorrect"])
    {
        
        messageLabel.text = @"Нэр эсвэл Нууц үг буруу байна!";
        
    }else if ([[tempData objectForKey:@"status"] isEqualToString:@"expired"])
    {
        
        messageLabel.text = @"Хэрэглэгчийн эрхээ сунгана уу!";
        
    }
    
    
    
}


- (void)releaseButAction {
    
    [userName resignFirstResponder];
    [userPassword resignFirstResponder];

}


- (BOOL)connected
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}


@end

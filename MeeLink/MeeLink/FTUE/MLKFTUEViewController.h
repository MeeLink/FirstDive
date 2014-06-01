//
//  MLKFTUEViewController.h
//  MeeLink
//
//  Created by huanwen cao on 5/21/14.
//  Copyright (c) 2014 MeeLink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLKFTUEViewController : UIViewController

@property (nonatomic,strong) IBOutlet UITextField* firstName;
@property (nonatomic,strong) IBOutlet UITextField* lastName;
@property (nonatomic,strong) IBOutlet UITextField* email;
@property (nonatomic,strong) IBOutlet UITextField* password;
@property (nonatomic,strong) IBOutlet UIActivityIndicatorView* indicator;
-(IBAction)onSignUp:(id)sender;

-(IBAction)onTapAvatar:(id)sender;
@end

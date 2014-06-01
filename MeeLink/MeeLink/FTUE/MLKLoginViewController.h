//
//  MLKLoginViewController.h
//  MeeLink
//
//  Created by huanwen cao on 5/29/14.
//  Copyright (c) 2014 MeeLink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLKLoginViewController : UIViewController

@property (nonatomic,strong) IBOutlet UITextField* email;
@property (nonatomic,strong) IBOutlet UITextField* password;
@property (nonatomic,strong) IBOutlet UIImageView* avatarView;
@property (nonatomic,strong) IBOutlet UIActivityIndicatorView* indicator;

-(IBAction)onLogin:(id)sender;
@end

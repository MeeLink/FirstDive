//
//  MLKLoginViewController.m
//  MeeLink
//
//  Created by huanwen cao on 5/29/14.
//  Copyright (c) 2014 MeeLink. All rights reserved.
//

#import "MLKLoginViewController.h"
#import <Parse/Parse.h>

@interface MLKLoginViewController ()

@end

@implementation MLKLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)onLogin:(id)sender
{
    if ([self.email.text length]==0 || [self.password.text length]==0) {
        NSString* error= @"your email or password is empty .";
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"loginError" message:error delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles: nil];
        [alert show];
    }
    [self.indicator startAnimating];
     [PFUser logInWithUsernameInBackground:self.email.text password:self.password.text block:^(PFUser *user, NSError *error) {
         if (error==nil) {
             UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
             UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"rootTabBar"];
             vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
             [self presentViewController:vc animated:YES completion:NULL];
         }else{
             UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"loginError" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles: nil];
             [alert show];
         }
     }];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

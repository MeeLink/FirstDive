//
//  MLKFTUEViewController.m
//  MeeLink
//
//  Created by huanwen cao on 5/21/14.
//  Copyright (c) 2014 MeeLink. All rights reserved.
//

#import "MLKFTUEViewController.h"
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MLKFTUEViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>
@property (nonatomic,strong) PFObject* imageObject;

@end

@implementation MLKFTUEViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}
-(IBAction)onTapAvatar:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController* controller = [[UIImagePickerController alloc]init];
//        controller.cameraDevice= UIImagePickerControllerCameraDeviceFront;
        controller.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        controller.delegate=self;
        [self presentViewController:controller animated:YES completion:nil];
        
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    NSData *imageData = UIImagePNGRepresentation(image);
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
    
    PFObject *userPhoto = [PFObject objectWithClassName:@"UserPhoto"];
    userPhoto[@"imageName"] = @"avatar";
    userPhoto[@"imageFile"] = imageFile;
    [userPhoto saveInBackground];
    self.imageObject=userPhoto;
}
-(IBAction)onSignUp:(id)sender
{
    NSString* errorMessage  =nil;
    if (self.imageObject==nil) {
        errorMessage=@"please upload your photo ";
    }else if ([self.firstName.text length]==0|| [self.lastName.text length]==0)
    {
        errorMessage=@"firstName/lastName can't be empty";
    }else if ([self.email.text length]==0||[self.password.text length]==0)
    {
        errorMessage=@"email and password can't be empty";
    }
    if (errorMessage!=nil) {
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"SignUp Error" message:errorMessage delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles:nil];
        [alertView show];
        return;
    }
    PFUser *user = [PFUser user];
    user.username = self.email.text;
    user.password = self.password.text;
    user.email = self.email.text;
    
    // other fields can be set just like with PFObject
    user[@"firstName"] = self.firstName.text;
    user[@"lastName"]  = self.lastName.text;
    user[@"avatar"] =self.imageObject;
    [self.indicator startAnimating];
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [PFUser logInWithUsernameInBackground:user.username password:user.password block:^(PFUser *user, NSError *error) {
                [self.indicator stopAnimating];
                if (!error) {
                    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"rootTabBar"];
                    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                    [self presentViewController:vc animated:YES completion:NULL];
                }else{
                    NSString *errorString = [error userInfo][@"error"];
                    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"SignUp Error" message:errorString delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles:nil];
                    [alertView show];

                }
            }];
            // Hooray! Let them use the app now.
           
        } else {
            [self.indicator stopAnimating];
            NSString *errorString = [error userInfo][@"error"];
            UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"SignUp Error" message:errorString delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles:nil];
            [alertView show];
        }
    }];
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

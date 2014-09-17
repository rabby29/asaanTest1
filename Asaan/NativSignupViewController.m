//
//  NativSignupViewController.m
//  Asaan
//
//  Created by MC MINI on 9/17/14.
//  Copyright (c) 2014 Tech Fiesta. All rights reserved.
//

#import "NativSignupViewController.h"
#import <parse/parse.h>

@interface NativSignupViewController ()

@end

@implementation NativSignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)signup:(id)sender{
    PFUser *user = [PFUser user];
    user.username = self.usernameField.text;
    user.password = self.password.text;
    user.email = self.email.text;
    
    // other fields can be set just like with PFObject
    user[@"phone"] = @"415-392-0202";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            NSString *string=[NSString stringWithFormat:@"You have logedin successfully your ID: %@",user.objectId];
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:string delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            // Show the errorString somewhere and let the user try again.
        }
    }];
}

-(IBAction)login:(id)sender{
    
    
    [PFUser logInWithUsernameInBackground:self.usernameField.text password:self.password.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            NSString *string=[NSString stringWithFormat:@"You have logedin successfully your ID: %@",user.objectId];
                                            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:string delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                            [alert show];
                                            [self dismissViewControllerAnimated:YES completion:nil];

                                        } else {
                                            NSString *errorString = [error userInfo][@"error"];
                                            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                            [alert show];
                                            // Show the errorString somewhere and let the user try again.
                                        }
                                    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

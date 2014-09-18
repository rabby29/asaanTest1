//
//  ViewController.m
//  Asaan
//
//  Created by MC MINI on 9/17/14.
//  Copyright (c) 2014 Tech Fiesta. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    [PFUser logOut];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)twiter:(id)sender{
    
    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Twitter login.");
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"Uh oh. The user cancelled the Twitter login." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];

            return;
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in with Twitter!");
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"User signed up and logged in with Twitter!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        } else {
            NSLog(@"User logged in with Twitter!");
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"User logged in with Twitter!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }     
    }];
}

-(IBAction)login:(id)sender{
    
    NSLog(@" log%@",[PFUser currentUser]);
    
    if (![PFUser currentUser]) { // No user logged in
        // Create the log in view controller
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        [logInViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Create the sign up view controller
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Assign our sign up controller to be displayed from the login controller
        [logInViewController setSignUpController:signUpViewController];
        
        // Present the log in view controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
    }
}


- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user{
    NSLog(@"%@",user);
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user{
    NSLog(@"%@",user);
}

- (IBAction)loginButtonTouchHandler:(id)sender  {
    // Set permissions required from the facebook user account
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
       
        
        if (!user) {
            NSString *errorMessage = nil;
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
                errorMessage = @"Uh oh. The user cancelled the Facebook login.";
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
                errorMessage = [error localizedDescription];
            }
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error"
                                                            message:errorMessage
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"Dismiss", nil];
            [alert show];
        } else {
            if (user.isNew) {
                NSLog(@"User with facebook signed up and logged in!");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                message:@"User with facebook signed up and logged in!"
                                                               delegate:nil
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:@"Dismiss", nil];
                [alert show];
                
            } else {
                NSLog(@"User with facebook logged in!");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                message:@"User with facebook logged in!"
                                                               delegate:nil
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:@"Dismiss", nil];
                [alert show];
            }
            
        }
    }];
    
    // Show loading indicator until login is finished
}


@end

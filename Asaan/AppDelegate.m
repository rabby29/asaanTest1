//
//  AppDelegate.m
//  Asaan
//
//  Created by MC MINI on 9/17/14.
//  Copyright (c) 2014 Tech Fiesta. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
   
    [Parse setApplicationId:@"Th2F4NtNG8bQ9nvK4c9uEY9cSNSCsc8EoApW9dMk"
                  clientKey:@"SWkkfvuIU8emrlnVn2nN2f4vzz6YPyLstAEu5rXl"];
    
       [PFFacebookUtils initializeFacebook];
    
    [PFTwitterUtils initializeWithConsumerKey:@"Eq0Rs1u5DD5pxCmn4NubmKwah"
                               consumerSecret:@"7hZRWq2cWWVaRxHupQgANIutam5Kqqez0oqDi6rzC7fuzSeDIU"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication withSession:[PFFacebookUtils session]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}



- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  FCSAppDelegate.m
//  FoodCircles
//
//  Created by David Groulx on 5/1/13.
//  Copyright (c) 2013 FoodCircles. All rights reserved.
//

#import "FCSAppDelegate.h"
#import <Parse/Parse.h>

@implementation FCSAppDelegate

@synthesize user_email;
@synthesize user_token;
@synthesize venues;
@synthesize charities;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"kOy6fgxIymc6fp3Z6FaYdkTaMy6F41hYX3SgAltZ"
                  clientKey:@"dq206qPaYrhf2WnFOeuA4n1gTDvKIa3PFLQ7qt3i"];
    
    [PFTwitterUtils initializeWithConsumerKey:@"XmAxvWUI8aFgI7QlliTfCw"
                               consumerSecret:@"ipOQjEZ876e0qWexIOLKOV99TllNPC9LBcMEzCZ4"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [PFFacebookUtils handleOpenURL:url];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Saves changes in the application's managed object context before the application terminates.
}

@end

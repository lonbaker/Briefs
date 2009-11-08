//
//  BriefsAppDelegate.m
//  Briefs
//
//  Created by Rob Rhyne on 6/30/09.
//  Copyright Digital Arch Design, 2009. See LICENSE file for details.
//

#import "BriefsAppDelegate.h"
#import "BFSceneViewController.h"
#import "BFDataManager.h"

@implementation BriefsAppDelegate

@synthesize navigationController, window;


- (void)applicationDidFinishLaunching:(UIApplication *)application 
{
    [[BFDataManager sharedBFDataManager] load];
    [window addSubview:[self.navigationController view]];
    [window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[BFDataManager sharedBFDataManager] save];
}

- (void)dealloc 
{
    [navigationController release];
    [window release];
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Navigation Controller Delegate

- (void)navigationController:(UINavigationController *)nav willShowViewController:(UIViewController *)view 
                    animated:(BOOL)animated
{
    if ([view isKindOfClass:[BFSceneViewController class]]) {
        [nav setNavigationBarHidden:YES animated:YES];
    } 
    else {
        [[UIApplication sharedApplication] setStatusBarHidden:NO animated:YES];
        [nav setNavigationBarHidden:NO animated:YES];
    }
}

- (void)navigationController:(UINavigationController *)nav didShowViewController:(UIViewController *)view 
                    animated:(BOOL)animated
{
    if ([view isKindOfClass:[BFSceneViewController class]]) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES animated:YES];
    }
}

///////////////////////////////////////////////////////////////////////////////

@end

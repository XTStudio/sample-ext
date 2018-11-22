//
//  AppDelegate.m
//  sample_ext
//
//  Created by PonyCui on 2018/10/26.
//  Copyright © 2018年 XTStudio. All rights reserved.
//

#import "AppDelegate.h"
#import <xt-engine/EDOFactory.h>

@interface AppDelegate ()

@property (nonatomic, strong) JSContext *context;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [UIViewController new];
    [self.window makeKeyAndVisible];
    [self setupContext];
    return YES;
}

- (void )setupContext {
    JSContext *context = [EDOFactory decodeContextFromBundle:@"app.js"];
    self.context = context;
    self.window.rootViewController = [EDOFactory viewControllerFromContext:self.context withName:nil];
}

@end

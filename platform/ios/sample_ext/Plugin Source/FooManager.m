//
//  FooManager.m
//  sample-ext
//
//  Created by PonyCui on 2018/11/19.
//  Copyright © 2018年 XTStudio. All rights reserved.
//

#import "FooManager.h"
#import <xt-engine/EDOExporter.h>

@implementation FooManager

+ (void)load {
    EDO_EXPORT_CLASS(@"FooManager", nil);
    EDO_EXPORT_STATIC_METHOD(sharedManager);
    EDO_EXPORT_PROPERTY(@"name");
    EDO_EXPORT_READONLY_PROPERTY(@"location");
    EDO_EXPORT_METHOD(changeName:);
}

+ (FooManager *)sharedManager {
    static FooManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [FooManager new];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            staticLocation = @"广州";
            [self edo_emitWithEventName:@"locationChanged" arguments:nil];
        });
    }
    return self;
}

static NSString *staticLocation = @"佛山";

- (NSString *)location {
    return staticLocation;
}

- (void)changeName:(NSString *)name {
    self.name = name;
}

@end

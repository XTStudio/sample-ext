//
//  FooManager.h
//  sample-ext
//
//  Created by PonyCui on 2018/11/19.
//  Copyright © 2018年 XTStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FooManager : NSObject

+ (FooManager *)sharedManager;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, readonly) NSString *location;

- (void)changeName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

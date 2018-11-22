//
//  MKMapView+XTCategory.m
//  sample-ext
//
//  Created by PonyCui on 2018/11/20.
//  Copyright © 2018年 XTStudio. All rights reserved.
//

#import "MKMapView+XTCategory.h"
#import <xt-engine/EDOExporter.h>

@implementation MKMapView (XTCategory)

+ (void)load {
    EDO_EXPORT_CLASS(@"MKMapView", @"UIView");
}

@end

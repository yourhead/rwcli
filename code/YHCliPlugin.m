//
//  YHCliPlugin.m
//  cli
//
//  Created by Isaiah Carew on 10/27/16.
//  Copyright © 2016 Isaiah Carew. All rights reserved.
//

#import "YHCliPlugin.h"
#import "YHTest.h"


@implementation YHCliPlugin

static NSBundle* pluginBundle = nil;

void YHCliPluginInit (YHCliPlugin *plugin) {
    if (!plugin) {
        NSLog(@"cli plugin couldn't initialize");
    }
}

- (instancetype) init {
    self = [super init];
    if (!self) return nil;
    YHCliPluginInit(self);
    return self;
}

- (void)dealloc {
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (!self) return nil;
    YHCliPluginInit(self);

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
}




#pragma mark - plugin basics

+ (BOOL)initializeClass:(NSBundle *)theBundle {
    if (pluginBundle) return NO;
    pluginBundle = theBundle;
    [YHTest defaultTest];
    return YES;
}




#pragma mark - versions

BOOL YHRW7 (void) {
    NSInteger const MinRW7Build = 17449;
    static NSInteger build = -1;
    if (build < 0) build = [[[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"] integerValue];
    return ((build < 1) || (build >= MinRW7Build));
}

BOOL YHRW71 (void) {
    NSInteger const MinRW71Build = 18187;
    static NSInteger build = -1;
    if (build < 0) build = [[[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"] integerValue];
    return ((build < 1) || (build >= MinRW71Build));
}

@end

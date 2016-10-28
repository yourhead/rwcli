//
//  YHText.m
//  cli
//
//  Created by Isaiah Carew on 10/27/16.
//  Copyright © 2016 Isaiah Carew. All rights reserved.
//

#import "YHTest.h"
#import <RWKit/RWPage.h>
#import <RWKit/RWDocument.h>


@interface MyDocument : RWDocument
- (IBAction)performPublishAll:(id)sender;
@end


@interface YHTest ()
@property (nonatomic, weak) MyDocument *document;
@property (nonatomic, readonly) BOOL argPublish;
@property (nonatomic, readonly) NSString *argExport;
@end

@implementation YHTest

NSString *const YHCLI_RWPluginLoadFinished = @"com.realmac.rapidweaver.plugin.loading.finished";
NSString *const YHCLI_RWPublishSiteCompleted = @"RWPublishingControllerPublishSiteCompleteNotificationName";

+ (instancetype)defaultTest {
    static YHTest *defaultTest = nil;
    if (!defaultTest) {
        defaultTest = [[YHTest alloc] init];
    }
    return defaultTest;
}

- (instancetype)init {
    self = [super init];
    if (!self) return nil;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadingFinished:) name:YHCLI_RWPluginLoadFinished object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(publishFinished:) name:YHCLI_RWPublishSiteCompleted object:nil];

    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}




#pragma mark - command link switches

- (BOOL)argPublish {
    id publish = [[NSUserDefaults standardUserDefaults] objectForKey:@"-publish"];
    if (!publish) return NO;
    return YES;
}




#pragma mark - publish

- (void)publishAll {
    if (!self.document) return;
    NSLog(@"cli: starting publish all");

    dispatch_async(dispatch_get_main_queue(), ^{
        [self.document performPublishAll:self];
    });
}




#pragma mark - quit

- (void)quit {
    NSLog(@"cli: quiting app");

    dispatch_async(dispatch_get_main_queue(), ^{
        [NSApp terminate:self];
    });
}




#pragma mark - notifications

- (void)loadingFinished:(NSNotification *)notification {
    if (self.document) return;

    RWPage *page = notification.object;
    self.document = (MyDocument *)page.document;

    if (self.argPublish) [self publishAll];


}

- (void)publishFinished:(NSNotification *)notification {
    NSLog(@"cli: publish finished");
    [self quit];
}

@end

//
//  AQSTwitterActivity.m
//  AQSTwitterActivity
//
//  Created by kaiinui on 2014/11/08.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQSTwitterActivity.h"

#import <Social/Social.h>

@interface AQSTwitterActivity ()

@property (nonatomic, strong) NSArray *activityItems;

@end

@implementation AQSTwitterActivity

# pragma mark - UIActivity

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    [super prepareWithActivityItems:activityItems];
    
    self.activityItems = activityItems;
}

+ (UIActivityCategory)activityCategory {
    return UIActivityCategoryShare;
}

- (NSString *)activityType {
    return @"org.openaquamarine.twitter";
}

- (NSString *)activityTitle {
    return @"Twitter";
}

- (UIImage *)activityImage {
    if ([[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."][0] intValue] >= 8) {
        return [UIImage imageNamed:@"color_AQSTwitterActivity"];
    } else {
        return [UIImage imageNamed:@"AQSTwitterActivity"];
    }
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    return YES;
}

- (UIViewController *)activityViewController {
    SLComposeViewController *composeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    return [self activityViewControllerWithComposeViewController:composeViewController];
}

# pragma mark - Helpers (UIActivity)

- (NSString *)firstStringOrEmptyStringFromArray:(NSArray *)array {
    for (id item in array) {
        if ([item isKindOfClass:[NSString class]]) {
            return item;
        }
    }
    return @"";
}

- (UIViewController *)activityViewControllerWithComposeViewController:(SLComposeViewController *)composeViewController {
    [composeViewController setInitialText:[self firstStringOrEmptyStringFromArray:self.activityItems]];
    for (id item in self.activityItems) {
        if ([item isKindOfClass:[UIImage class]]) {
            [composeViewController addImage:item];
        }
    }
    for (id item in self.activityItems) {
        if ([item isKindOfClass:[NSURL class]]) {
            [composeViewController addURL:item];
        }
    }
    __weak typeof(self) weakSelf = self;
    composeViewController.completionHandler = ^(SLComposeViewControllerResult result) {
        BOOL completed = (result == SLComposeViewControllerResultDone);
        [weakSelf activityDidFinish:completed];
    };
    
    return composeViewController;
}

@end

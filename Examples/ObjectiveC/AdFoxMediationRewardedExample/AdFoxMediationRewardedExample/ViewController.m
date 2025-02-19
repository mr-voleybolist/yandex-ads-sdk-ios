/*
 * Version for iOS © 2015–2019 YANDEX
 *
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at https://yandex.com/legal/mobileads_sdk_agreement/
 */

#import <YandexMobileAds/YandexMobileAds.h>
#import "ViewController.h"

static NSString *const kAdMobBlockID = @"adf-279013/966332";
static NSString *const kFacebookBlockID = @"adf-279013/966335";
static NSString *const kMoPubBlockID = @"adf-279013/966333";
static NSString *const kMyTargetBlockID = @"adf-279013/966334";
static NSString *const kStartAppBlockID = @"adf-279013/1006617";
static NSString *const kUnityAdsBlockID = @"adf-279013/1006614";
static NSString *const kYandexBlockID = @"adf-279013/967178";

@interface ViewController () <YMARewardedAdDelegate>

@property (nonatomic, strong) YMARewardedAd *rewardedAd;

@end

@implementation ViewController

- (IBAction)loadAd
{
    /*
     Replace demo kAdMobBlockID with actual Block ID.
     Following demo block ids may be used for testing:
     AdMob mediation: kAdMobBlockID
     Facebook mediation: kFacebookBlockID
     MoPub mediation: kMoPubBlockID
     MyTarget mediation: kMyTargetBlockID
     StartApp mediation: kStartAppBlockID
     UnityAds mediation: kUnityAdsBlockID
     Yandex: kYandexBlockID
     */
    self.rewardedAd = [[YMARewardedAd alloc] initWithBlockID:kAdMobBlockID];
    self.rewardedAd.delegate = self;
    [self.rewardedAd load];
}

- (IBAction)presentAd
{
    [self.rewardedAd presentFromViewController:self];
}

#pragma mark - YMARewardedAdDelegate

- (void)rewardedAd:(YMARewardedAd *)rewardedAd didReward:(id<YMAReward>)reward
{
    NSString *message = [NSString stringWithFormat:@"Rewarded ad did reward: %zd %@", reward.amount, reward.type];
    NSLog(@"%@", message);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Reward"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
    [self.presentedViewController presentViewController:alertController animated:YES completion:nil];
}

- (void)rewardedAdDidLoadAd:(YMARewardedAd *)rewardedAd
{
    NSLog(@"Rewarded ad loaded");
}

- (void)rewardedAdDidFailToLoadAd:(YMARewardedAd *)rewardedAd error:(NSError *)error
{
    NSLog(@"Loading failed. Error: %@", error);
}

- (void)rewardedAdWillLeaveApplication:(YMARewardedAd *)rewardedAd
{
    NSLog(@"Rewarded ad will leave application");
}

- (void)rewardedAdDidFailToPresentAd:(YMARewardedAd *)rewardedAd error:(NSError *)error
{
    NSLog(@"Failed to present rewarded ad. Error: %@", error);
}

- (void)rewardedAdWillAppear:(YMARewardedAd *)rewardedAd
{
    NSLog(@"Rewarded ad will appear");
}

- (void)rewardedAdDidAppear:(YMARewardedAd *)rewardedAd
{
    NSLog(@"Rewarded ad did appear");
}

- (void)rewardedAdWillDisappear:(YMARewardedAd *)rewardedAd
{
    NSLog(@"Rewarded ad will disappear");
}

- (void)rewardedAdDidDisappear:(YMARewardedAd *)rewardedAd
{
    NSLog(@"Rewarded ad did disappear");
}

- (void)rewardedAd:(YMARewardedAd *)rewardedAd willPresentScreen:(UIViewController *)viewController
{
    NSLog(@"Rewarded ad will present screen");
}

@end

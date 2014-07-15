//
//  ViewController.m
//  HankakuTweet
//
//  Created by koshikawa on 2014/07/14.
//  Copyright (c) 2014年 ppworks. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"
#import "NSString+HankakuKana.h"
#import "TestFlight.h"
#define NSLog(__FORMAT__, ...) TFLog((@"%s [Line %d] " __FORMAT__), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tweetDone.hidden = YES;
    self.tweetText.delegate = self;
    self.bannerView.delegate = self;
    
    [ImobileSdkAds registerWithPublisherID:@"27320" MediaID:@"110380" SpotID:@"256954"];
    [ImobileSdkAds startBySpotID:@"256954"];
    [ImobileSdkAds showBySpotID:@"256954" ViewController:self Position:CGPointMake(10, self.view.frame.size.height - 220)];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGRect bannerFrame = self.bannerView.frame;
    bannerFrame.origin.y = - bannerFrame.size.height;
    self.bannerView.frame = bannerFrame;
    
    [ImobileSdkAds setSpotDelegate:@"256954" delegate:self];
    [ImobileSdkAds showBySpotID:@"256954"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchTweetButton:(id)sender
{
    SLComposeViewController *twitterPostVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitterPostVC setCompletionHandler:^(SLComposeViewControllerResult result) {
        switch (result) {
            case SLComposeViewControllerResultDone:
                self.tweetText.text = @"";
                self.tweetDone.hidden = NO;
                [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hideTweetDone) userInfo:nil repeats:NO];
                TFLog(@"ﾂｲｰﾄｼﾀｯ");
                break;
            case SLComposeViewControllerResultCancelled:
                break;
        }
    }];
    [twitterPostVC setInitialText:[NSString stringWithFormat:@"%@", self.tweetText.text]];
    [self presentViewController:twitterPostVC animated:YES completion:nil];
    [self.tweetText resignFirstResponder];
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (!textView.markedTextRange) {
        textView.text = [textView.text convertToHankakukana];
    }
}

- (void)hideTweetDone
{
    self.tweetDone.hidden = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - iAd
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    CGRect bannerFrame = banner.frame;
    CGRect statusBarViewRect = [[UIApplication sharedApplication] statusBarFrame];
    bannerFrame.origin.y = statusBarViewRect.size.height;
    
    [UIView animateWithDuration:1.0
                      animations:^{
                          banner.frame = bannerFrame;
                      }];
    NSLog(@"YES");
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    CGRect bannerFrame = banner.frame;
    bannerFrame.origin.y = - bannerFrame.size.height;
    [UIView animateWithDuration:1.0
                     animations:^{
                         banner.frame = bannerFrame;
                     }];
}

#pragma mark - i-mobile
- (void)imobileSdkAdsSpot:(NSString *)spotid didReadyWithValue:(ImobileSdkAdsReadyResult)value
{
    NSLog(@"imobileSdkAdsSpot:didReadyWithValue");
}

- (void)imobileSdkAdsSpot:(NSString *)spotid didFailWithValue:(ImobileSdkAdsFailResult)value
{
    NSLog(@"imobileSdkAdsSpot:didFailWithValue");
}

- (void)imobileSdkAdsSpotIsNotReady:(NSString *)spotid
{
    NSLog(@"imobileSdkAdsSpotIsNotReady");
}

- (void)imobileSdkAdsSpotDidClick:(NSString *)spotid
{
    NSLog(@"imobileSdkAdsSpotDidClick");
}

- (void)imobileSdkAdsSpotDidClose:(NSString *)spotid
{
    NSLog(@"imobileSdkAdsSpotDidClose");
}
@end

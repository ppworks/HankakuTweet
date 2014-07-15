//
//  ViewController.h
//  HankakuTweet
//
//  Created by koshikawa on 2014/07/14.
//  Copyright (c) 2014年 ppworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController <UITextViewDelegate, ADBannerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *tweetText;
@property (weak, nonatomic) IBOutlet UIImageView *tweetDone;
@property (weak, nonatomic) IBOutlet ADBannerView *bannerView;
- (IBAction)touchTweetButton:(id)sender;
@end

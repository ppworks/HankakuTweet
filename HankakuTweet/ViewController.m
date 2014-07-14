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
@end

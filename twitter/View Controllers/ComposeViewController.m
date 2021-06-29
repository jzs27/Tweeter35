//
//  ComposeViewController.m
//  twitter
//
//  Created by jessicasyl on 6/29/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "Tweet.h"



@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *composeTweetView;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    }

- (IBAction)closeTweet:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)postTweet:(id)sender {
    [[APIManager shared] postStatusWithText:self.composeTweetView.text completion:^(Tweet *tweet, NSError *error){
        if (tweet) {
            [self.delegate didTweet:tweet];
            
        } else {
            NSLog(@"😫😫😫 Error composing tweet: %@", error.localizedDescription);

        }

    }];
    [self dismissViewControllerAnimated:true completion:nil];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

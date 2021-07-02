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



@interface ComposeViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *composeTweetView;
@property (weak, nonatomic) IBOutlet UILabel *characterCountLabel;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.composeTweetView.delegate=self;
// attempt to set border
//    self.composeTweetView.layer.borderWidth = 1;
//    self.composeTweetView.layer.borderColor = (__bridge CGColorRef _Nullable)([[UIColor alloc] initWithRed:172.0/255.0 green:184.0/255.0 blue:193.0/255.0 alpha:1]);
        
    

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

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    // Check the proposed new text character count
    
    // Set the max character limit
    int characterLimit = 280;

    // Construct what the new text would be if we allowed the user's latest edit
    NSString *newText = [self.composeTweetView.text stringByReplacingCharactersInRange:range withString:text];

    // TODO: Update character count label
    
    self.characterCountLabel.text = [NSString stringWithFormat:@"%d",characterLimit- newText.length];
    if (newText.length >= characterLimit){
        self.characterCountLabel.textColor =[[UIColor alloc] initWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1];    }

    // Should the new text should be allowed? True/False
    return newText.length < characterLimit;
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

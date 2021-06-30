//
//  DetailsViewController.m
//  twitter
//
//  Created by jessicasyl on 6/29/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profilePictureView;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UILabel *retweetCountLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = self.tweet.user.screenName;
    self.usernameLabel.text = self.tweet.user.name;
    
    
    NSString *rtcountString = [NSString stringWithFormat:@"%d",self.tweet.retweetCount];
    NSString *favcountString = [NSString stringWithFormat:@"%d",self.tweet.favoriteCount];
    //NSString *replycountString = [NSString stringWithFormat:@"%d",tweet.];
    
    self.retweetCountLabel.text = rtcountString;
    
    //if (rtcountString != @
    
    self.favoriteCountLabel.text = favcountString;

    self.dateLabel.text = self.tweet.createdAtString;
    self.tweetTextLabel.text = self.tweet.text;
    
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    
    [self.profilePictureView setImageWithURL:url];
    // Do any additional setup after loading the view.
}

- (IBAction)didTapFavorite:(id)sender {
    //favorite tweet
    if (self.tweet.favorited == NO){
        self.tweet.favorited = YES;
        self.tweet.favoriteCount+=1;
        [self setFavorite:YES];
        
        //update UI
        NSString *favcountString = [NSString stringWithFormat:@"%d",self.tweet.favoriteCount];
        self.favoriteCountLabel.text =favcountString;
        
        // Send a post request
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
             }
         }];
    }
    //unfavorite tweet
    else{
        self.tweet.favorited = NO;
        self.tweet.favoriteCount-=1;
        
        
        //update UI
        NSString *favcountString = [NSString stringWithFormat:@"%d",self.tweet.favoriteCount];
        self.favoriteCountLabel.text =favcountString;
        [self setFavorite:NO];
        
        // Send a post request
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
             }
         }];
        
    }
    
}


- (void) setFavorite: (BOOL) favorited {
    [self.favoriteButton setSelected: favorited];
    if (favorited) self.favoriteCountLabel.textColor = [[UIColor alloc] initWithRed:211.0/255.0 green:58.0/255.0 blue:79.0/255.0 alpha:1];
    else self.favoriteCountLabel.textColor = [[UIColor alloc] initWithRed:172.0/255.0 green:184.0/255.0 blue:193.0/255.0 alpha:1];
    
}

- (IBAction)didTapRetweet:(id)sender {
    self.tweet.retweeted = YES;
    self.tweet.retweetCount+=1;
    [self setRetweet:YES];
    
    //update UI
    NSString *rtcountString = [NSString stringWithFormat:@"%d",self.tweet.retweetCount];
    self.retweetCountLabel.text =rtcountString;
    
    // Send a post request
    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
         if(error){
              NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
         }
         else{
             NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
         }
     }];
    
}



-(void) setRetweet: (BOOL) retweeted {
[self.retweetButton setSelected:retweeted];
if (retweeted) self.retweetCountLabel.textColor = [[UIColor alloc] initWithRed:95.0/255.0 green:204.0/255.0 blue:140.0/255.0 alpha:1];
else self.retweetCountLabel.textColor = [[UIColor alloc] initWithRed:172.0/255.0 green:184.0/255.0 blue:193.0/255.0 alpha:1];
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

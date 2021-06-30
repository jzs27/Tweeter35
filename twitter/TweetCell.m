//
//  TweetCell.m
//  twitter
//
//  Created by jessicasyl on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didTapFavorite:(id)sender {
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
        //self.favoriteButton.adjustsIma
        
        // Send a post request
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
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
    if (self.tweet.retweeted==NO){
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
    else{
        self.tweet.retweeted = NO;
        self.tweet.retweetCount-=1;
        [self setRetweet:NO];
        
        //update UI
        NSString *rtcountString = [NSString stringWithFormat:@"%d",self.tweet.retweetCount];
        self.retweetCountLabel.text =rtcountString;
        
        // Send a post request
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
             }
         }];
    }

}

-(void) setRetweet: (BOOL) retweeted {
    [self.retweetButton setSelected:retweeted];
    if (retweeted) self.retweetCountLabel.textColor = [[UIColor alloc] initWithRed:95.0/255.0 green:204.0/255.0 blue:140.0/255.0 alpha:1];
    else self.retweetCountLabel.textColor = [[UIColor alloc] initWithRed:172.0/255.0 green:184.0/255.0 blue:193.0/255.0 alpha:1];
}



@end

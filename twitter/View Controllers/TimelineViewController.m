//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "Tweet.h"
#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "ComposeViewController.h"
#import "DetailsViewController.h"
#import "DateTools.h"

@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *arrayOfTweets;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) UIRefreshControl *refreshControl;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate=self;
    
    [self loadTweets];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(loadTweets) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onLogout:(id)sender {
    NSLog(@"pressing logout button");

    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;

    [[APIManager shared] logout];
}

- (void)loadTweets{
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            self.arrayOfTweets = (NSMutableArray*) tweets;
            [self.tableView reloadData];

        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        [self.refreshControl endRefreshing];
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayOfTweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    Tweet *tweet  = self.arrayOfTweets[indexPath.row];
//    TweetCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TweetCell" forIndexPath:indexPath];
    
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    Tweet *tweet = self.arrayOfTweets[indexPath.row];
    
    
//    cell.nameLabel.text = tweet.user.name;
//    cell.screennameLabel.text = tweet.user.screenName;
//    cell.screennameLabel.text = [NSString stringWithFormat:@"%@%@", @"@", tweet.user.screenName];
//
//    cell.tweet = tweet;
//
//    NSString *rtcountString = [NSString stringWithFormat:@"%d",tweet.retweetCount];
//    NSString *favcountString = [NSString stringWithFormat:@"%d",tweet.favoriteCount];
//
//    cell.retweetCountLabel.text = rtcountString;
//
//    cell.favoriteCountLabel.text = favcountString;
//
//    cell.timestampLabel.text = tweet.timeAgoString;
//    cell.tweetTextLabel.text = tweet.text;
//
//    NSString *URLString = tweet.user.profilePicture;
//    NSURL *url = [NSURL URLWithString:URLString];
//
//    [cell.profilePictureView setImageWithURL:url];
    cell.tweet = tweet;
    
    return cell;
}

- (void)didTweet:(Tweet *)tweet{
    [self.arrayOfTweets addObject:tweet];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row + 1 == [self.arrayOfTweets count]){
        [self loadMoreData];
        [self.tableView reloadData];
    }
}

-(void)loadMoreData {
    //[[APIManager shared] getHomeTimelineWithCompletionReload:maxID];
    Tweet *lastTweet = self.arrayOfTweets[self.arrayOfTweets.count - 1]; // get the last tweet being displayed in the tableview
    
    
    [[APIManager shared] getHomeTimelineWithCompletionReload:lastTweet.idStr completion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            [self.arrayOfTweets addObjectsFromArray:tweets];
            [self.tableView reloadData];

        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        
    }];
}




//



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //comment out this one and it works?
    //TimelineViewController *temp = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"detailViewSegue"]){
        UITableViewCell *tappedcell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedcell];
        Tweet *tweet  = self.arrayOfTweets[indexPath.row];
        DetailsViewController *detailsviewcontroller = [segue destinationViewController];
        
        detailsviewcontroller.tweet = tweet;
        NSLog(@"Tapping on a tweet!");
    }else{
        
    UINavigationController *navigationController = [segue destinationViewController];
    ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
    }
    
}





@end

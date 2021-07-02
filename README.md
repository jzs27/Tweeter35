## Project 3 - *Tweeter*

**Tweeter** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **15** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User sees app icon in home screen and styled launch screen
- [x] User can sign in using OAuth login flow
- [x] User can Logout
- [x] User can view last 20 tweets from their home timeline
- [x] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [x] User can pull to refresh.
- [x] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [x] User can compose a new tweet by tapping on a compose button.
- [x] Using AutoLayout, the Tweet cell should adjust its layout for iPhone 11, Pro and SE device sizes as well as accommodate device rotation.
- [x] User should display the relative timestamp for each tweet "8m", "7h"
- [x] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet and favorite.

The following **optional** features are implemented:

- [x] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. Refer to [[this guide|unretweeting]] for help on implementing unretweeting.
- [x] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [x] When composing, you should have a countdown for the number of characters remaining for the tweet (out of 280) (**1 point**)

The following **additional** features are implemented:

List anything else that you can get done to improve the app functionality!
- [x] Retweet and like counts do not appear on the timeline until they are greater than 0.
- [x] Improved UI.
- [x] Profile picture view is circular.


Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Implementing different parts of the API (replies, personal profiles, tweets with a certain hashtag etc.)
2. Including videos from tweets. 

## Video Walkthrough

Here's a walkthrough of implemented user stories:
![ezgif com-gif-maker (23)](https://user-images.githubusercontent.com/71947227/124303933-a5b1cd80-db28-11eb-8668-0ce0a229fe6a.gif) APP ICON, STYLED LAUNCH SCREEN

![ezgif com-gif-maker (15)](https://user-images.githubusercontent.com/71947227/124202684-7f484f80-daa0-11eb-9ee6-59841a839696.gif) LOGIN

![ezgif com-gif-maker (14)](https://user-images.githubusercontent.com/71947227/124202592-45774900-daa0-11eb-8293-2930f9d8da0b.gif) LOGOUT


![ezgif com-gif-maker (17)](https://user-images.githubusercontent.com/71947227/124203065-802db100-daa1-11eb-9114-05bbfe78ffbc.gif) AUTOLAYOUT


![ezgif com-gif-maker (24)](https://user-images.githubusercontent.com/71947227/124305829-39849900-db2b-11eb-9442-58d058e037bf.gif) COMPOSE, PULL TO REFRESH

![ezgif com-gif-maker (20)](https://user-images.githubusercontent.com/71947227/124203646-d3543380-daa2-11eb-8734-4055a9fc44f3.gif) PROFILE PICTURE, USERNAME, TWEET TEXT, TIMESTAMP, (UN)RETWEET AND (UN)FAVORITE

 ![ezgif com-gif-maker (22)](https://user-images.githubusercontent.com/71947227/124203850-3e9e0580-daa3-11eb-9b52-dbe73bfc7c95.gif) DETAILS PAGE
 
 OPTIONALS
 
 ![ezgif com-gif-maker (16)](https://user-images.githubusercontent.com/71947227/124202893-0f869480-daa1-11eb-87a9-64f2060663a4.gif) INFINITE SCROLL
 
 ![ezgif com-gif-maker (21)](https://user-images.githubusercontent.com/71947227/124203746-04346880-daa3-11eb-8d51-bb2c4be2fdb9.gif) COUNTDOWN


GIF created with [Kap](https://getkap.co/).

## Notes

Describe any challenges encountered while building the app.

It was difficult at first to understand the API Manage file, how to constuct methods that require a "completion block" and navigating Objective C as a whole. Autolayout was very difficult as well.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

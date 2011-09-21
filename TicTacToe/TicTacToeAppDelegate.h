//
//  TicTacToeAppDelegate.h
//  TicTacToe
//
//  Created by robert curtis on 9/20/11.
//  Copyright 2011 GGC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TicTacToeViewController;

@interface TicTacToeAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TicTacToeViewController *viewController;

@end

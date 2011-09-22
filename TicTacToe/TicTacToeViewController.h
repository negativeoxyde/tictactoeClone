//
//  TicTacToeViewController.h
//  TicTacToe
//
//  Created by robert curtis on 9/20/11.
//  Copyright 2011 GGC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TicTacToeViewController : UIViewController
{
    IBOutlet UIImage * oImg;
    IBOutlet UIImage * xImg;
    
    IBOutlet UIImageView * s1;
    IBOutlet UIImageView * s2;
    IBOutlet UIImageView * s3;
    IBOutlet UIImageView * s4;
    IBOutlet UIImageView * s5;
    IBOutlet UIImageView * s6;
    IBOutlet UIImageView * s7;
    IBOutlet UIImageView * s8;
    IBOutlet UIImageView * s9;
    
    IBOutlet UIButton * resetButton;
    IBOutlet UIImageView * board;
    IBOutlet UILabel * whoseTurn;
    
    NSInteger playerToken; //holds 1 or 2 based on whos turn it is
    
    NSArray * tiles; //container for individual squares
    
    NSInteger numberOfMoves;
}

@property (nonatomic,retain) UIImage *oImg;
@property (nonatomic,retain) UIImage *xImg;

@property (nonatomic,retain) UIButton *resetButton;

@property (nonatomic,retain) UIImageView *board;

@property (nonatomic,retain) UIImageView *s1;
@property (nonatomic,retain) UIImageView *s2;
@property (nonatomic,retain) UIImageView *s3;
@property (nonatomic,retain) UIImageView *s4;
@property (nonatomic,retain) UIImageView *s5;
@property (nonatomic,retain) UIImageView *s6;
@property (nonatomic,retain) UIImageView *s7;
@property (nonatomic,retain) UIImageView *s8;
@property (nonatomic,retain) UIImageView *s9;

@property (nonatomic, retain) UILabel *whoseTurn;

@property (nonatomic, retain) NSArray *tiles;

@property (nonatomic) NSInteger numberOfMoves;

- (void)updatePlayerInfo;

- (void)checkForWin;

- (IBAction)buttonReset:(id)sender;

- (void)resetBoard;

- (void)makeMark:(UIImageView *)sender;

- (void)winnerFound;

- (void)stalemate;

- (void)newMethod;


@end

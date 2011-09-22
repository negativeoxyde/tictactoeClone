//
//  TicTacToeViewController.m
//  TicTacToe
//
//  Created by robert curtis on 9/20/11.
//  Copyright 2011 GGC. All rights reserved.
//

#import "TicTacToeViewController.h"

@implementation TicTacToeViewController

@synthesize s1,s2,s3,s4,s5,s6,s7,s8,s9;
@synthesize oImg,xImg,whoseTurn,board;
@synthesize resetButton;
@synthesize tiles;
@synthesize numberOfMoves;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    oImg = [UIImage imageNamed:@"O.png"];
    xImg = [UIImage imageNamed:@"X.png"];
    
    tiles = [NSArray arrayWithObjects:s1, s2, s3, s4, s5, s6, s7, s8, s9, nil];
    [tiles retain];
    
    playerToken = 1;
    whoseTurn.text = @"X's turn";
    
    numberOfMoves = 0;
    [super viewDidLoad];    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject]; 
    
    for (UIImageView *tile in tiles) 
    {
        if(CGRectContainsPoint([tile frame], [touch locationInView:self.view]) && tile.image == NULL)
           {
               [self makeMark:tile];
               [self checkForWin];
               [self updatePlayerInfo];
               numberOfMoves++;
           }
    }
    
    //refactor this garbage later
    /*
    if (CGRectContainsPoint([s1 frame], [touch locationInView:self.view]) && s1.image == NULL) 
    {
        [self makeMark:s1];
    }
    if (CGRectContainsPoint([s2 frame], [touch locationInView:self.view])) 
    {
        [self makeMark:s2];
    }
    if (CGRectContainsPoint([s3 frame], [touch locationInView:self.view])) 
    {
        [self makeMark:s3];
    }
    if (CGRectContainsPoint([s4 frame], [touch locationInView:self.view])) 
    {
        [self makeMark:s4];
    }
    if (CGRectContainsPoint([s5 frame], [touch locationInView:self.view])) 
    {
        [self makeMark:s5];
    }
    if (CGRectContainsPoint([s6 frame], [touch locationInView:self.view])) 
    {
        [self makeMark:s6];
    }
    if (CGRectContainsPoint([s7 frame], [touch locationInView:self.view])) 
    {
        [self makeMark:s7];
    }
    if (CGRectContainsPoint([s8 frame], [touch locationInView:self.view])) 
    {
        [self makeMark:s8];
    }
    if (CGRectContainsPoint([s9 frame], [touch locationInView:self.view])) 
    {
        [self makeMark:s9];
    }
    
    [self updatePlayerInfo];
     */
}


- (void)makeMark:(UIImageView *)sender
{
    if(playerToken == 1) { sender.image = xImg; }
    if(playerToken == 2) { sender.image = oImg; }
}


- (void)updatePlayerInfo
{
    if(playerToken == 1)
    {
        playerToken = 2;
        whoseTurn.text = @"O's turn";        
    }    
    else
    {
        playerToken = 1;
        whoseTurn.text = @"X's turn";
    }
}


- (void)winnerFound
{
    NSString *winner;
    //Not initing, allocing or retaining winner, not responsible for releasing because
    // the factory methods used bellow are autorelease objects.
    if(playerToken == 1) { winner = [NSString stringWithFormat:@"Congratulations X Player!"]; }
    if(playerToken == 2) { winner = [NSString stringWithFormat:@"Congratulations O Player!"]; }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Winner!" 
                                                    message:winner
                                                   delegate:self 
                                          cancelButtonTitle:@"Cancel" 
                                          otherButtonTitles:@"Ok", nil];
    [alert show];
    [alert release];
}


- (void)checkForWin
{
    //Horrizontal winning situations
    if((s1.image == s2.image && s2.image == s3.image && s1.image != NULL && s2.image != NULL && s3.image != NULL) ||
       (s4.image == s5.image && s5.image == s6.image && s4.image != NULL && s5.image != NULL && s6.image != NULL) ||
       (s7.image == s8.image && s8.image == s9.image && s7.image != NULL && s8.image != NULL && s9.image != NULL))
    {
        [self winnerFound];
    }
    
    //Vertical winning situations
    if((s1.image == s4.image && s4.image == s7.image && s1.image != NULL && s4.image != NULL && s7.image != NULL) ||
       (s2.image == s5.image && s5.image == s8.image && s2.image != NULL && s5.image != NULL && s8.image != NULL) ||
       (s3.image == s6.image && s6.image == s9.image && s3.image != NULL && s6.image != NULL && s9.image != NULL))
    {
        [self winnerFound];
    }
    
    //X=Y winning situations
    if((s1.image == s5.image && s5.image == s9.image && s1.image != NULL && s5.image != NULL && s9.image != NULL) ||
       (s3.image == s5.image && s5.image == s7.image && s3.image != NULL && s5.image != NULL && s7.image != NULL))
    {
        [self winnerFound];
    }
    
    if (numberOfMoves >= 8) 
    {
        [self stalemate];
    }
}

- (void)stalemate 
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Stalemate!" 
                                                    message:@"Stalemate!  Try again."
                                                   delegate:self 
                                          cancelButtonTitle:@"Cancel" 
                                          otherButtonTitles:@"Ok", nil];
    [alert show];
    [alert release];
    numberOfMoves = 0;    
}

- (IBAction)buttonReset:(id)sender
{
    [self resetBoard];    
}


- (void)resetBoard
{
    s1.image = NULL;
    s2.image = NULL;
    s3.image = NULL;
    s4.image = NULL;
    s5.image = NULL;
    s6.image = NULL;
    s7.image = NULL;
    s8.image = NULL;
    s9.image = NULL;
    
    playerToken = 1;
    whoseTurn.text = @"X's turn";
    numberOfMoves = 0;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)dealloc
{
    [s1 release];
	[s2 release];
	[s3 release];
	[s4 release];
	[s5 release];
	[s6 release];
	[s7 release];
	[s8 release];
	[s9 release];
	[resetButton release];
	[board release];
	[oImg release];
	[xImg release];
	[whoseTurn release];
    [tiles release];
    
    [super dealloc];
}


@end

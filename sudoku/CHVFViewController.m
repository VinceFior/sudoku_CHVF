//
//  CHVFViewController.m
//  sudoku
//
//  Created by Cyrus Huang on 9/11/14.
//  Copyright (c) 2014 Cyrus Huang, Vincent Fiorentini. All rights reserved.
//

#import "CHVFViewController.h"

int initialGrid[9][9]={
    {7,0,0,4,2,0,0,0,9},
    {0,0,9,5,0,0,0,0,4},
    {0,2,0,6,9,0,5,0,0},
    {6,5,0,0,0,0,4,3,0},
    {0,8,0,0,0,6,0,0,7},
    {0,1,0,0,4,5,6,0,0},
    {0,0,0,8,6,0,0,0,2},
    {3,4,0,9,0,0,1,0,0},
    {8,0,0,3,0,2,7,4,0}
};

@interface CHVFViewController () {
    UIButton* _button;
    UIView* _gridView;
}

@end

@implementation CHVFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // create grid view
    CGRect frame = self.view.frame;
    CGFloat x    = CGRectGetWidth(frame) * .1;
    CGFloat y    = CGRectGetHeight(frame) * .1;
    CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame)) * .8;
    
    CGRect gridFrame = CGRectMake(x, y, size, size);
    
    // create grid view
    _gridView = [[UIView alloc] initWithFrame:gridFrame];
    _gridView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_gridView];
    
    // create button
    CGFloat bigGap = size/40;
    CGFloat smallGap = size/80;
    CGFloat buttonSize = (size - (bigGap*4) - (smallGap*10)) / 9.0;
    
    for (int row = 0; row < 9; row++) {
        for (int col = 0; col < 9; col++) {
            CGFloat x = ((col / 3) + 1) * bigGap + (col + 1) * smallGap + col * buttonSize;
            CGFloat y = ((row / 3) + 1) * bigGap + (row + 1) * smallGap + row * buttonSize;
            CGRect buttonFrame = CGRectMake(x, y, buttonSize, buttonSize);
            _button = [[UIButton alloc] initWithFrame:buttonFrame];
            _button.tag = row * 10 + col; // e.g: for the cell of row 2 col 7, the tag is 27
            _button.backgroundColor = [UIColor whiteColor];
            
            int value = initialGrid[col][row];
            if (value > 0) {
                NSString* title = [NSString stringWithFormat:@"%d", value];
                [_button setTitle:title forState:UIControlStateNormal];
                [_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }
            
            // create highlight feature
            _button.showsTouchWhenHighlighted = YES;
            [_gridView addSubview:_button];
            
            // create target for button
            [_button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPressed:(id)sender
{
    UIButton* button = (UIButton*) sender;
    NSLog(@"Button %d was pressed", button.tag);
}

@end

//
//  CHVFViewController.m
//  sudoku
//
//  Created by Cyrus Huang on 9/11/14.
//  Copyright (c) 2014 Cyrus Huang, Vincent Fiorentini. All rights reserved.
//

#import "CHVFViewController.h"
#import "CHVFGridView.h"

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
    CHVFGridView* _gridView;
}

@end

@implementation CHVFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _gridView = [[CHVFGridView alloc] initWithFrame:self.view.frame];
    for (int row = 0; row < 9; row++) {
        for (int col = 0; col < 9; col++) {
            int value = initialGrid[col][row];
            [_gridView setValueAtRow:row col:col to:value];
        }
    }
    [self.view addSubview:_gridView];
    [_gridView setTarget:self action:@selector(gridCellSelectedAtRow:col:)];
}

- (void)gridCellSelectedAtRow:(NSNumber*)row col:(NSNumber*) col
{
    NSLog(@"The button is pressed, with row %@ and col %@", row, col);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

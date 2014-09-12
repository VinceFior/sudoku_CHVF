//
//  CHVFGridView.m
//  sudoku
//
//  Created by Vincent Fiorentini on 9/12/14.
//  Copyright (c) 2014 Cyrus Huang, Vincent Fiorentini. All rights reserved.
//

#import "CHVFGridView.h"

@interface CHVFGridView () {
    NSMutableArray* _cells;
}
@end

@implementation CHVFGridView

- (id) initWithFrame:(CGRect)frame {
    // create frame
    CGFloat x    = CGRectGetWidth(frame) * .1;
    CGFloat y    = CGRectGetHeight(frame) * .1;
    CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame)) * .8;
    CGRect gridFrame = CGRectMake(x, y, size, size);
    
    self = [super initWithFrame:gridFrame];
    self.backgroundColor = [UIColor blackColor];
    
    // create buttons
    CGFloat bigGap = size/40;
    CGFloat smallGap = size/80;
    CGFloat buttonSize = (size - (bigGap*4) - (smallGap*10)) / 9.0;
    _cells = [[NSMutableArray alloc] init];
    for (int row = 0; row < 9; row++) {
        NSMutableArray* rowArray = [[NSMutableArray alloc] init];
        for (int col = 0; col < 9; col++) {
            CGFloat x = ((col / 3) + 1) * bigGap + (col + 1) * smallGap + col * buttonSize;
            CGFloat y = ((row / 3) + 1) * bigGap + (row + 1) * smallGap + row * buttonSize;
            CGRect buttonFrame = CGRectMake(x, y, buttonSize, buttonSize);
            UIButton* button = [[UIButton alloc] initWithFrame:buttonFrame];
            button.tag = row * 10 + col; // e.g: for the cell of row 2 col 7, the tag is 27
            button.backgroundColor = [UIColor whiteColor];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            button.showsTouchWhenHighlighted = YES; // todo: make this work (white on white is invisible)
            [self addSubview:button];
            [rowArray addObject:button];
            
            // create target for button
            [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
        [_cells addObject:rowArray];
    }
    
    return self;
}

- (void)setValueAtRow:(int)row col:(int)col to:(int)value {
    UIButton* button = _cells[row][col];
    if (value == 0) {
        [button setTitle:@"" forState:UIControlStateNormal];
    } else {
        NSString* title = [NSString stringWithFormat:@"%d", value];
        [button setTitle:title forState:UIControlStateNormal];
    }
}

- (void)buttonPressed:(id)sender
{
    UIButton* button = (UIButton*) sender;
    NSLog(@"Button %d was pressed", button.tag);
}

@end

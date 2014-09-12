//
//  CHVFGridView.h
//  sudoku
//
//  Created by Vincent Fiorentini on 9/12/14.
//  Copyright (c) 2014 Cyrus Huang, Vincent Fiorentini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHVFGridView : UIView

- (void)setValueAtRow:(int)row col:(int)col to:(int)value;
- (void)setTarget:(id)target action:(SEL)action;

@end

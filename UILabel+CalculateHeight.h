//
//  UILabel+CalculateHeight.h
//  delivery
//
//  Created by Иван on 08/07/14.
//  Copyright (c) 2014 QDesk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CalculateHeight)

-(void)setTextWithCalculateHeight:(NSString *)text;
-(CGFloat)getHeightOfText:(NSString *)textStr font:(UIFont *)textFont widht:(CGFloat)textWidth;

@end

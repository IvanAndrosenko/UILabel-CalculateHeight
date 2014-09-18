//
//  UILabel+CalculateHeight.m
//  delivery
//
//  Created by Иван on 08/07/14.
//  Copyright (c) 2014 QDesk. All rights reserved.
//

#import "UILabel+CalculateHeight.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@implementation UILabel (CalculateHeight)

-(CGFloat)getHeightOfText:(NSString *)textStr font:(UIFont *)textFont widht:(CGFloat)textWidth
{
    CGSize requiredSize;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
        
        NSDictionary *attributes = @{ NSFontAttributeName: textFont, NSParagraphStyleAttributeName : paragraphStyle };
        
        
        CGRect rect = [textStr boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                            options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                         attributes:attributes
                                            context:nil];
        requiredSize = rect.size;
        
    }
    else
    {
        CGSize boundingSize = CGSizeMake(textWidth, CGFLOAT_MAX);
        requiredSize = [textStr sizeWithFont:textFont
                           constrainedToSize:boundingSize
                               lineBreakMode:NSLineBreakByWordWrapping];
        
    }
    
    return ceilf(requiredSize.height);
}


-(void)setTextWithCalculateHeight:(NSString *)text
{
    self.numberOfLines = 0;
    self.text = text;
    float height = [self getHeightOfText:self.text font:self.font widht:self.frame.size.width];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);

}

@end

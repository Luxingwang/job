//
//  FJJobSearchItem+Extension.m
//  Job
//
//  Created by 小黑胖 on 2018/12/7.
//  Copyright © 2018 lxw. All rights reserved.
//

#import "FJJobSearchItem+Extension.h"
#import "NSMutableAttributedString+Extesion.h"
@implementation FJJobSearchItem (Extension)
@dynamic descriptionWidth;
@dynamic attributedDescription;
@dynamic needDisplayAtHeight;
-(NSNumber*)needDisplayAtHeight
{
    return objc_getAssociatedObject(self, @selector(needDisplayAtHeight));
}

-(NSNumber*)descriptionWidth
{
    NSNumber *width = objc_getAssociatedObject(self, @selector(descriptionWidth));
    if (width.floatValue) {
        return width;
    }
    width =@([self.attributedDescription boundingRectWithSize:CGSizeMake(MAXFLOAT,self.needDisplayAtHeight.floatValue)].width+1);
    self.descriptionWidth = width;
    return width;
}

-(NSMutableAttributedString*)attributedDescription{
    NSMutableAttributedString *description = objc_getAssociatedObject(self, @selector(attributedDescription));
    if (description) {
        return description;
    }
    description = [self assembleAttributedString];
    self.attributedDescription = description;
    return description;
}

#pragma mark setter method

-(void)setNeedDisplayAtHeight:(NSNumber *)needDisplayAtHeight{
    objc_setAssociatedObject(self, @selector(needDisplayAtHeight), needDisplayAtHeight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setDescriptionWidth:(NSNumber *)descriptionWidth{
    objc_setAssociatedObject(self, @selector(descriptionWidth), descriptionWidth, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setAttributedDescription:(NSMutableAttributedString *)attributedDescription{
    objc_setAssociatedObject(self, @selector(attributedDescription), attributedDescription, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

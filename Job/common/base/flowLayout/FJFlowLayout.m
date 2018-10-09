//
//  FJFlowLayout.m
//  Job
//
//  Created by 小黑胖 on 2018/10/7.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJFlowLayout.h"

@implementation FJFlowLayout
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    for(NSInteger i = 1; i < [attributes count]; i++){
        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
        UICollectionViewLayoutAttributes *prevLayoutAttributes = attributes[i - 1];
        CGFloat origin = CGRectGetMaxX(prevLayoutAttributes.frame);
        if(origin + self.interitemSpacing + currentLayoutAttributes.frame.size.width <= self.collectionViewContentSize.width-self.sectionInset.right){
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = origin + self.interitemSpacing;
            frame.origin.y = prevLayoutAttributes.frame.origin.y;
            currentLayoutAttributes.frame = frame;
        }
    }
    return attributes;
}
@end

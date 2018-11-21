//
//  PhotoView.h
//  PhotoBrower
//
//  Created by XXX on 15/8/8.
//  Copyright © 2015年 XXX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YLPhotoView;
typedef void(^EnlargeBlock)(YLPhotoView *view);

@interface YLPhotoView : UIScrollView

@property (nonatomic, copy) EnlargeBlock enlargeBlock;

- (void)setPhoto:(id)photo;

- (void)recoveryNormalMode;

@end

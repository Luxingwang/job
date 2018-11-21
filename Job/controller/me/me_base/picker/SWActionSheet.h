//
// Created by Petr Korolev on 11/08/14.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SWActionSheet : UIView
@property(nonatomic, strong) UIView *bgView;
@property (nonatomic, assign) CGFloat viewHeight;

@property (nonatomic, copy) VoidBlock touchesBeganBlock;

- (void)dismissWithClickedButtonIndex:(int)i animated:(BOOL)animated;

- (instancetype)initWithView:(UIView *)view;

- (void)showInContainerView;

@end

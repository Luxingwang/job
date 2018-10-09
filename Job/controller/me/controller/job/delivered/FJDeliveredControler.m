//
//  FJDeliveredControler.m
//  Job
//
//  Created by 小黑胖 on 2018/10/4.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "HMSegmentedControl.h"
#import "FJDeliveredControler.h"
#import "FJDeliveredListController.h"
@interface FJDeliveredControler ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) HMSegmentedControl *segementControl;
@end

@implementation FJDeliveredControler

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self initConstraints];
    [self setUpChildControllers];
    self.navigationItem.title = @"已经投递职位";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setUpSubviews{
    [self.view addSubview:self.segementControl];
    [self.view addSubview:self.scrollView];
}

-(void)initConstraints{
    [self.segementControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.width.mas_equalTo(self.view);
        make.height.mas_equalTo(47);
    }];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.bottom.equalTo(self.view);
        make.top.mas_equalTo(self.segementControl.mas_bottom).offset(9);
    }];
}

-(void)setUpChildControllers{
    /**/
    FJDeliveredListController *reachedController = [[FJDeliveredListController alloc] init];
    reachedController.offsetPage = 0;
    reachedController.listType = DeliveredListTypeReached;
    [self.scrollView addSubview:reachedController.view];
    [self addChildViewController:reachedController];
    /**/
    FJDeliveredListController *readedController = [[FJDeliveredListController alloc] init];
    readedController.offsetPage = 1;
    readedController.listType = DeliveredListTypeReaded;
    [self.scrollView addSubview:readedController.view];
    [self addChildViewController:readedController];
    /**/
    FJDeliveredListController *improperController = [[FJDeliveredListController alloc] init];
    improperController.offsetPage = 2;
    improperController.listType = DeliveredListTypeImproper;
    [self.scrollView addSubview:improperController.view];
    [self addChildViewController:improperController];
}
#pragma mark
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.segementControl.selectedSegmentIndex = index;
}
#pragma mark
-(void)segmentControlClicked:(HMSegmentedControl*)segmentControl{
    NSInteger index = segmentControl.selectedSegmentIndex;
    [UIView animateWithDuration:0.3 animations:^{
        self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width*index,0);
    }];
}

#pragma mark
-(UIScrollView*)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3,0);
    }
    return _scrollView;
}
-(HMSegmentedControl*)segementControl{
    if (!_segementControl) {
        _segementControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"已送达",@"已阅读",@"不合适"]];
        _segementControl.backgroundColor = [UIColor whiteColor];
        _segementControl.selectedTitleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:14],
                                                         NSForegroundColorAttributeName : [UIColor at_colorWithHex:0x2EA7E0]};
        _segementControl.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:14],
                                                 NSForegroundColorAttributeName : [UIColor at_colorWithHex:0x3E3A39]};
        
        _segementControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _segementControl.selectionIndicatorColor = [UIColor at_colorWithHex:0x2EA7E0];
        _segementControl.borderColor = [UIColor clearColor];
        _segementControl.selectionIndicatorHeight = 2;
        _segementControl.borderType = HMSegmentedControlBorderTypeBottom;
        [_segementControl addTarget:self action:@selector(segmentControlClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _segementControl;
}
@end

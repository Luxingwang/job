//
//  FJExchangeController.m
//  Job
//
//  Created by 小黑胖 on 2018/10/4.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "HMSegmentedControl.h"
#import "FJExchangeController.h"
#import "FJExchangeListController.h"
@interface FJExchangeController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) HMSegmentedControl *segementControl;

@end

@implementation FJExchangeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self initConstraints];
    [self setUpChildControllers];
    self.navigationItem.title = @"匿名/实名交流";
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
    FJExchangeListController *reachedController = [[FJExchangeListController alloc] init];
    reachedController.offsetPage = 0;
    reachedController.listType = ExchangeListAnonym;
    [self.scrollView addSubview:reachedController.view];
    [self addChildViewController:reachedController];
    /**/
    FJExchangeListController *readedController = [[FJExchangeListController alloc] init];
    readedController.offsetPage = 1;
    readedController.listType = ExchangeListReal;
    [self.scrollView addSubview:readedController.view];
    [self addChildViewController:readedController];
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
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width*2,0);
    }
    return _scrollView;
}
-(HMSegmentedControl*)segementControl{
    if (!_segementControl) {
        _segementControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"匿名交流",@"实名交流"]];
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

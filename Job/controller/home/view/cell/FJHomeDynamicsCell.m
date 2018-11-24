//
//  FJHomeDynamicsCell.m
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "FJHomeDynamicsCell.h"

NSString *FJGetDynamitcsTypeString(NSString* type)
{
    if ([@"NEWS" isEqualToString:type])
    {
        return @"动态";
    }
    else if ([@"STORY" isEqualToString:type])
    {
        return @"就业";
    }
    return @"未知";
}

@interface FJHomeDynamicsItemCell()
@property (nonatomic,strong) UILabel *typeLabel;
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation FJHomeDynamicsItemCell

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSubviews];
        [self initConstraints];
    }
    return self;
}

#pragma mark private methods
-(void)setUpSubviews
{
    [self addSubview:self.typeLabel];
    [self addSubview:self.titleLabel];
}

-(void)initConstraints
{
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(34);
        make.height.mas_equalTo(16);
        make.left.mas_equalTo(0);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self.typeLabel.mas_right).offset(10);
    }];
}

#pragma mark public methods
-(void)setInfomationLite:(FJInfomationLite *)infomationLite
{
    _infomationLite = infomationLite;
    _typeLabel.text = FJGetDynamitcsTypeString(infomationLite.type);
    _titleLabel.text = infomationLite.title;
}

#pragma mark getter methods
-(UILabel*)typeLabel{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.layer.masksToBounds = YES;
        _typeLabel.layer.cornerRadius = 4.0f;
        _typeLabel.layer.borderWidth = 1.0f;
        _typeLabel.font = [UIFont systemFontOfSize:11];
        _typeLabel.textAlignment = NSTextAlignmentCenter;
        _typeLabel.textColor = [UIColor at_colorWithHex:0xCD151C];
        _typeLabel.layer.borderColor = [UIColor at_colorWithHex:0xCD151C].CGColor;
    }
    return _typeLabel;
}

-(UILabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor at_colorWithHex:0x595757];
    }
    return _titleLabel;
}
@end

#pragma mark FJHomeDynamicsCell

@interface FJHomeDynamicsCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) UIView  *verticalLineView;
@property (nonatomic,strong) UILabel *dynamicsTipLabel;
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation FJHomeDynamicsCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSubviews];
        [self initConstraints];
        [self timer];
    }
    return self;
}

-(void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark private methods

-(void)setUpSubviews
{
    [self addSubview:self.dynamicsTipLabel];
    [self addSubview:self.verticalLineView];
    [self addSubview:self.collectionView];
}

-(void)initConstraints
{
    [self.dynamicsTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(20);
    }];
    [self.verticalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(self.dynamicsTipLabel.mas_right).offset(12);
        make.bottom.mas_equalTo(-10);
        make.width.mas_equalTo(1);
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.verticalLineView.mas_right).mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.bottom.mas_equalTo(0);
    }];
}

-(void)scrollDynamicsListCell{
    NSArray *visibleItems = self.collectionView.indexPathsForVisibleItems;
    if (visibleItems.count) {
        /*当前可见Cells 最后一个Cell*/
        NSInteger maxVisibleRow = 0;
        for (NSIndexPath *indexPath in visibleItems) {
            if (indexPath.row>maxVisibleRow) {
                maxVisibleRow = indexPath.row;
            }
        }
        /*当前滚动到了最后一个*/
        if (maxVisibleRow==self.dynamicsList.count-1)
        {
            NSIndexPath *firstIdexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            [self.collectionView scrollToItemAtIndexPath:firstIdexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        }
        else
        {   /*向下滚动*/
            NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:maxVisibleRow+1 inSection:0];
            if (nextIndexPath.row<self.dynamicsList.count)
            {
                [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
            }
        }
    }
}

#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dynamicsList.count;
}

- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FJHomeDynamicsItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[FJHomeDynamicsItemCell cellId] forIndexPath:indexPath];
    cell.infomationLite = self.dynamicsList[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(collectionView.frame.size.width,(collectionView.frame.size.height/2.0));
}

#pragma mark public methods
-(void)setDynamicsList:(NSArray *)dynamicsList
{
    _dynamicsList = dynamicsList;
    [self.collectionView reloadData];
    if (dynamicsList.count>2)
    {
        [self timer];
    }else
    {
        [self.timer invalidate];
        self.timer = nil;
    }
}

#pragma mark getter methods

-(NSTimer*)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollDynamicsListCellD) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

-(UILabel*)dynamicsTipLabel{
    if (!_dynamicsTipLabel) {
        _dynamicsTipLabel = [[UILabel alloc] init];
        _dynamicsTipLabel.text = @"局长\n头条";
        _dynamicsTipLabel.numberOfLines = 0;
        _dynamicsTipLabel.textAlignment = NSTextAlignmentCenter;
        _dynamicsTipLabel.font = [UIFont boldSystemFontOfSize:21];
        _dynamicsTipLabel.textColor = [UIColor at_colorWithHex:0x2EA7E0];
    }
    return _dynamicsTipLabel;
}

-(UIView*)verticalLineView{
    if (!_verticalLineView) {
        _verticalLineView = [[UIView alloc] init];
        _verticalLineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _verticalLineView;
}

-(UICollectionView*)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[FJHomeDynamicsItemCell class] forCellWithReuseIdentifier:[FJHomeDynamicsItemCell cellId]];
    }
    return _collectionView;
}
@end

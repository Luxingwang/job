//
//  ManageEditTagsViewController.m
//  Shuangdaojia_Merchant
//
//  Created by XXX on 2017/7/19.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import "ManageEditTagsViewController.h"
#import "ManageCollectionTagsView.h"
#import "FJUserWorkService.h"
#import "ManageCollectionTagsFlowLayout.h"
#import "FJIndustry.h"
#import "UIBarButtonItem+BlocksKit.h"

@interface ManageEditTagsViewController ()
@property (nonatomic, strong) ManageCollectionTagsView *tagsView;

/* 已经存在标签数据 */
@property (nonatomic, strong) NSMutableArray *alreadyTagsArray;
/* 标签原始数组 */
@property (nonatomic, strong) NSArray *originalArray;

@end

@implementation ManageEditTagsViewController

- (instancetype)initWithAlreadyTagList:(NSArray *)tagList;
{
    if (self = [super init]) {
        self.alreadyTagsArray = tagList;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupNavigation];
    [self loadData];
}

- (void)setupNavigation
{
    self.title = @"行业类型";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"保存" style:UIBarButtonItemStylePlain handler:^(id sender) {
        if (self.saveTagsBlock) {
            self.saveTagsBlock([self.tagsView.dataArray bk_map:^id(FJIndustry *data) {
                return data.isSelected ? data : nil;
            }]);
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

- (void)loadData
{
    [[FJUserWorkService instance] getIndustryWithSuccessBlock:^(id data) {
        self.originalArray = data;
    } failureBlock:nil];
}

- (void)setOriginalArray:(NSArray *)originalArray
{
    _originalArray = originalArray;
    self.tagsView.dataArray = originalArray;
    [self.tagsView reloadData];
}

- (void)handleMoreTagsArray
{
    [self.tagsView reloadData];
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.updateCellHeight) {
            self.updateCellHeight(self.tagsView.contentSize.height);
        }
    });
}

- (NSMutableArray *)alreadyTagsArray
{
    if (!_alreadyTagsArray) {
        _alreadyTagsArray = [NSMutableArray array];
    }
    return _alreadyTagsArray;
}

- (ManageCollectionTagsView *)tagsView
{
    if (!_tagsView) {
        ManageCollectionTagsFlowLayout *flowLayout = [[ManageCollectionTagsFlowLayout alloc] initWithType:TagsTypeWithLeft];
        flowLayout.betweenOfCell = 10;
        _tagsView = [[ManageCollectionTagsView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
        [self.view addSubview:_tagsView];
        weakify(self)
        [_tagsView setDidSelectItemAtIndexPath:^(NSIndexPath *indexPath) {
            weakify(self)
            FJIndustry *data = self.originalArray[indexPath.item];
            data.isSelected = !data.isSelected;
            [self.tagsView reloadData];
        }];
    }
    return _tagsView;
}

- (void)dealloc
{
    NSLog(@"释放");
}

@end

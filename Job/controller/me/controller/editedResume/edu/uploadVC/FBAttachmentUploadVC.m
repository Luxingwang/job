//
//  FBAttachmentUploadVC.m
//  FengbangB
//
//  Created by fengbang on 2018/6/28.
//  Copyright © 2018年 com.fengbangstore. All rights reserved.
//

#import "FBAttachmentUploadVC.h"
#import "FBAttachmentUploadCollectionViewCell.h"
#import "SelectPhotoManager.h"
#import "YLPhotoBrowserController.h"

@interface FBAttachmentUploadVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,FBAttachmentUploadCollectionViewCellDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
/**图片选择工具*/
@property (nonatomic, strong) SelectPhotoManager *photoManager;
@property (nonatomic, assign,getter=isUploading) BOOL uploading;
@end


/**最大附件图片个数*/
NSInteger kAttachmentPhotoMaxNumber = 1;
/**每行显示的个数*/
static CGFloat kPerLineNumber = 3;
/**cell的identifier*/
static NSString *kAttachmentUploadCellIdentifier = @"kAttachmentUploadCellIdentifier";
#define SECTION_LEFT_MARGIN 30
#define ITEM_SPACE 10

@implementation FBAttachmentUploadVC {
}

#pragma mark - lazy
- (UICollectionView *)collectionView
{
    if (_collectionView) {
        return _collectionView;
    }
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = ITEM_SPACE;
    layout.minimumInteritemSpacing = ITEM_SPACE/2;
    layout.sectionInset = UIEdgeInsetsMake(20, SECTION_LEFT_MARGIN, 20, SECTION_LEFT_MARGIN);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.alwaysBounceVertical = YES;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.scrollEnabled = YES;
    [self.view addSubview:collectionView];
    _collectionView = collectionView;
    
    [collectionView registerClass:[FBAttachmentUploadCollectionViewCell class] forCellWithReuseIdentifier:kAttachmentUploadCellIdentifier];
    
    return _collectionView;
}

/**
 选择照片的工具类

 @return 工具类
 */
- (SelectPhotoManager *)photoManager {
    if (!_photoManager) {
        _photoManager = [[SelectPhotoManager alloc] init];
        _photoManager.currentVC = self;
    }
    return _photoManager;
}

- (instancetype)initWithImageArray:(NSArray *)imageArray
{
    if (self = [super init]) {
        self.dataArray = [NSMutableArray arrayWithArray:imageArray];
    }
    return self;
}

#pragma mark - overwrite

- (void)viewWillDisappear:(BOOL)animated
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configNavigation];
    
    [self configData];

}

- (void)dealloc {
    NSLog(@"%@销毁了",[self class]);
}

#pragma mark - private

/**
 设置导航栏
 */
- (void)configNavigation
{
    self.title = @"荣誉证书";
    
//    [self yb_setTitleAttributesWithTitle:@"附件上传" font:KV_FONT(16.) color:[UIColor colorWithHexString:@"575757"]];
    
//    [self yb_setRightBarButtonItemWithTitle:@"确定" font:KV_FONT(16) color:APP_MAIN_COLOR action:@selector(confirmButtonClick:)];
}

/**
 重写此方法，拦截导航栏返回按钮的点击相应方法

 @return bool值
 */
- (BOOL)navigationShouldPopOnBackButton {
    return YES;
}

/**
 右上角确认按钮点击方法

 @param sender sender description
 */
- (void)confirmButtonClick:(UIButton *)sender {
    
}

/**
 配置数据
 */
- (void)configData {
    //拿到参数
    kAttachmentPhotoMaxNumber = 6;
    
    self.collectionView.hidden = NO;

    self.status = 2;

    [self.collectionView reloadData];
    
}

/**
 选择添加照片
 */
- (void)addPicture {
    [self.photoManager startSelectPhotoSuccess:^(SelectPhotoManager *manager, UIImage *image) {
        if (!image) { return ; }
        //FBLog(@"_____________增加了图片_______________");
        [self.dataArray addObject:image];
        [self.collectionView reloadData];
        
    } failure:^(NSString *errorReason) {
        NSLog(@"%@",errorReason);
    }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (self.dataArray.count == kAttachmentPhotoMaxNumber) ? self.dataArray.count : self.dataArray.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FBAttachmentUploadCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kAttachmentUploadCellIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    [cell layoutIfNeeded];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(FBAttachmentUploadCollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    // 为空
    if (!self.dataArray.count) {
        [cell configCellAdd];
    }
    // 数组个数达到最大
    else if (self.dataArray.count == kAttachmentPhotoMaxNumber) {
        cell.sourceImage = [self.dataArray objectAtIndex:indexPath.row];
    }
    else {
        if (indexPath.row == self.dataArray.count) {
            [cell configCellAdd];
        }
        else {
            cell.sourceImage = [self.dataArray objectAtIndex:indexPath.row];
        }
    }
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.dataArray.count) {
        //添加图片
        [self addPicture];
    }
    else if (self.dataArray.count == kAttachmentPhotoMaxNumber) {
        //查看大图
        YLPhotoBrowserController *controller = [[YLPhotoBrowserController alloc]init];
        [controller setPhotoList:self.dataArray selectedIndex:indexPath.item];
        [self presentViewController:controller animated:YES completion:^{
            
        }];
    }
    else {
        if (indexPath.row == self.dataArray.count) {
           //添加图片
            [self addPicture];
        }
        else {
            //查看大图
            YLPhotoBrowserController *controller = [[YLPhotoBrowserController alloc]init];
            [controller setPhotoList:self.dataArray selectedIndex:indexPath.item];
            [self presentViewController:controller animated:YES completion:^{
                
            }];
        }
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat w = (SCREEN_WIDTH - SECTION_LEFT_MARGIN*2 - (kPerLineNumber-1)*ITEM_SPACE)/kPerLineNumber;
    return CGSizeMake(w, w);
}

#pragma mark - FBAttachmentUploadCollectionViewCellDelegate
- (void)configCellDelete:(FBAttachmentUploadCollectionViewCell *)cell withOject:(id)object
{
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    [self.dataArray removeObjectAtIndex:indexPath.item];
    [self.collectionView reloadData];
}

@end

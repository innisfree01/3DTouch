//
//  ViewController.m
//  3DTouch
//
//  Created by 沈凯 on 2017/8/18.
//  Copyright © 2017年 Ssky. All rights reserved.
//

#import "ViewController.h"
#import "DemoCell.h"
//详情页
#import "PreViewController.h"

// UIViewControllerPreviewingDelegate 遵循预览协议
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIViewControllerPreviewingDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(200, 100);
    [_collectionView registerClass:[DemoCell class] forCellWithReuseIdentifier:@"cell"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.collectionViewLayout = layout;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DemoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //设置代理
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0){
        cell.previewingDelegate = self;
    }
    return cell;
}
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    PreViewController *preViewController = [[PreViewController alloc]init];
//    preViewController.currentPage = indexPath.item;
//
//    [self.navigationController pushViewController:preViewController animated:YES];
//}
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
//    打开详情页触发
    if (viewControllerToCommit) {
        [self showViewController:viewControllerToCommit sender:self];
    }
}
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
//    1.我们可以通过触控的location获取 当前点击的是第几个元素(位于collectionview)
//    2.由于响应3dtouch事件的view是cell的contentView,我们对触控拿到的location要进行一个转换(相对于collectionview(父视图)来说的位置
//    3.这里通过previewingContext中sourceView获取到触摸的view
    UIView *contentView = previewingContext.sourceView;
//    看回"2" 中第一句话,我们要拿到这个触控的location位于collectionview中的位置
    CGPoint iLocation = [contentView convertPoint:location toView:self.collectionView];
//    将获取到的位置 通过collectionview获取indexPath
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:iLocation];
    
    PreViewController *preViewController = [[PreViewController alloc]init];
    preViewController.currentPage = indexPath.item;
    
    return preViewController;
}
@end

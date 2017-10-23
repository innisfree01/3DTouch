//
//  DemoCell.h
//  3DTouch
//
//  Created by 沈凯 on 2017/9/26.
//  Copyright © 2017年 Ssky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoCell : UICollectionViewCell
/**
 设置3D Touch代理
 */
@property (weak, nonatomic) id<UIViewControllerPreviewingDelegate> previewingDelegate;
@end

//
//  DemoCell.m
//  3DTouch
//
//  Created by 沈凯 on 2017/9/26.
//  Copyright © 2017年 Ssky. All rights reserved.
//

#import "DemoCell.h"

@implementation DemoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        self.contentView.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
    }
    return self;
}

- (void)setPreviewingDelegate:(id<UIViewControllerPreviewingDelegate>)previewingDelegate
{
//    这里设置代理,需要控制好设置(registerForPreviewingWithDelegate)的次数,确保每个cell都有register就可以,但不要重复(若大量registerForPreviewingWithDelegate 会造成滑动失控)
    if (!_previewingDelegate) {
        _previewingDelegate = previewingDelegate;
        UIViewController *controller = (UIViewController *)previewingDelegate;
        [controller registerForPreviewingWithDelegate:previewingDelegate sourceView:self.contentView];
    }
}
@end

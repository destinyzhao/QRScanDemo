//
//  ScanStyleDIY.m
//  ScanDemo
//
//  Created by Destiny on 2018/8/21.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "ScanStyleDIY.h"

@implementation ScanStyleDIY

#pragma mark -无边框，内嵌4个角
+ (LBXScanViewStyle*)InnerStyle
{
    //设置扫码区域参数
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Inner;
    style.photoframeLineW = 3;
    style.photoframeAngleW = 18;
    style.photoframeAngleH = 18;
    // 修改四角的颜色
    style.colorAngle = [UIColor blueColor];
    style.isNeedShowRetangle = NO;
    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    //qq里面的线条图片
    UIImage *imgLine = [UIImage imageNamed:@"scan_light_green"];
    style.animationImage = imgLine;
    
    style.notRecoginitonArea = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    
    
    return style;
}

@end

//
//  ScanViewController.m
//  ScanDemo
//
//  Created by Destiny on 2018/8/21.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "ScanViewController.h"
#import "ScanStyleDIY.h"

@interface ScanViewController ()

/**
 @brief  扫码区域上方提示文字
 */
@property (nonatomic, strong) UILabel *topTitle;

@end

@implementation ScanViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"ZXing 扫描";
    self.cameraInvokeMsg = @"相机启动中";
    self.style = [ScanStyleDIY InnerStyle];
    self.isOpenInterestRect = YES;
    self.libraryType = SLT_ZXing;
    self.scanCodeType = SCT_QRCode;

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self drawTitle];
    [self.view bringSubviewToFront:_topTitle];
}

//绘制扫描区域
- (void)drawTitle
{
    if (!_topTitle)
    {
        self.topTitle = [[UILabel alloc]init];
        _topTitle.bounds = CGRectMake(0, 0, 200, 60);
        _topTitle.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, self.view.frame.size.height/2+140);
        _topTitle.font = [UIFont systemFontOfSize:12];
    
        _topTitle.textAlignment = NSTextAlignmentCenter;
        _topTitle.numberOfLines = 0;
        _topTitle.text = @"将二维码/条码放入框内，即可自动扫描";
        _topTitle.textColor = [UIColor whiteColor];
        [self.view addSubview:_topTitle];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -实现类继承该方法，作出对应处理
- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array
{
    if (!array ||  array.count < 1)
    {
        [self popAlertMsgWithScanResult:nil];
        return;
    }

    LBXScanResult *scanResult = array[0];
    NSString*strResult = scanResult.strScanned;
    self.scanImage = scanResult.imgScanned;
    
    if (!strResult) {
        
        [self popAlertMsgWithScanResult:nil];
        
        return;
    }
    
    //TODO: 这里可以根据需要自行添加震动或播放声音提示相关代码
    //...
    
    [self showNextVCWithScanResult:scanResult];
}

- (void)popAlertMsgWithScanResult:(NSString*)strResult
{
    if (!strResult) {
        
        strResult = @"识别失败";
    }
    
}

- (void)showNextVCWithScanResult:(LBXScanResult*)strResult
{
    NSLog(@"扫描结果:%@", strResult.strScanned);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

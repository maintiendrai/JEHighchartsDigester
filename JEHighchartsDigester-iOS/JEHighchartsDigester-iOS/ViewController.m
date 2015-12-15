//
//  ViewController.m
//  JEHighchartsDigesterDemo
//
//  Created by Diana on 11/17/15.
//  Copyright © 2015 maintiendrai. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController () {
    NSString* _htmlString;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.translucent = NO;
    [(UIScrollView *)[[self.webView subviews] objectAtIndex:0] setBounces:NO];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    [self htmlDigester];
}


//method 1, 直接操作html
- (void)htmlDigester {
    
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"JEHighchartsDigester.bundle/demo/html5/utilitybillAnalysis" ofType:@"html"];
    
    _htmlString  = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:htmlFile];
    
    
    [self.webView loadHTMLString:_htmlString baseURL:baseURL];
    [self.webView setBackgroundColor:[UIColor blueColor]];
    self.webView.delegate = self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}


//use when method1
- (void)loadDatas {
    //utilitybillAnalysis
     [self.webView stringByEvaluatingJavaScriptFromString:@"billPlotFill([['物业费', 23.5],['小区管理费', 13.5],['车辆监督', 17.5],['公摊啊费', 3.5],['垃圾清理', 5.5],['其它费用', 7.5]], 119.0, false)"];
    
    //combination 2
    //    [self.webView stringByEvaluatingJavaScriptFromString:@"plot([['物业费 <a>￥23.5', 23.5],['小区管理费 <a>￥13.5', 13.5],['车辆监督 <a>￥17.5', 17.5],['公摊啊费 <a>￥3.5', 3.5],['垃圾清理 <a>￥5.5', 5.5],['其它费用 <a>￥7.5', 7.5]])"];
    
//    [self.webView stringByEvaluatingJavaScriptFromString:@"combinationPlotFill([5, 35, 5, 12, 15, 20, 46, 66, 34, 62, 34, 13, 56, 46, 66, 34, 62, 34, 13, 56, 5, 35, 5, 12, 15, 20, 46, 66, 34, 62, 11], [['红外报警', 20],['煤气报警', 15]], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31])"];
    
  //  [self.webView stringByEvaluatingJavaScriptFromString:@"combinationPlotFill([5, 35, 5, 12, 15, 20, 46, 66, 34, 62, 34, 13, 56, 46, 66, 34, 62, 34, 13, 56, 5, 35, 5, 12, 15, 20, 46, 66, 34, 62, 11], [['3单元 梯口机11', 22],['3单元 梯口机12', 5],['3单元 梯口机14', 12],['3单元 梯口机17', 15],['3单元 梯口机19', 18]], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31])"];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self loadDatas];
    
}

@end

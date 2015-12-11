//
//  ViewController.m
//  JEHighchartsDigesterDemo
//
//  Created by Diana on 11/17/15.
//  Copyright © 2015 maintiendrai. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>



#define EMPTY_WEB_VIEW        @"<!DOCTYPE html>                             \
<html>                                      \
<head>                                  \
</head>                                 \
<body>                                  \
<div id=\"container\" style=\"width:%fpx;height:%fpx;position:absolute;top:50%%;margin-top:-%fpx;\">              \
</div>                              \
</body>                                 \
</html>"

@interface ViewController () {
    NSString* _htmlString;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self htmlDigester];
    
    
//    [self jsDigester];
}


//method 1, 直接操作html
- (void)htmlDigester {

//    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"combination-1" ofType:@"html"];
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"JEHighchartsDigester.bundle/demo/html5/combination-3" ofType:@"html"];
    
    _htmlString  = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:htmlFile];
    
    
    [self.webView loadHTMLString:_htmlString baseURL:baseURL];
    self.webView.delegate = self;
    
//    [self jsOnload];
    
}


- (void)jsOnload {
    
//    [self.webView stringByEvaluatingJavaScriptFromString:@"pp"];
//    NSString *commond = @"window.onload=function(){document.body.offsetHeight = 700px;};"; //no use
//
//    NSString *commond = @"$(document).ready(function(){document.getElementById(\"container\").style.height= 700 + \"px\"});";
//    NSString *commond = @"$(document).ready(function(){document.getElementById(\"container\").style.height = 700 + \"px\";});";
   
//    NSString *commond = @"window.onload=function(){document.getElementById(\"container\").style.height = 20 + \"px\";};";
    
//     NSString *commond = @"window.onload=function(){document.getElementById(\"container\").style.height = 700 + \"px\";};";
     NSString *commond = @"$(\"#container\").ready(function($){document.getElementById(\"container\").style.height= 700 + \"px\"})";
    
    
    
    [self.webView stringByEvaluatingJavaScriptFromString:commond];
}

//method 2, 直接操作js，html采用拼接
- (void)jsDigester {
    
    self.webView.delegate = self;
    
    NSString* format = EMPTY_WEB_VIEW;
    NSString* html = [NSString stringWithFormat:format,
                      self.view.bounds.size.width,
                      CGRectGetHeight(self.webView.frame),
                      CGRectGetHeight(self.webView.frame)/2.f];
    
    [self.webView loadHTMLString:html baseURL:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}



//use when method2
- (void)loadJSLibFiles {
    //load jquery.js
    NSString* jqueryPath = [[NSBundle mainBundle] pathForResource:@"jquery-1.9.0" ofType:@"js"];
    NSString* jquery = [NSString stringWithContentsOfFile:jqueryPath encoding:NSUTF8StringEncoding error:nil];
    [self.webView stringByEvaluatingJavaScriptFromString:jquery];
    
    //load highchart.js
    NSString* highChartPath = [[NSBundle mainBundle] pathForResource:@"highcharts" ofType:@"js"];
    NSString* highchart = [NSString stringWithContentsOfFile:highChartPath encoding:NSUTF8StringEncoding error:nil];
    [self.webView stringByEvaluatingJavaScriptFromString:highchart];
    
}

//load viewOption
- (void)loadViewOption {
    
    //load baseline
//    [self loadBaseline];
    
    //load combination
    [self loadCombination];

}



- (void)loadBaseline {
    NSString* baselinePath = [[NSBundle mainBundle] pathForResource:@"baseline" ofType:@"js"];
    NSString* baselineInit = [NSString stringWithContentsOfFile:baselinePath encoding:NSUTF8StringEncoding error:nil];
    
    
    NSString* xaxisPath = [[NSBundle mainBundle] pathForResource: @"xaxis" ofType: @"json"];
    NSString* xaxis = [NSString stringWithContentsOfFile:xaxisPath encoding: NSUTF8StringEncoding error:nil];
    
    
    NSString* dataPath = [[NSBundle mainBundle] pathForResource: @"data" ofType: @"json"];
    NSString* json = [NSString stringWithContentsOfFile:dataPath encoding: NSUTF8StringEncoding error:nil];
    
    NSString* theme = @"";
    NSString* baseline = [theme stringByAppendingFormat:baselineInit, xaxis, json];
    
    [self.webView stringByEvaluatingJavaScriptFromString:baseline];
}




- (void)loadCombination {
    NSString* donutPath = [[NSBundle mainBundle] pathForResource:@"combination-1" ofType:@"js"];
    NSString* donutInit = [NSString stringWithContentsOfFile:donutPath encoding:NSUTF8StringEncoding error:nil];
    NSString* dataPath = [[NSBundle mainBundle] pathForResource: @"combination-1" ofType: @"json"];
    NSString* json = [NSString stringWithContentsOfFile: dataPath encoding: NSUTF8StringEncoding error:nil];
    NSString* theme = @"";
    NSString* baseline = [theme stringByAppendingFormat:donutInit, json];
    
    [self.webView stringByEvaluatingJavaScriptFromString:baseline];
}


- (void)loadJSFiles {
    [self loadJSLibFiles];
    [self loadViewOption];
}


//use when method1
- (void)loadDatas {
    //combination 3
    [self.webView stringByEvaluatingJavaScriptFromString:@"billPlotFill([['物业费', 23.5],['小区管理费', 13.5],['车辆监督', 17.5],['公摊啊费', 3.5],['垃圾清理', 5.5],['其它费用', 7.5]], 119.0, false)"];
    
    //combination 2
//    [self.webView stringByEvaluatingJavaScriptFromString:@"plot([['物业费 <a>￥23.5', 23.5],['小区管理费 <a>￥13.5', 13.5],['车辆监督 <a>￥17.5', 17.5],['公摊啊费 <a>￥3.5', 3.5],['垃圾清理 <a>￥5.5', 5.5],['其它费用 <a>￥7.5', 7.5]])"];
    
 //   [self.webView stringByEvaluatingJavaScriptFromString:@"plot([5, 35, 5, 12, 15, 20, 46, 66, 34, 62, 34, 13, 56, 46, 66, 34, 62, 34, 13, 56, 5, 35, 5, 12, 15, 20, 46, 66, 34, 62, 11], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31])"];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    
//    [self jsOnload];
    //method 1
    [self loadDatas];
    
    //method 2
//    [self loadJSFiles];

}

@end

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
    
}


//method 1, 直接操作html
- (void)htmlDigester {

    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"donutLegend" ofType:@"html"];
    _htmlString  = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:htmlFile];
    
    [self.webView loadHTMLString:_htmlString baseURL:baseURL];
    self.webView.delegate = self;
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
    NSLog(@"viewWillLayoutSubviews");
}

- (void)runJavaScript
{
    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"donutLegend" ofType:@"html"];
//     NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"js"];
    NSString *scriptString = [NSString stringWithContentsOfFile:scriptPath encoding:NSUTF8StringEncoding error:nil];
    
    JSContext *context = [[JSContext alloc] init];
    
    
    [context evaluateScript:scriptString];
//    [context evaluateScript:@"function greet(name){ return 'Hello, ' + name; }"];
    
//    [context evaluateScript:@"function plots(data) {var chart = $('#container').highcharts();inCome = [0, 1, 2];chart.series[0].setData(inCome, true);  return 'Hello, ' + name; }"];

    
    JSValue *function = context[@"greet"];
    JSValue* result = [function callWithArguments:@[@"World"]];
    
//    NSLog(@"======================= %@", [result toString]);
    context[@"hello"] = ^(NSString *text) {
        NSLog(@"JS : %@",text);
    };
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
    
    
    //load viewOption
    //    NSString* donutPath = [[NSBundle mainBundle] pathForResource:@"donut" ofType:@"js"];
    
    
    
    //
    //    NSString* xaxisPath = [[NSBundle mainBundle] pathForResource: @"xaxis" ofType: @"json"];
    //    NSString* xaxis = [NSString stringWithContentsOfFile: xaxisPath encoding: NSUTF8StringEncoding error:nil];
    //
    
    //
    
    
//    NSString* donut = [theme stringByAppendingString:donutInit];
    
    
    

}

//load viewOption
- (void)loadViewOption {
    
    //load donutLegend
    [self loadDonutLegend];

}



- (void)loadBaseline {
    NSString* baselinePath = [[NSBundle mainBundle] pathForResource:@"baseline" ofType:@"js"];
    NSString* baselineInit = [NSString stringWithContentsOfFile:baselinePath encoding:NSUTF8StringEncoding error:nil];
    
    NSString* dataPath = [[NSBundle mainBundle] pathForResource: @"data" ofType: @"json"];
    NSString* json = [NSString stringWithContentsOfFile: dataPath encoding: NSUTF8StringEncoding error:nil];
    NSString* theme = @"";
    NSString* baseline = [theme stringByAppendingFormat:baselineInit, json];
    
    [self.webView stringByEvaluatingJavaScriptFromString:baseline];
}


- (void)loadDonutLegend {
    NSString* donutPath = [[NSBundle mainBundle] pathForResource:@"donutLegend" ofType:@"js"];
    NSString* donutInit = [NSString stringWithContentsOfFile:donutPath encoding:NSUTF8StringEncoding error:nil];
    NSString* dataPath = [[NSBundle mainBundle] pathForResource: @"data" ofType: @"json"];
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
    [self.webView stringByEvaluatingJavaScriptFromString:@"plot([0,1,2,3,4,5,6,7,8,9])"];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    //method 1
    [self loadDatas];
    
    //method 2
    [self loadJSLibFiles];

}

@end

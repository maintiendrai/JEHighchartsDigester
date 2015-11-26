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
    
    
    // Option 1: working
     NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"donutLegend" ofType:@"html"];
    _htmlString  = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
     NSURL *baseURL = [NSURL fileURLWithPath:htmlFile];
     
     [self.webView loadHTMLString:_htmlString baseURL:baseURL];
    
    self.webView.delegate = self;
    
    
    
    
    return;
    NSString* format = EMPTY_WEB_VIEW;
    NSString* html = [NSString stringWithFormat:format,
                      self.view.bounds.size.width,
                      CGRectGetHeight(self.webView.frame),
                      CGRectGetHeight(self.webView.frame)/2.f];
    
    
    
    NSBundle *thisBundle = [NSBundle mainBundle];
    NSString *path = [thisBundle pathForResource:@"donutLegend" ofType:@"html"];
//    NSURL *instructionsURL = [NSURL fileURLWithPath:path];

    
    [self.webView loadHTMLString:path baseURL:nil];
    
    
    
//    self.donutWebView.delegate = self;
//    [self.donutWebView loadHTMLString:html baseURL:nil];
//    
//    [self.donutWebView setBackgroundColor:[UIColor blueColor]];
    
    
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
//    [context evaluateScript: self.javascriptText.text];
    JSValue *function = context[@"greet"];
    JSValue* result = [function callWithArguments:@[@"World"]];
    
    NSLog(@"======================= %@", [result toString]);
    context[@"hello"] = ^(NSString *text) {
        NSLog(@"JS : %@",text);
    };
}


- (void)loadWeb {
    //load jquery.js
    NSString* jqueryPath = [[NSBundle mainBundle] pathForResource:@"jquery-1.9.0" ofType:@"js"];
    NSString* jquery = [NSString stringWithContentsOfFile:jqueryPath encoding:NSUTF8StringEncoding error:nil];
    [self.webView stringByEvaluatingJavaScriptFromString:jquery];
    
    //load highchart.js
    NSString* highChartPath = [[NSBundle mainBundle] pathForResource:@"highcharts" ofType:@"js"];
    NSString* highchart = [NSString stringWithContentsOfFile:highChartPath encoding:NSUTF8StringEncoding error:nil];
    [self.webView stringByEvaluatingJavaScriptFromString:highchart];
    
    //    //load viewOption
    //    NSString* baselinePath = [[NSBundle mainBundle] pathForResource:@"baseline" ofType:@"js"];
    //    NSString* baselineInit = [NSString stringWithContentsOfFile:baselinePath encoding:NSUTF8StringEncoding error:nil];
    //
    
    //load viewOption
    //    NSString* donutPath = [[NSBundle mainBundle] pathForResource:@"donut" ofType:@"js"];
    NSString* donutPath = [[NSBundle mainBundle] pathForResource:@"donutLegend" ofType:@"js"];
    NSString* donutInit = [NSString stringWithContentsOfFile:donutPath encoding:NSUTF8StringEncoding error:nil];
    NSString* theme = @"";
    
    //
    //    NSString* xaxisPath = [[NSBundle mainBundle] pathForResource: @"xaxis" ofType: @"json"];
    //    NSString* xaxis = [NSString stringWithContentsOfFile: xaxisPath encoding: NSUTF8StringEncoding error:nil];
    //
        NSString* dataPath = [[NSBundle mainBundle] pathForResource: @"data" ofType: @"json"];
        NSString* json = [NSString stringWithContentsOfFile: dataPath encoding: NSUTF8StringEncoding error:nil];
    //
    
        NSString* baseline = [theme stringByAppendingFormat:donutInit, json];
//    NSString* donut = [theme stringByAppendingString:donutInit];
    
    
    [self.webView stringByEvaluatingJavaScriptFromString:baseline];

}

- (void)test {
//    
//    JSContext *context = [[JSContext alloc] init];
//    [context evaluateScript:_htmlString];
//    JSValue *function = context[@"greet"];
//    JSValue* result = [function callWithArguments:@[@"World"]];
    
    [self.webView stringByEvaluatingJavaScriptFromString:@"plot([0,1,2,3,4,5,6,7,8,9])"];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    
    [self test];
//    [self loadWeb];
    
//    NSString* testPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"js"];
//    NSString* testInit = [NSString stringWithContentsOfFile:testPath encoding:NSUTF8StringEncoding error:nil];
//    
//    NSString* test = @"window.onload=function(){var chart = $('#container').highcharts();inCome = [0, 1, 2];chart.series[0].setData(inCome, true);}";
    
//    sleep(1);
    
//    NSString* theme = @"";
//    NSString* donut = [theme stringByAppendingString:testInit];
//    
//    [self.webView stringByEvaluatingJavaScriptFromString:donut];
    
//    [self.webView stringByEvaluatingJavaScriptFromString:test];
//    [self runJavaScript];
    
    
    
//    [self.donutWebView stringByEvaluatingJavaScriptFromString:donut];
}

@end

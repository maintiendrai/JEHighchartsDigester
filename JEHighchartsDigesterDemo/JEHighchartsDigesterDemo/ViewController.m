//
//  ViewController.m
//  JEHighchartsDigesterDemo
//
//  Created by Diana on 11/17/15.
//  Copyright © 2015 maintiendrai. All rights reserved.
//

#import "ViewController.h"

#define EMPTY_WEB_VIEW        @"<!DOCTYPE html>                             \
<html>                                      \
<head>                                  \
</head>                                 \
<body>                                  \
<div id=\"container\" style=\"width:%fpx;height:%fpx;position:absolute;left:50%%;top:50%%;margin-left:-%fpx;margin-top:-%fpx;\">              \
</div>                              \
</body>                                 \
</html>"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.webView.delegate = self;
    [self.view setBackgroundColor:[UIColor blueColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
    
    NSString* format = EMPTY_WEB_VIEW;
    NSString* html = [NSString stringWithFormat: format,
                      CGRectGetWidth(self.webView.frame),
                      CGRectGetHeight(self.webView.frame),
                      CGRectGetWidth(self.webView.frame)/2.f,
                      CGRectGetHeight(self.webView.frame)/2.f];
    
    [self.webView loadHTMLString: html baseURL: nil];
    
    
    
    /* Option 1: working
     NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"graph" ofType:@"html"];
     NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
     NSURL *baseURL = [NSURL fileURLWithPath:htmlFile];
     
     [self.webView loadHTMLString:htmlString baseURL:baseURL];
     */
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    
    //load jquery.js
    NSString* jqueryPath = [[NSBundle mainBundle] pathForResource:@"jquery-1.9.0" ofType:@"js"];
    NSString* jquery = [NSString stringWithContentsOfFile:jqueryPath encoding:NSUTF8StringEncoding error:nil];
    [self.webView stringByEvaluatingJavaScriptFromString:jquery];
    
    //load highchart.js
    NSString* highChartPath = [[NSBundle mainBundle] pathForResource:@"highcharts" ofType:@"js"];
    NSString* highchart = [NSString stringWithContentsOfFile:highChartPath encoding:NSUTF8StringEncoding error:nil];
    [self.webView stringByEvaluatingJavaScriptFromString:highchart];
    
    //load viewOption
    NSString* baselinePath = [[NSBundle mainBundle] pathForResource:@"baseline" ofType:@"js"];
    NSString* formatInit = [NSString stringWithContentsOfFile:baselinePath encoding:NSUTF8StringEncoding error:nil];
    
    
    NSString* dataPath = [[NSBundle mainBundle] pathForResource: @"data" ofType: @"json"];
    NSString* json = [NSString stringWithContentsOfFile: dataPath encoding: NSUTF8StringEncoding error:nil];
    
    NSString* theme = @"";
    NSString* graph = [theme stringByAppendingFormat:formatInit, json];

    
    
    [self.webView stringByEvaluatingJavaScriptFromString:graph];
    
}

@end

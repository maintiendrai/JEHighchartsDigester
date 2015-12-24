//
//  ViewController.h
//  JEHighchartsDigesterDemo
//
//  Created by Diana on 11/17/15.
//  Copyright © 2015 maintiendrai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface UIImage (Extension)
+ (UIImage*)imageWithColor:(UIColor* )color;
@end

@interface ViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UIWebView* webView;
//@property (nonatomic, strong) IBOutlet UIWebView* donutWebView;

@end


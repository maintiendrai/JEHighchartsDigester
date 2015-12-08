JEHighChartsDigester
=============

JEHighchartsDigester is a html5 chart highcharts framework for iOS and Android

## About Highcharts
- [Demo](http://www.highcharts.com/demo)
- [API References](http://api.highcharts.com/highcharts)


# iOS Highcharts Sample
该DEMO主要用于演示iOS APP中用UIWebView展示highCharts，如下是演示图
![image](https://github.com/maintiendrai/JEHighchartsDigester/blob/master/combination-2.gif)


## prepare

在了解该原理之前，需要知道如下内容
* javascript与objc交互

在iOS APP开发过程中，是通过UIWebView来加载html页面，因此javascript要与objc交互，桥梁应该就在UIWebview提供的API中，通过查找，发现如下一些接口:
<pre>
//objc 传参给javascript
- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script;

//javascript 传参给objc， 参数是存在于request中
 - (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
</pre>


### License

此SDK采用MIT许可.

###Contact

联系方式: maintiendrai@gmail.com


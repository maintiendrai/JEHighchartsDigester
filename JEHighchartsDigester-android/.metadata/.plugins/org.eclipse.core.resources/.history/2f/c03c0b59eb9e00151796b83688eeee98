package com.maintiendrai.highchartdemo;

import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends Activity {

    private static final String LOG_TAG = MainActivity.class.getSimpleName();
    private WebView mWebview;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mWebview = (WebView) findViewById(R.id.webview);

        mWebview.getSettings().setJavaScriptEnabled(true);
        mWebview.setWebChromeClient(new WebChromeClient());
        mWebview.loadUrl("file:///android_asset/combination-2.html");
        //mWebview.loadUrl("file:///android_asset/index.html");

        mWebview.setWebViewClient(new WebViewClient() {

            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                mWebview.loadUrl("javascript:plot([['物业费 <a>￥23.5', 23.5],['小区管理费 <a>￥113.5', 113.5],['车辆监督 <a>￥7.5', 7.5],['公摊啊费 <a>￥7.5', 7.5],['垃圾清理 <a>￥7.5', 7.5],['其它费用 <a>￥7.5', 7.5]])");
                //mWebview.loadUrl("javascript:createChart()");
            }
        });
    }

}

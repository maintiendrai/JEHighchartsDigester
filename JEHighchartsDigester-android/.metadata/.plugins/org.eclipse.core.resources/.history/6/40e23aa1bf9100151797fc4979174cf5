package ro.stemo.highchartdemo;

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
        mWebview.loadUrl("file:///android_asset/test.html");
        //mWebview.loadUrl("file:///android_asset/index.html");

        mWebview.setWebViewClient(new WebViewClient() {

            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                mWebview.loadUrl("javascript:plot([0,1,2,3,4,5,6,7,8,9],['S1','S2','S3','S4','S5','S6','S7','S8','S9'])");
                //mWebview.loadUrl("javascript:createChart()");
            }
        });
    }

}

# WebviewTest
使用随机数设置进度条展示

    func webViewDidStartLoad(webView: UIWebView) {
        progress.hidden = false//展示进度条
        progress.setProgress(1.0, animated: true)//设置进度条动画
        print("start")
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        progress.setProgress(1.0, animated: true)//加载完成，恢复初始值
        print("finished")
        progress.hidden = true//隐藏进度条
        self.title = webview.stringByEvaluatingJavaScriptFromString("document.title")
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("failed")
        let random = arc4random() % 10
        let pgs = Float(random)/10.0
        progress.setProgress(pgs, animated: true)//加载失败时，使用随机数展示进度条加载
    
//        progress.hidden = true
    }

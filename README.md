# WebviewTest
在ViewController中，
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
在WKViewController中，使用WKWebView加载网页
    var webView : WKWebView!
    var urlString = ""

    override func loadView() {
        let webConfiguratiojn = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguratiojn)
        webView.UIDelegate = self
        webView.navigationDelegate = self
        view = webView

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL = NSURL.init(string: urlString)
        let myRequest = NSURLRequest.init(URL: myURL!)
        webView.loadRequest(myRequest)


    }
在WKWebViewController中，加载显示进度条：
添加管吃者
        webView!.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.New, context: nil)


    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "loading" {

        }else if keyPath == "title" {
            self.title = self.webView!.title
        } else if keyPath == "URL" {

        }else if keyPath == "estimatedProgress" {
            self.progressBar!.progress = Float(self.webView!.estimatedProgress)
        }
        if object?.isKindOfClass(WKWebView) == true && keyPath! == "estimatedProgress" {
            let newprogress = Float((self.webView?.estimatedProgress)!)

            if newprogress == 1.0 {
                self.progressBar!.hidden = true
                self.progressBar!.setProgress(0.0, animated: false)
            }else{
                self.progressBar!.hidden = false
                self.progressBar!.setProgress(0.5, animated: true)
            }

        }

    }

    deinit {

        webView?.removeObserver(self, forKeyPath: "estimatedProgress")
    }


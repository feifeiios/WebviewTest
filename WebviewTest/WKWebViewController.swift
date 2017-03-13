//
//  WKWebViewController.swift
//  WebviewTest
//
//  Created by Zzcz on 2017/3/13.
//  Copyright © 2017年 fly. All rights reserved.
//

import UIKit
import WebKit
class WKWebViewController: UIViewController , WKUIDelegate {

    var webView : WKWebView?
    var urlString = ""
    var progressBar : UIProgressView?
    
    var loadCount : Int = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.grayColor()
        let rect = UIScreen.mainScreen().bounds
        let webConfiguratiojn = WKWebViewConfiguration()

        webView = WKWebView(frame: .zero, configuration: webConfiguratiojn)
        webView!.frame = CGRectMake(0.0, 0.0, rect.width, rect.height)
        webView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(webView!)
        progressBar = UIProgressView()
        progressBar!.frame = CGRectMake(0.0, 64.0, rect.width, 2)
        view.addSubview(progressBar!)
        webView!.UIDelegate = self
        let request = NSURLRequest.init(URL: NSURL.init(string: urlString)!)
        webView!.loadRequest(request)

        webView!.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.New, context: nil)

    }
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "loading" {
            
        }else if keyPath == "title" {
            self.title = self.webView!.title
        } else if keyPath == "URL" {
            
        }else if keyPath == "estimatedProgress" {
            self.progressBar!.progress = Float(self.webView!.estimatedProgress)
        }
        if object?.isKindOfClass(WKWebView) == true && keyPath! == "estimatedProgress" {
//            var newprogress = change?.indexForKey(NSKeyValueChangeNewKey)
//            print(newprogress)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    deinit {
    
        webView?.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

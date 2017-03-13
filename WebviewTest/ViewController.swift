//
//  ViewController.swift
//  WebviewTest
//
//  Created by Zzcz on 2017/3/13.
//  Copyright © 2017年 fly. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIWebViewDelegate{
   
    @IBOutlet weak var webview: UIWebView!
    
    @IBOutlet weak var urlLable: UILabel!

    var urlstring = ""
 
    @IBOutlet weak var progress: UIProgressView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        urlLable.text = urlstring
        webview.delegate = self
        let request = NSURLRequest.init(URL: NSURL.init(string: urlstring)!)
        webview.loadRequest(request)
        webview.backgroundColor = UIColor.grayColor()
        
        
    }

    func webViewDidStartLoad(webView: UIWebView) {
        progress.hidden = false
        progress.setProgress(1.0, animated: true)
        print("start")
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        progress.setProgress(1.0, animated: true)
        print("finished")
        progress.hidden = true
        self.title = webview.stringByEvaluatingJavaScriptFromString("document.title")
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("failed")
        let random = arc4random() % 10
        let pgs = Float(random)/10.0
        progress.setProgress(pgs, animated: true)
    
//        progress.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


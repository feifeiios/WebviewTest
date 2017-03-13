//
//  WKViewController.swift
//  WebviewTest
//
//  Created by Zzcz on 2017/3/13.
//  Copyright © 2017年 fly. All rights reserved.
//

import UIKit
import WebKit
class WKViewController: UIViewController,WKUIDelegate ,WKNavigationDelegate{

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
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

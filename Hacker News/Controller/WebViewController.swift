//
//  WebViewController.swift
//  Hacker News
//
//  Created by User on 2/10/20.
//  Copyright © 2020 jonathanking. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var urlString: String?
    
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.allowsBackForwardNavigationGestures = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadWebView()
    }
    
    fileprivate func loadWebView() {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        let requst = URLRequest(url: url)
        webView.load(requst)
    }

}

extension WebViewController {
    
    // Show and hide toolbar
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setToolbarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setToolbarHidden(true, animated: true)
    }
    
}

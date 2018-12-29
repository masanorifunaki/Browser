//
//  ViewController.swift
//  Browser
//
//  Created by 舟木正憲 on 2018/12/29.
//  Copyright © 2018 masanori. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // URL の文字列をURL型に変換
        // 変換した結果オプショナル型になる
        // nil の可能性があり、それを防ぐため、
        // if を使って、値が nil ではないときに実行するようにし、
        // if let url = と書くことで、オプショナル型ではなくなり、url 型が入る
        if let url = URL(string: "http://www.google.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }

        webView.navigationDelegate = self
    }

    @IBAction func reloadTapped(sender: UIButton) {
        webView.reload()
    }

    @IBAction func backTapped(sender: UIButton) {
        webView.goBack()
    }

    @IBAction func forwardTapped(sender: UIButton) {
        webView.goForward()
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start...")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finish!")
    }
}


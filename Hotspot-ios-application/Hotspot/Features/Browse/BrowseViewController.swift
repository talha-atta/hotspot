//
//  BrowseViewController.swift
//  Hotspot
//
//  Created by Thayallan Srinathan on 2019-04-28.
//  Copyright © 2019 Hotspot. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class BrowseViewController: UIViewController {
    
    let headerView = HomeHeaderView()
    let sites = Websites()
    
    let textfield = TextField(placeholder: "Search a site")
    
    let webview = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfield.delegate = self

        
        layoutViews()
    }
}

extension BrowseViewController {
    func layoutViews() {
        view.addSubview(headerView)
        headerView.easy.layout(Top(), Width(375), Height(100))
        
        view.addSubview(textfield)
        textfield.easy.layout(Left(30), Right(30), Width(280), Height(35), Top(15).to(headerView))
        
        view.addSubview(webview)
        webview.easy.layout(Top().to(textfield), Width(375), Height(4000), Bottom())
        
        
    }
}

extension BrowseViewController: TextFieldDelegate {
    func textFieldShouldReturn(_ textField: TextField) -> Bool {
        if textfield.text == "Google.com"{
            sleep(4)
            var htmlCode = sites.google
            webview.loadHTMLString(htmlCode, baseURL: nil)

        }
        else if textfield.text == "Facebook.com" {
            sleep(4)
            var htmlCode = sites.facebook
            webview.loadHTMLString(htmlCode, baseURL: nil)

        }
        else if textfield.text == "Wikipedia.org"{
            sleep(4)
            var htmlCode = sites.wikipedia
            webview.loadHTMLString(htmlCode, baseURL: nil)

        }
        else if textField.text == "Wikipedia.org/wiki/internet"{
            sleep(5)
            var htmlCode = sites.wikipediaInternet
            webview.loadHTMLString(htmlCode, baseURL: nil)
        }
        else {
            sleep(6)
            var htmlCode = """
            <div class="container">
            
            <div class="terminal">
            <p class="prompt">ERROR 404 NOT FOUND</p>
            <p class="prompt output new-output"></p>
            </div>
            </div>
            """
            webview.loadHTMLString(htmlCode, baseURL: nil)

        }
        return true
    }
}

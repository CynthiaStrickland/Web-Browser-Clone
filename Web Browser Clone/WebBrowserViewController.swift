//
//  WebBrowserViewController.swift
//  UdemyIOS9
//
//  Created by Cynthia Whitlatch on 10/11/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class WebBrowserViewController: UIViewController, UITextFieldDelegate {
  
  var address = String()
  
  @IBOutlet weak var webAddress: UITextField!
  @IBOutlet weak var webView: UIWebView!
  
  
  @IBAction func goPressed(sender: AnyObject) {
    webAddress.resignFirstResponder()
    loadWebPage()
  }
  
  @IBAction func leftPressed(sender: AnyObject) {
    webView.goBack()
  }
  
  @IBAction func rightPressed(sender: AnyObject) {
    webView.goForward()
  }
  
  @IBAction func zoomInPressed(sender: AnyObject) {
    webView.scrollView.zoomScale += 0.1

  }
  
  @IBAction func zoomOutPressed(sender: AnyObject) {
    webView.scrollView.zoomScale -= 0.1

  }

    override func viewDidLoad() {
        super.viewDidLoad()

      webAddress.delegate = self
      webView.scalesPageToFit = true
      
    }

  func loadWebPage() {
    if webAddress.text != "" {
      
      address = address.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
      address = self.webAddress.text!
      
      if address.hasPrefix("www.") {
        address = "https://" + address
      }else if !address.hasPrefix("https://") {
        address = "https://" + address
      }
      
      let url = NSURL(string: address)
      let request = NSURLRequest(URL: url!)
      webView.loadRequest(request)
      
    }
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    webAddress.resignFirstResponder()
    loadWebPage()
    return true
    
  }

}

//
//  TrailerWebView.swift
//  Flix
//
//  Created by Hao Qin on 2/27/21.
//

import UIKit
import WebKit

class TrailerWebView: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    
    var movie: [String:Any]!
    
    var videos = [[String:Any]]()
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieID = movie["id"]
        let myURL = URL(string:"https://api.themoviedb.org/3/movie/\(String(describing: movieID!))/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")
        let myRequest = URLRequest(url: myURL!)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: myRequest) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            self.videos = dataDictionary["results"] as! [[String:Any]]
            let key = self.videos[0]["key"] as! String
            let videoURL = URL(string: "https://www.youtube.com/watch?v=\(key)")!
            let videoRequest = URLRequest(url: videoURL)
            self.webView.load(videoRequest)
           }
        }
        task.resume()

    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
